module datapath(input logic Clk,  Reset, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
					 input logic GatePC, GateMDR, GateALU, GateMARMUX,
                input logic SR2MUX, ADDR1MUX, MARMUX,
                input logic BEN, MIO_EN, DRMUX, SR1MUX,
                input logic [1:0] PCMUX, ADDR2MUX, ALUK,
                input logic [15:0] MDR_In,
                output logic [15:0] MAR, MDR, IR,PC,ALU
					 );
logic [15:0] Q;
logic [15:0] MDR_IN,PC_IN;

bus_mux bus(.*); 
mux2_1 MIO_MUX(.bus(Q),.MMAR(MDR_In),.MIO_EN(MIO_EN),.S(MDR_IN));
mux3_1 PC_MUX(.PC(PC),.bus(Q),.add(16'b0000000000000000),.E(PCMUX),.S(PC_IN));
reg_16 MAR_reg(.Clk(Clk),.Reset(Reset), .Load(LD_MAR),.D(Q),.Data_Out(MAR));
reg_16 MDR_reg(.Clk(Clk),.Reset(Reset), .Load(LD_MDR),.D(MDR_IN),.Data_Out(MDR));
reg_16 IR_reg(.Clk(Clk),.Reset(Reset), .Load(LD_IR),.D(Q),.Data_Out(IR));
reg_16 PC_reg(.Clk(Clk),.Reset(Reset), .Load(LD_PC),.D(PC_IN),.Data_Out(PC));


endmodule
