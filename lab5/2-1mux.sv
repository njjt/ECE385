
module mux2_1(input logic[15:0] bus,
	   input logic [15:0] MMAR,
	   input logic MIO_EN,
	   output logic [15:0] S 
	   );
	always_comb	
	begin
   case(MIO_EN)
	1'b0	:	S = bus;
	1'b1	:	S = MMAR;
	endcase
   end
endmodule