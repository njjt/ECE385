module mux2_1_3(input logic[2:0] A,
	   input logic [2:0] B,
	   input logic E,
	   output logic [2:0] S 
	   );
	always_comb	
	begin
   case(E)
	1'b0	:	S = A;
	1'b1	:	S = B;
	endcase
   end
endmodule