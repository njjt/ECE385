module mux2_1_sign(input logic[15:0] A,
	   input logic [4:0] B,
	   input logic E,
	   output logic [15:0] S 
	   );
	always @ (E)
	begin
   case(E)
	1'b0	:	S = A;
	1'b1	:	S = {{11{B[4]}},B};
	endcase
   end
endmodule