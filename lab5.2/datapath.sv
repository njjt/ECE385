module datapath(input logic Clk,  Reset, LD_MAR,LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
					 input logic GatePC, GateMDR, GateALU, GateMARMUX,
                input logic SR2MUX, ADDR1MUX, MARMUX,
                input logic BEN, MIO_EN, DRMUX, SR1MUX,
                input logic [1:0] PCMUX, ADDR2MUX, ALUK,
                input logic [15:0] MDR_In,
                output logic [15:0] MAR, MDR, IR,PC,ALU
					 );
logic [15:0] Q;
logic [15:0] MDR_Input,PC_IN,PC_ADDER_B,PC_ADDER_A,ALU_B,SR1_OUT,SR2_OUT;
logic [2:0] DR,SR1,SR2;
logic [15:0] PC_add;

//bus
bus_mux bus(.*);
//computes value of PC 
mux3_1 PC_MUX(.PC(PC),.bus(Q),.add(PC_add),.E(PCMUX),.S(PC_IN));
adder_16 PC_adder(.A(PC_ADDER_A),.B(PC_ADDER_B),.S(PC_add));

//computes input of MDR
mux2_1 MIO_MUX(.A(Q),.B(MDR_In),.E(MIO_EN),.S(MDR_Input));
//registers for 4 bus inputs
reg_16 MAR_reg(.Clk(Clk),.Reset(Reset), .Load(LD_MAR),.D(Q),.Data_Out(MAR));
reg_16 MDR_reg(.Clk(Clk),.Reset(Reset), .Load(LD_MDR),.D(MDR_Input),.Data_Out(MDR));
reg_16 IR_reg (.Clk(Clk),.Reset(Reset), .Load(LD_IR),.D(Q),.Data_Out(IR));
reg_16 PC_reg (.Clk(Clk),.Reset(Reset), .Load(LD_PC),.D(PC_IN),.Data_Out(PC));

//pc_adder inputs
mux4_1 PC_ADDER_B_MUX(.A(IR[5:0]),.B(IR[8:0]),.C(IR[10:0]),.E(ADDR2MUX),.S(PC_ADDER_B));
mux2_1 PC_ADDER_A_MUX(.A(PC),		 .B(SR1),	  				  .E(ADDR1MUX),.S(PC_ADDER_A));

//sr2MUX

mux2_1 DR_MUX(.A(3'b111),.B(IR[11:9]),.E(DRMUX),.S(DR));
mux2_1 SR1_MUX(.A(IR[11:9]),.B(IR[8:6]),.E(SR1MUX),.S(SR1));
mux2_1_sign SR2_MUX(.A(SR2),.B(IR[4:0]),.E(SR2MUX),.S(SR2));

//reg_file
reg_file reg_file(.Clk(CLk),.Q(Q),.DR(DR),.SR1(SR1),.SR2(SR2),.load(LD_REG),.Reset(Reset),.SR1_OUT(SR1_Out),.SR2_OUT(SR2_Out));

//alu
alu alu(.A(SR1),.B(SR2),.ALUK(ALUK),.S(ALU));

reg_1 ben_reg(.Clk(Clk),.Reset(Reset), .Load(LD_BEN),.D(BEN_in),.Data_Out(BEN));
reg_3 nzp_reg(.Clk(Clk),.Reset(Reset), .Load(LD_CC),.D(nzp_in),.Data_Out(nzp));
nzp_control nzp_control(.bus(Q),.nzp(nzp),.ben_out(BEN_in));


endmodule
