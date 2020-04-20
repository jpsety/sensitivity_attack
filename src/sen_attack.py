# this script is an example implementation of the sensitivity-based attack on TT-Lock

import code
import sys
from parseVerilog import *
from random import sample
from pysat.solvers import Cadical
from pysat.card import ITotalizer

# read locked circuit
c = parse(sys.argv[1])

# read key
# here we are reading the key directly, however
# in a true attack scenario the oracle would be queried to
# see if the input found creates a flipped output response
with open(sys.argv[2],'r') as f:
	key = list(map(lambda k : k=='1',reversed(f.read().split('b')[1].replace('\n',''))))

# build sensitivity circuit
protected_inputs = [n for n in c.nodes if c.nodes[n]['gate']=='input' and 'protected' in n]
other_inputs = [n for n in c.nodes if c.nodes[n]['gate']=='input' and 'other' in n]

flip_outputs = []
c_copy = c.copy()
for inp in protected_inputs:

	# add copy of circuit
	c_f = nx.relabel_nodes(c_copy,{n:f'flip_{inp}_{n}' for n in c_copy.nodes})
	c.update(c_f)

	# connect protected inputs
	for inp_con in protected_inputs:
		if inp_con==inp:
			c.nodes[f'flip_{inp}_{inp_con}']['gate'] = 'not'
		else:
			c.nodes[f'flip_{inp}_{inp_con}']['gate'] = 'buf'
		c.add_edge(inp_con,f'flip_{inp}_{inp_con}')

	# connect other inputs
	for inp_con in other_inputs:
		c.nodes[f'flip_{inp}_{inp_con}']['gate'] = 'buf'
		c.add_edge(inp_con,f'flip_{inp}_{inp_con}')

	# add output xnor
	c.add_node(f'flip_{inp}_output_xnor',gate='xnor')
	c.add_edge(f'flip_{inp}_out',f'flip_{inp}_output_xnor')
	c.add_edge('out',f'flip_{inp}_output_xnor')
	flip_outputs.append(f'flip_{inp}_output_xnor')

# get dimacs
clauses,net_map = gates2dimacs(c)

# encode sensitivity value
it = ITotalizer(
		lits=[net_map[n] for n in flip_outputs],
		top_id=len(net_map),
		ubound=len(protected_inputs))
solver = Cadical(bootstrap_with=clauses+it.cnf.clauses)

# find max sensitivity input, check
n_eq = 0
while n_eq<len(protected_inputs):
	if solver.solve(assumptions=[-it.rhs[n_eq]]):
		# get input output
		m = solver.get_model()
		inp = {i:m[net_map[i]-1]>0 for i in protected_inputs}
		s = (len(protected_inputs)-n_eq)/len(protected_inputs)
		print(f'found input w/ sensitivity {s}')

		# check input against key
		if all(inp[f'protected_in_{i}_']==k for i,k in enumerate(key)):
			sensitivity = (len(protected_inputs)-n_eq)/len(protected_inputs)
			print(f'found correct key at sensitivity {sensitivity}')
			with open(sys.argv[1].replace('locked/','break/').replace('.v','.key'),'w') as f:
				f.write(f'{len(key)}b'+''.join('1' if inp[f'protected_in_{i}_'] else '0' for i,k in enumerate(key))[::-1])
			exit()
		else:
			solver.add_clause([net_map[i] if not inp[i] else -net_map[i] for i in protected_inputs])
	else:
		s = (len(protected_inputs)-n_eq)/len(protected_inputs)
		print(f'no more inputs w/ sensitivity {s}')
		n_eq += 1


print('0 sensitivity reached, no key found')

