module reg_1 (input  logic Clk, Reset, Load, Shift_in,
       
              output logic Shift_Out
              );

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Shift_Out <= 0;//set the first value
		 else if (Load)
			  Shift_Out <= Shift_in;

	    end

	


endmodule
