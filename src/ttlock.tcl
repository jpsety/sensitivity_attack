# TTLock* implementation
# Joe Sweeney, 1/6/2020

set args [split $top "_"]
set top [lindex $args 0]
set WKEY [lindex $args 1]

### Load tech files ###
set_db / .library $env(GENUS_DIR)/share/synth/tutorials/tech/tutorial.lib

### Load RTL ###
read_hdl -sv circuits/${top}.v
elaborate $top 
current_design $top
init_design
update_names -map [list [list $top DUT]] -design

### find output large enough ###
set outs [get_db ports -if .direction==out]
set potential_outs {}
foreach out $outs {
	set nfanin [llength [all_fanin -startpoints_only -to $out]]
	if {$WKEY<$nfanin} {
		lappend potential_outs $out
	}
}
if {[llength $potential_outs]==0} {
	puts "no input large enough"
	exit 1
}

set out [get_db [lindex $potential_outs [expr int(rand()*[llength potential_outs])]] .base_name]
set WINPUT [llength [all_fanin -startpoints_only -to $out]]

################## reduce to fanin cone ######################
# get fanin inputs
set fanin [all_fanin -to $out -startpoints_only]

# remove non essential io
create_port_bus -name in -input -left_bit [expr $WINPUT-1] -right_bit 0
create_port_bus -name out -output
connect $out out
set i 0 
foreach input $fanin {
	connect $input in\[$i\]
	incr i
}
set other_ports [get_db ports -if .base_name!=in*&&.base_name!=out]
foreach other_port $other_ports {disconnect $other_port}
delete_unloaded_undriven -all DUT

#remove gates
syn_generic

# write to file
write_hdl > locked/ttlock_${top}_${out}.v
delete_obj design:DUT

### Load ttlock_wrapper ###
read_hdl -sv [list src/ttlock_wrapper.sv locked/ttlock_${top}_${out}.v]
elaborate ttlock_wrapper -parameters [list [list WKEY $WKEY] [list WINPUT $WINPUT]]
current_design ttlock_wrapper_WKEY${WKEY}_WINPUT${WINPUT}
init_design
update_names -map [list [list ttlock_wrapper_WKEY${WKEY}_WINPUT${WINPUT} DUTLock]] -design

# generate key
set key ""
for {set i 0} {$i<$WKEY} {incr i} {append key [expr int(rand()>.5)]}	
set rkey ""
for {set i 0} {$i<$WKEY} {incr i} {set rkey [string index $key $i]$rkey}	
set rkey "$WKEY'b$rkey"
echo $rkey > locked/ttlock_${top}_$WKEY.key

# connect keys
for {set i 0} {$i<$WKEY} {incr i} {
	connect key\[$i\] [string index $key $i]
	disconnect key\[$i\]
}

#remove gates
ungroup -flatten -all
syn_generic
delete_unloaded_undriven -all DUTLock

write_hdl > locked/ttlock_${top}_${WKEY}.v
delete_obj design:DUTLock

exit

