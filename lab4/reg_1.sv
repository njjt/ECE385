module reg_1 (input  logic Clk, Reset, Load, Shift_En,
              input  logic  D,
              output logic Shift_Out,
              output logic  Data_Out);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= 0;//set the first value
		 else if (Load)
			  Data_Out <= D;
		 else if (Shift_En)
		 begin
			  Data_Out <= {Data_Out, Data_Out }; 
	    end
    end
	
    assign Shift_Out = Data_Out;

endmodule
