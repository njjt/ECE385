module csa4(input [3:0] A,B,
	    input cin,
	    output [3:0] S,
	    output cout
	    );
   logic [3:0] 	   S1,S0;
   logic 	   cout1, cout0;

   full4 f41(.A(A),.B(B),.cin(1'b1),.S(S1),.cout(cout1);
   full4 f41(.A(A),.B(B),.cin(1'b0),.S(S0),.cout(cout0);
   mux m1(.zero(S0),.one(S1),.c(cin),.S(S));
   if(cin)
      cout = cout1;
	     else
	     cout = cout0;
endmodule
	    
