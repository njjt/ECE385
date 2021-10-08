
module mux2_1(input logic[15:0] A,
	   input logic [15:0] B,
	   input logic E,
	   output logic [15:0] S 
	   );
	always_comb	
	begin
   case(E)
	1'b0	:	S = A;
	1'b1	:	S = B;
	endcase
   end
endmodule