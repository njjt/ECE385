module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset_Clear, Run_Accumulate;
logic [7:0] SW;

logic [6:0] HEX0,
		 HEX1,
		 HEX2,
		 HEX3,
		 Hex4,
		 Hex5; 

// To store expected results
//logic [7:0] ans_1a, ans_2b;
				
// A counter to count the instances where simulation results
// do no match with expected results

// Instantiating the DUT
// Make sure the module and signal names match with those in your design
adder2 adder20(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS

//test 1
Reset_Clear = 0;		// Toggle Reset

#2 SW = 16'h0003;

#2 Reset_Clear = 1;

#2 SW = 16'h0001;
   ans = 16'h0004;
	
#2 Reset_Clear = 0;
#2 Run_Accumulate = 0;	

#2 Run_Accumulate = 1;
// answer should be 0x0001+0x0003 = 0x0004
#22


end

endmodule