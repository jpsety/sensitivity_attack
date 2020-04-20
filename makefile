
locked/ttlock_%.v : src/ttlock.tcl 
	genus -files src/ttlock.tcl \
		-log locked/ttlock_$*.log -overwrite \
		-execute "set top $*" -no_gui

break/%.key : locked/%.v src/sen_attack.py
	mkdir break -p
	python src/sen_attack.py locked/$*.v locked/$*.key

sensitivities.p : src/sen_char.py
	python src/sen_char.py

