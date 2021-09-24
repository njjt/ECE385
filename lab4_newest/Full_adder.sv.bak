module full_adder(input A,B,cin,
       output S,cout);
   //S = A xor B xor cin
	always_comb
	begin
   S = A^B^cin;
   //cout  = AB + BC + CA
   cout = (A&B) | (B&cin) | (cin&A);
   end
endmodule
