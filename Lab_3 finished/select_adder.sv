module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
   logic 	      c0,c1,c2;
   
   
  //first four bits 
  full4 f41(.A(A[3:0]),.B(B[3:0],.cin(cin),.S(S[3:0]),.cout(c0));
  //second 4 bits
  csa4 csa41(.A(A[7:4]),.B(B[7:4]),.cin(c0),.S(S[7:4]),.cout(c1));
  csa4 csa41(.A(A[11:8]),.B(B[11:8]),.cin(c1),.S(S[11:8]),.cout(c2));
  csa4 csa41(.A(A[15:12]),.B(B[15:12]),.cin(c2),.S(S[15:12]),.cout(cout));
endmodule
