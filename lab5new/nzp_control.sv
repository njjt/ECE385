module nzp_control(input logic [15:0] bus,
						 output logic [2:0] nzp
						 );

always_comb
begin
if(bus == 0)
	nzp = 3'b010;
else if(bus <0)
	nzp = 3'b100;
else
	nzp  =3'b001;

end
endmodule