module mux4_1(input logic[5:0] A,
	   input logic [8:0] B,
		input logic [10:0] C,
	   input logic [1:0]E,
	   output logic [15:0] S 
	   );
	always_comb	
	begin
   case(E)
	2'b00	:	S = 16'b0000000000000000;
	2'b01	:	S = {{10{A[5]}},A}; //sign extension of A
	2'b10 : 	S = {{7{B[8]}},B}; //sign extension of B
	2'b11 :	S = {{5{C[10]}},C}; //sign extension of C
	endcase
   end
endmodule