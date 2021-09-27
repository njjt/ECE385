module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */

	logic [3:0] p,g,cout_1;
	clu_4 clu0(.P(p[3:0]),.G(g[3:0]),.cin(0),.cout(cout)); 
   cla4 cla1(.A(A[3:0]),.B(B[3:0]),.cin(cin),.S(S[3:0]),.pout(p[0]),.gout(g[0]));

   cla4 cla2(.A(A[7:4]),.B(B[7:4]),.cin(cout_1[0]),.S(S[7:4]),.pout(p[1]),.gout(g[1]));
   cla4 cla3(.A(A[11:8]),.B(B[11:8]),.cin(cout_1[1]),.S(S[11:8]),.pout(p[2]),.gout(g[2]));
   cla4 cla4(.A(A[15:12]),.B(B[15:12]),.cin(cout_1[2]),.S(S[15:12]),.pout(p[3]),.gout(g[3]));
	
	//clu_4 clu0(.P(),.G(),.cin(cout_1[]),.S(S[15:12]),.cout(cout)) 
endmodule