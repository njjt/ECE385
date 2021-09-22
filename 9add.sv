module 9add(input [7:0] A, S,
	    output [8:0] out,
	    );
   logic [8:0] 		 9A, 9S;
   logic c0,c1,c2,c3,c4,c5,c6,c7,c8
always_comb+===
  begin
   9A[8] = A[7];
   9A[7] = A[7];
   9A[6] = A[6]; 
   9A[5] = A[5];
   9A[4] = A[4];
   9A[3] = A[3];
   9A[2] = A[2];
   9A[1] = A[1];
   9A[0] = A[0];
   9S[8] = S[7];
   9S[7] = S[7];
   9S[6] = S[6];
   9S[5] = S[5];
   9S[4] = S[4];
   9S[3] = S[3];
   9S[2] = S[2];
   9S[1] = S[1];
   9S[0] = S[0];
  end; // always_comb
full_adder fa1(.A(9A[0]),.B(9S[0]),.S(out[0]),.cin(0'b0),.cout(c0));
full_adder fa1(.A(9A[1]),.B(9S[1]),.S(out[1]),.cin(c0),.cout(c1));
full_adder fa1(.A(9A[2]),.B(9S[2]),.S(out[2]),.cin(c1),.cout(c2));
full_adder fa1(.A(9A[3]),.B(9S[3]),.S(out[3]),.cin(c2),.cout(c3));
full_adder fa1(.A(9A[4]),.B(9S[4]),.S(out[4]),.cin(c3),.cout(c4));
full_adder fa1(.A(9A[5]),.B(9S[5]),.S(out[5]),.cin(c4),.cout(c5));
full_adder fa1(.A(9A[6]),.B(9S[6]),.S(out[6]),.cin(c5),.cout(c6));
full_adder fa1(.A(9A[7]),.B(9S[7]),.S(out[7]),.cin(c6),.cout(c7));
full_adder fa1(.A(9A[8]),.B(9S[8]),.S(out[8]),.cin(c7));
   
endmodule
