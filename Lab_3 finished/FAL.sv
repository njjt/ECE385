module full_adder_lookahead(input A,B,cin,
			    output S,P,G
			    );
				 always_comb
				 begin
    S = A^B^cin;
   
    P = A + B;
   
    G = A * B;
    end
endmodule
