module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic [9:0] SW;
logic	Clk, Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
slc3_testtop test(.*);	

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
 Run = 1;
 SW = 10'b0000000011;
 Continue = 1;

#2 Continue = 0;
#2 Run = 0;
#2 Run = 1;
#2 Continue = 1;
#2 Run = 0;
#2 Run = 1;

 end
 endmodule
 









