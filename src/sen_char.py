# this script characterizes the sensitivities of the generic verilog circuits in ./circuits

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import code
from pebble import ProcessPool
from parseVerilog import *
from os import listdir,cpu_count
from os.path import isfile, join
from random import sample
from pysat.solvers import Cadical
from pysat.card import ITotalizer

# split circuits
def split_circuit(c):
	return {n:c.subgraph(nx.ancestors(c,n)|set([n])).copy() for n in c.nodes if c.nodes[n]['output']}

# build sensitivity circuit
def build_sensitivity_encoding(c,output,f):
	inputs = [n for n in c.nodes if c.nodes[n]['gate']=='input']
	flip_outputs = []
	c_copy = c.copy()
	for inp in inputs:
		# add copy of circuit
		c_f = nx.relabel_nodes(c_copy,{n:f'flip_{inp}_{n}' for n in c_copy.nodes})
		c.update(c_f)

		# connect inputs
		for inp_con in inputs:
			if inp_con==inp:
				c.nodes[f'flip_{inp}_{inp_con}']['gate'] = 'not'
			else:
				c.nodes[f'flip_{inp}_{inp_con}']['gate'] = 'buf'
			c.add_edge(inp_con,f'flip_{inp}_{inp_con}')

		# add output xnor
		c.add_node(f'flip_{inp}_output_xnor',gate='xnor')
		c.add_edge(f'flip_{inp}_{output}',f'flip_{inp}_output_xnor')
		c.add_edge(output,f'flip_{inp}_output_xnor')
		flip_outputs.append(f'flip_{inp}_output_xnor')

	# get dimacs
	clauses,net_map = gates2dimacs(c)

	model = {'inputs':inputs,
			'input_len':len(inputs),
			'circuit':f.replace('.v',''),
			'output':output,
			'flip_outputs':flip_outputs,
			'clauses':clauses,
			'net_map':net_map}

	return model


# sensitivity
def calc_sensitivity(model):
	n_eq = 0
	it = ITotalizer(
			lits=[model['net_map'][n] for n in model['flip_outputs']],
			top_id=len(model['net_map']),
			ubound=len(model['inputs']))
	solver = Cadical(bootstrap_with=model['clauses']+it.cnf.clauses)
	while True:
		if solver.solve(assumptions=[-it.rhs[n_eq]]):
			break
		else:
			n_eq += 1

		if n_eq == len(model['inputs']):
			print('0 sensitivity reached')
			exit()

	model['sensitivity'] = (len(model['inputs'])-n_eq)/len(model['inputs'])


# average sensitivity
def calc_avg_sensitivity(model,n=100):
	solver = Cadical(bootstrap_with=model['clauses'])
	s = 0
	for i in range(n):
		input_vals = [model['net_map'][inp]*sample([-1,1],1)[0] for inp in model['inputs']]
		solver.solve(assumptions=input_vals)
		m = solver.get_model()
		s += sum([m[model['net_map'][o]-1]<0 for o in model['flip_outputs']])/len(model['inputs'])

	model['avg_sensitivity'] = s/n


# run model
def run_model(params):
	c,output,f = params
	print(f'running: {f} {output}')
	model = build_sensitivity_encoding(c,output,f)
	calc_sensitivity(model)
	calc_avg_sensitivity(model)
	return {'Input Width':model['input_len'],
			'Sensitivity':model['sensitivity'],
			'Average Sensitivity':model['avg_sensitivity'],
			'Circuit':model['circuit']}


if __name__=='__main__':
	# parse circuits
	print('parsing circuits')
	#circuits = {f:parse(f'circuits/{f}') for f in listdir('circuits')}
	circuits = {f:parse(f'circuits/{f}') for f in ['c432.v','c7552.v']}

	print('spliting circuits')
	split_circuits = {f:split_circuit(c) for f,c in circuits.items()}

	print('calculating sensitivities')
	params = []
	for f,splits in split_circuits.items():
		for output,c in splits.items():
			params.append((c,output,f))

	with ProcessPool(max_workers=int(cpu_count()*.5)) as pool:
		results = pool.map(run_model,params)

	# plot
	df = pd.DataFrame()
	for result in results:
		df = df.append(result,ignore_index=True)
	print(df)
	with open('sensitivities.p','wb') as f:
		pickle.dump(df,f)

	df = df.astype({'input_len':int})
	g = sns.scatterplot(data=df,x='Input Width',y='Sensitivity',hue='Circuit')
	plt.ylim(0, 1)
	plt.show()

	g = sns.scatterplot(data=df,x='Input Width',y='Avereage Sensitivity',hue='Circuit')
	plt.ylim(0, 1)
	plt.show()

