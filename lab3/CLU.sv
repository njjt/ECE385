module clu_4(input [3:0]A,
	     input [3:0]B,
	     input cin,
	     output [3:0]S,
	     output cout
	     );
   logic  c0,c1,c2,p0,p1,p2,p3,g0,g1,g2,g3;
   
   p0 = A[0] | B[0]; 
   p1 = A[1] | B[1]; 
   p2 = A[2] | B[2];
   p3 = A[3] | B[3];

   g0 = A[0] & B[0];
   g1 = A[1] & B[1];
   g2 = A[2] & B[2];
   g3 = A[3] & B[3];
   

   c0 = (cin & p0)                  | g0;
   c1 = (cin & p0 & p1)             | (g0 & p1)           | g1; 
   c2 = (cin & p0 & p1 & p2)        | (g0 & p1 & p2)      | (g1 & p2)      | g2;
   cout = (cin & p0 & p1 & p2 & p3) | (g0 & p1 & p2 & p3) | (g1 & p2 & p3) | (g2 & p3) | g3;
   
   full_adder fa1(.A(A[0]),.B(B[0]),.cin(cin),.S(S[0]));
   full_adder fa2(.A(A[1]),.B(B[1]),.cin(c0),.S(S[1]));
   full_adder fa1(.A(A[2]),.B(B[2]),.cin(c1),.S(S[2]));
   full_adder fa1(.A(A[3]),.B(B[3]),.cin(c2),.S(S[3]));
   
endmodule
   
  
