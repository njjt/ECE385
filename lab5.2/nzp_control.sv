module nzp_control(input logic [15:0] bus,
						 input logic [2:0] nzp,
						 output logic ben_out
						 );
logic [2:0] name;
always_comb
begin
name = 3'b000;
case(bus)
16'h0000	:	name = 3'b010; //zero
16'b1xxxxxxxxxxxxxxx	: name = 3'b100; //negative
16'b0xxxxxxxxxxxxxxx	: name = 3'b001; //postive
endcase

if(nzp & name)
	ben_out = 1'b1;

else
	ben_out = 1'b0;

end
endmodule