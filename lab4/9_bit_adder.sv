module add_nine(input [7:0] A, S,sub,
	 output [8:0] out
	    );
   //logic [8:0] 		 9A, 9S;
   logic c0,c1,c2,c3,c4,c5,c6,c7,c8;
	logic [7:0] nS;

	always_comb
	begin
	if(sub)
		nS = ~S + 8'b00000001;
	else
		nS = S;
	end
full_adder fa1(.A(A[0]),.B(nS[0]),.S(out[0]),.cin(1'b0),.cout(c0));
full_adder fa2(.A(A[1]),.B(nS[1]),.S(out[1]),.cin(c0),.cout(c1));
full_adder fa3(.A(A[2]),.B(nS[2]),.S(out[2]),.cin(c1),.cout(c2));
full_adder fa4(.A(A[3]),.B(nS[3]),.S(out[3]),.cin(c2),.cout(c3));
full_adder fa5(.A(A[4]),.B(nS[4]),.S(out[4]),.cin(c3),.cout(c4));
full_adder fa6(.A(A[5]),.B(nS[5]),.S(out[5]),.cin(c4),.cout(c5));
full_adder fa7(.A(A[6]),.B(nS[6]),.S(out[6]),.cin(c5),.cout(c6));
full_adder fa8(.A(A[7]),.B(nS[7]),.S(out[7]),.cin(c6),.cout(c7));
full_adder fa9(.A(A[7]),.B(nS[7]),.S(out[8]),.cin(c7));
   
endmodule