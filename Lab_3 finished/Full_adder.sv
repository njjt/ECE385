module full_adder(input A,B,cin
       output S,cout);
   //S = A xor B xor cin
   S = A^B^cin;
   //cout  = AB + BC + CA
   cout = (A&B) | (B&C) | (C&A);

endmodule
