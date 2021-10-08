module adder_16(input logic [15:0] A,B,
	             output logic [15:0] S
					 );
logic [14:0] C;

full_adder fa1(.A(A[0]),.B(B[0]),.cin(1'b0),.S(S[0]),.cout(C[0])); 
full_adder fa2(.A(A[1]),.B(B[1]),.cin(C[0]),.S(S[1]),.cout(C[1])); 
full_adder fa3(.A(A[2]),.B(B[2]),.cin(C[1]),.S(S[2]),.cout(C[2])); 
full_adder fa4(.A(A[3]),.B(B[3]),.cin(C[2]),.S(S[3]),.cout(C[3])); 
full_adder fa5(.A(A[4]),.B(B[4]),.cin(C[3]),.S(S[4]),.cout(C[4])); 
full_adder fa6(.A(A[5]),.B(B[5]),.cin(C[4]),.S(S[5]),.cout(C[5])); 
full_adder fa7(.A(A[6]),.B(B[6]),.cin(C[5]),.S(S[6]),.cout(C[6])); 
full_adder fa8(.A(A[7]),.B(B[7]),.cin(C[6]),.S(S[7]),.cout(C[7])); 
full_adder fa9(.A(A[8]),.B(B[8]),.cin(C[7]),.S(S[8]),.cout(C[8])); 
full_adder fa10(.A(A[9]),.B(B[9]),.cin(C[8]),.S(S[9]),.cout(C[9])); 
full_adder fa11(.A(A[10]),.B(B[10]),.cin(C[9]),.S(S[10]),.cout(C[10])); 
full_adder fa12(.A(A[11]),.B(B[11]),.cin(C[10]),.S(S[11]),.cout(C[11])); 
full_adder fa13(.A(A[12]),.B(B[12]),.cin(C[11]),.S(S[12]),.cout(C[12])); 
full_adder fa14(.A(A[13]),.B(B[13]),.cin(C[12]),.S(S[13]),.cout(C[13])); 
full_adder fa15(.A(A[14]),.B(B[14]),.cin(C[13]),.S(S[14]),.cout(C[14]));
full_adder fa16(.A(A[15]),.B(B[15]),.cin(C[14]),.S(S[15]));  
endmodule