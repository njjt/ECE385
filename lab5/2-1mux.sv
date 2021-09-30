
module mux2_1(input logic[15:0] bus,
	   input logic [15:0] MMAR,
	   input logic MIO_EN,
	   output logic [15:0] S 
	   );
	always_comb	
	begin
   if(MIO_EN)
	begin
     S = MMAR;
	end
    else
	 begin
	 S = bus;
	 end
   end
endmodule