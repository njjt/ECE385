module alu(input logic [15:0] A, B,
			  input logic [2:0] ALUK,
			  output logic S
			  );
always_comb
begin
case(ALUK)
2'b00	: S = A+B;
2'b01	: S = A&B;
2'b10	: S = ~A;
2'b11	: S = A;
default : S = 0;
endcase
end
endmodule