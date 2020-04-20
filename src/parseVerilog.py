import re
import code
import tempfile
import networkx as nx
from subprocess import PIPE,run

def parse(path):
	top = path.split('/')[-1].replace('.v','')
	with open(path, 'r') as f:
		data = f.read()
	return verilog2gates(data)

def verilog2gates(verilog):
	G = nx.DiGraph()

	# handle gates
	regex = "(or|nor|and|nand|not|xor|xnor)\s+\S+\s*\((.+?)\);"
	for gate, net_str in re.findall(regex,verilog,re.DOTALL):

		# parse all nets
		nets = net_str.replace(" ","").replace("\n","").replace("\t","").split(",")
		output = nets[0]
		inputs = nets[1:]

		# add to graph
		G.add_edges_from((net,output) for net in inputs)
		G.nodes[output]['gate'] = gate

	# handle assigns
	assign_regex = "assign\s+(.+?)\s*=\s*(.+?);"
	for n0, n1 in re.findall(assign_regex,verilog):
		output = n0.replace(' ','')
		inpt = n1.replace(' ','')
		G.add_edge(inpt,output)
		G.nodes[output]['gate'] = 'buf'

	for n in G.nodes():
		if 'gate' not in G.nodes[n]:
			G.nodes[n]['gate'] = 'input'

	# get outputs
	for n in G.nodes:
		G.nodes[n]['output'] = False
	out_regex = "output\s(.+?);"
	for net_str in re.findall(out_regex,verilog,re.DOTALL):
		nets = net_str.replace(" ","").replace("\n","").replace("\t","").split(",")
		for net in nets:
			G.nodes[net]['output'] = True

	G = nx.relabel_nodes(G, lambda n: n.replace('[','_').replace(']','_'))
	return G

def gates2dimacs(c):
	net_map = {}
	for n in c.nodes:
		if n not in net_map:
			net_map[n] = len(net_map)+1

	clauses = []
	for n in c.nodes:
		if c.nodes[n]['gate'] == 'and':
			exp = [net_map[n]]
			for inp in c.predecessors(n):
				clauses.append([-net_map[n],net_map[inp]])
				exp += [-net_map[inp]]
			clauses.append(exp)

		elif c.nodes[n]['gate'] == 'nand':
			exp = [-net_map[n]]
			for inp in c.predecessors(n):
				clauses.append([net_map[n],net_map[inp]])
				exp += [-net_map[inp]]
			clauses.append(exp)

		elif c.nodes[n]['gate'] == 'or':
			exp = [-net_map[n]]
			for inp in c.predecessors(n):
				clauses.append([net_map[n],-net_map[inp]])
				exp += [net_map[inp]]
			clauses.append(exp)

		elif c.nodes[n]['gate'] == 'nor':
			exp = [net_map[n]]
			for inp in c.predecessors(n):
				clauses.append([-net_map[n],-net_map[inp]])
				exp += [net_map[inp]]
			clauses.append(exp)

		elif c.nodes[n]['gate'] == 'not':
			clauses.append([net_map[n],net_map[list(c.predecessors(n))[0]]])
			clauses.append([-net_map[n],-net_map[list(c.predecessors(n))[0]]])

		elif c.nodes[n]['gate'] == 'buf':
			clauses.append([net_map[n],-net_map[list(c.predecessors(n))[0]]])
			clauses.append([-net_map[n],net_map[list(c.predecessors(n))[0]]])

		elif c.nodes[n]['gate'] == 'xor':
			nets = list(c.predecessors(n))
			while len(nets)>2:
				#create new net
				new_net = nets[-2]+nets[-1]
				net_map[new_net] = len(net_map)+1

				# add constraints
				clauses.append([-net_map[new_net],-net_map[nets[-1]],-net_map[nets[-2]]])
				clauses.append([-net_map[new_net],net_map[nets[-1]],net_map[nets[-2]]])
				clauses.append([net_map[new_net],-net_map[nets[-1]],net_map[nets[-2]]])
				clauses.append([net_map[new_net],net_map[nets[-1]],-net_map[nets[-2]]])

				# remove last 2 nets
				nets = nets[:-2]

				# insert before out
				nets.insert(0,new_net)

			# add constraints
			clauses.append([-net_map[n],-net_map[nets[-1]],-net_map[nets[-2]]])
			clauses.append([-net_map[n],net_map[nets[-1]],net_map[nets[-2]]])
			clauses.append([net_map[n],-net_map[nets[-1]],net_map[nets[-2]]])
			clauses.append([net_map[n],net_map[nets[-1]],-net_map[nets[-2]]])

		elif c.nodes[n]['gate'] == 'xnor':
			nets = list(c.predecessors(n))
			while len(nets)>2:
				#create new net
				new_net = nets[-2]+nets[-1]
				net_map[new_net] = len(net_map)+1

				# add constraints
				clauses.append([-net_map[new_net],-net_map[nets[-1]],-net_map[nets[-2]]])
				clauses.append([-net_map[new_net],net_map[nets[-1]],net_map[nets[-2]]])
				clauses.append([net_map[new_net],-net_map[nets[-1]],net_map[nets[-2]]])
				clauses.append([net_map[new_net],net_map[nets[-1]],-net_map[nets[-2]]])

				# remove last 2 nets
				nets = nets[:-2]

				# insert before out
				nets.insert(0,new_net)

			#create new net
			new_net = n+'_xnor'
			net_map[new_net] = len(net_map)+1

			# add constraints
			clauses.append([-net_map[new_net],-net_map[nets[-1]],-net_map[nets[-2]]])
			clauses.append([-net_map[new_net],net_map[nets[-1]],net_map[nets[-2]]])
			clauses.append([net_map[new_net],-net_map[nets[-1]],net_map[nets[-2]]])
			clauses.append([net_map[new_net],net_map[nets[-1]],-net_map[nets[-2]]])
			clauses.append([net_map[n],net_map[new_net]])
			clauses.append([-net_map[n],-net_map[new_net]])

		elif c.nodes[n]['gate'] == '0':
			clauses.append([-net_map[n]])

		elif c.nodes[n]['gate'] == '1':
			clauses.append([net_map[n]])

		elif c.nodes[n]['gate'] == 'input':
			pass

		else:
			print(f"unknown gate type: {c.nodes[n]['gate']}")
			code.interact(local=locals())

	return clauses,net_map

def gates2verilog(c):
	inputs = []
	outputs = []
	insts = []
	wires = []

	for n in c.nodes:
		if c.nodes[n]['gate'] not in ['0','1','input']:
			fanin = ','.join(p for p in c.predecessors(n))
			insts.append(f"{c.nodes[n]['gate']} g_{len(insts)} ({n},{fanin})")
			wires.append(n)
			if c.nodes[n]['output']: outputs.append(n)
		elif c.nodes[n]['gate'] in ['0','1']:
			insts.append(f"assign {n} = 1'b{c.nodes[n]['gate']};")
		elif c.nodes[n]['gate'] in ['input']:
			inputs.append(n)
			wires.append(n)
		else:
			print(f"unknown gate type: {c.nodes[n]['gate']}")
			return

	verilog = 'module dut ('+','.join(inputs+outputs)+');\n'
	verilog += ''.join(f'input {inp};\n' for inp in inputs)
	verilog += ''.join(f'output {out};\n' for out in outputs)
	verilog += ''.join(f'wire {wire};\n' for wire in wires)
	verilog += ''.join(f'{inst};\n' for inst in insts)
	verilog += 'endmodule\n'

	return verilog

def syn_gates(c):
	v = gates2verilog(c)

	with tempfile.NamedTemporaryFile() as tmp:
		cmd = ['genus','-execute',f"""set_db / .library $env(GENUS_DIR)/share/synth/tutorials/tech/tutorial.lib;
				read_hdl -sv {tmp.name};
				elaborate;
				syn_generic;
				syn_map;
				write_hdl -generic;
				exit;"""]
		tmp.write(bytes(v,'ascii'))
		result = run(cmd,stdout=PIPE,stderr=PIPE,universal_newlines=True)

	regex = "(module.*endmodule)"
	m = re.search(regex,result.stdout,re.DOTALL)
	v_syn = m.group(1)

	return verilog2gates(v_syn)

if __name__=='__main__':
	c = parse('circuits/c432.v')
	syn_gates(c)



