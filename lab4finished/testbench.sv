module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset_Load_Clear, Run;
logic [7:0] SW;
logic [7:0] Aval,
		      Bval;
logic Xval;
logic Clr_sh;
logic Run_SH;
logic [6:0] HEX0,
		 HEX1,
		 HEX2,
		 HEX3; 

Processor processor0(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// as in a software program
initial begin: TEST_VECTORS
 Reset_Load_Clear = 0;
 Run = 1;
 SW = 8'b00000000;


//7*-59
#2 SW = 8'b11000101;//-59

#2 Reset_Load_Clear = 1;	// Toggle LoadA

#2 SW =  8'b00000111;//7

#2 Run = 0;
#2 Run = 1;



//#30 SW =  8'b11111001;//-7



//#30 SW = 8'b00111011;//59












end
endmodule