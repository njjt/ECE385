module reg_file(input logic Clk,
					 input logic [15:0] Q,
					 input logic  [2:0] DR,SR1,SR2,
					 input logic load,
					 input logic Reset,
					 output logic [15:0] SR1_OUT,SR2_OUT
					 );
logic load0,load1,load2,load3,load4,load5,load6,load7;
logic [15:0]R0_Out,R1_Out,R2_Out,R3_Out,R4_Out,R5_Out,R6_Out,R7_Out;
always_comb
begin
load0 = 0;
load1 = 0;
load2 = 0;
load3 = 0;
load4 = 0;
load5 = 0;
load6 = 0;
load7 = 0;
if(load)
begin
case(DR)
3'b000 : load0  = 1'b1;
3'b001 : load1  = 1'b1;
3'b010 : load2  = 1'b1;
3'b011 : load3  = 1'b1;
3'b100 : load4  = 1'b1;
3'b101 : load5  = 1'b1;
3'b110 : load6  = 1'b1;
3'b111 : load7  = 1'b1;
endcase
end
case(SR1)
3'b000 :	SR1_OUT = R0_Out;
3'b001 :	SR1_OUT = R1_Out;
3'b010 :	SR1_OUT = R2_Out;
3'b011 :	SR1_OUT = R3_Out;
3'b100 :	SR1_OUT = R4_Out;
3'b101 :	SR1_OUT = R5_Out;
3'b110 :	SR1_OUT = R6_Out;
3'b111 :	SR1_OUT = R7_Out;
endcase
case(SR2)
3'b000 :	SR2_OUT = R0_Out;
3'b001 :	SR2_OUT = R1_Out;
3'b010 :	SR2_OUT = R2_Out;
3'b011 :	SR2_OUT = R3_Out;
3'b100 :	SR2_OUT = R4_Out;
3'b101 :	SR2_OUT = R5_Out;
3'b110 :	SR2_OUT = R6_Out;
3'b111 :	SR2_OUT = R7_Out;
endcase
end

reg_16 R0(.Clk(Clk),.Reset(Reset), .Load(load0),.D(Q),.Data_Out(R0_Out));
reg_16 R1(.Clk(Clk),.Reset(Reset), .Load(load1),.D(Q),.Data_Out(R1_Out));
reg_16 R2(.Clk(Clk),.Reset(Reset), .Load(load2),.D(Q),.Data_Out(R2_Out));
reg_16 R3(.Clk(Clk),.Reset(Reset), .Load(load3),.D(Q),.Data_Out(R3_Out));
reg_16 R4(.Clk(Clk),.Reset(Reset), .Load(load4),.D(Q),.Data_Out(R4_Out));
reg_16 R5(.Clk(Clk),.Reset(Reset), .Load(load5),.D(Q),.Data_Out(R5_Out));
reg_16 R6(.Clk(Clk),.Reset(Reset), .Load(load6),.D(Q),.Data_Out(R6_Out));
reg_16 R7(.Clk(Clk),.Reset(Reset), .Load(load7),.D(Q),.Data_Out(R7_Out));

endmodule