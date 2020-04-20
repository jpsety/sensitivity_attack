
module ttlock_wrapper #(
	parameter WKEY = 32,
	parameter WINPUT = 32
)(other_in,protected_in,out,key);

input [WKEY-1:0] protected_in,key;
input [WINPUT-WKEY-1:0] other_in;
output logic out;
logic f_out;

generate
	if ((WINPUT-WKEY)>0) begin
		DUT dut (.in({other_in,protected_in}),.out(f_out));
	end else begin
		DUT dut (.in(protected_in),.out(f_out));
	end
endgenerate

assign out = (protected_in == key) ^ f_out;

endmodule

