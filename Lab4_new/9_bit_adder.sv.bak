module full4(input [3:0] A,
	     input [3:0] B,
	     input cin,
	     output [3:0] S,
	     output cout
	     );
   logic 	    c0,c1,c2;
   full_adder fa1(.A(A[0]),.B(B[0]),.cin(cin),.S(S[0]),.cout(c0))
   full_adder fa2(.A(A[1]),.B(B[1]),.cin(c0),.S(S[1]),.cout(c1))
   full_adder fa1(.A(A[2]),.B(B[2]),.cin(c1),.S(S[2]),.cout(c2))
   full_adder fa1(.A(A[3]),.B(B[3]),.cin(c2),.S(S[3]),.cout(cout))
endmodule
