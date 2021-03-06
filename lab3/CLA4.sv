module cla4(input [3:0] A,B,
	    input cin,
	    output [3:0] S,
	    output cout,
	    output pout,
	    output gout
	    );
   logic [3:0] 	   C,P,G;

full_adder_lookahead fal1(.A(A[0],.B(B[0]),.cin(cin),.S(S[0]),.P(P[0]),.G(G[0]));
full_adder_lookahead fal1(.A(A[1],.B(B[1]),.cin(C[0]),.S(S[1]),.P(P[1]),.G(G[1]));
full_adder_lookahead fal1(.A(A[2],.B(B[2]),.cin(C[1]),.S(S[2]),.P(P[2]),.G(G[2]));
full_adder_lookahead fal1(.A(A[3],.B(B[3]),.cin(C[2]),.S(S[3]),.P(P[3]),.G(G[3]));
clu4 control1(.P(P[3:0]),.G(G[3:0]),.cin(cin),.cout(C[3:0]),.pout(pout),.gout(gout));
       
endmodule
