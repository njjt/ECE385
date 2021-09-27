module testbench();

timeunit 10ns;

timeprecision 1ns;


logic [15:0] A, B;
logic cin;
logic [15:0] S;
logic cout;

lookahead_adder lookahead_adder0(.*);

initial begin: TEST_VECTORS
A = 16'h0000;
B = 16'hFFFF;
cin = 0;

#2 A = 16'h0033;
B = 16'h0055;
cin = 1;

#4 A = 16'h0045;
B = 16'hA023;
cin = 0;

end

endmodule