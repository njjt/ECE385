module mux3_1(input logic [15:0] PC,
	   input logic [15:0] bus,
		input logic [15:0] add,
	   input logic [1:0] E,
	   output logic [15:0] S 
	   );
	always_comb	
	
	begin
   case(E)
   2'b00: S = PC + 1;
	2'b01: S = add;
	2'b10: S = bus;
	default : S = PC +1;
   endcase
	end
endmodule