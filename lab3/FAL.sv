module full_adder_lookahead(input A,B,cin
			    output S,P,G
			    );
    S = A^B^cin;
   
    P = A + B;
   
    G = A * B;
   
endmodule
