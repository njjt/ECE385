module nzp_control(input logic [15:0] bus,
						 input logic [2:0] nzp,
						 output logic [2:0] nzp_in,
						 output logic ben_out
						 );

always_comb
begin
case(bus)
16'h0000	:	nzp_in = 3'b010; //zero
16'b1xxxxxxxxxxxxxxx	: nzp_in = 3'b100; //negative
default : nzp_in = 3'b001;
endcase


if(nzp & nzp_in)
	ben_out = 1'b1;

else
	ben_out = 1'b0;

end
endmodule