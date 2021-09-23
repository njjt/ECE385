//4-bit logic processor top level module
//for use with ECE 385 Fall 2016
//last modified by Zuofu Cheng


//Always use input/output logic types when possible, prevents issues with tools that have strict type enforcement

module Processor (input logic   Clk,     // Internal
                                Reset_Load_Clear,   // Push button 0
                                Run, // Push button 3
						input logic [7:0] SW, // S in the lab
                  
                  output logic [7:0]  Aval,    // DEBUG
                  output logic [7:0]  Bval,    // DEBUG
						output logic Xval,
                  output logic [6:0]  HEX1,
                                      HEX0,
                                      HEX3,
										        HEX2);

	 //local logic variables go here
	
	 //assign F_S = 3'b010;
	 //assign R_S = 2'b10;
	 logic Reset_B;
	 logic [7:0] S;
	 logic [8:0] Sum;
	 logic [7:0] A_in;
	 logic X;
	 logic shift_out_A;
	 logic [7:0] Data_out_A;
	 logic [7:0] Data_out_B;
	 logic Shift_enable;
	 logic Loading;
	 logic Y;
	 logic add;
	 logic sub;
	 logic Run_SH;
	 logic Reset_load_clear_SH;
	 logic [7:0] SW_S;
	 
	 assign Reset_B = 1'b0;
    assign Aval = Data_out_A;
	 assign Bval = Data_out_B;
	 assign Y = Data_out_B[0];
	 assign A_in = Sum[7:0];
	 assign S = SW;
	
	 //Instantiation of modules here
	 reg_8    reg_A (
                        .Clk(Clk),
                        .Reset(loading),
                        .Shift_En(Shift_enable),
								.Shift_In(X),
                        .D(A_in),
								.Load(add | sub),
                        .Shift_Out(shift_out_A),
                        .Data_Out(Data_out_A) 
								);
								
								
	reg_8    reg_B (
                        .Clk(Clk),
                        .Reset(Reset_B),
                        .Shift_En(Shift_enable),
								.Shift_In(shift_out_A),
                        .D(SW_S),
								.Load(Loading),
                        .Data_Out(Data_out_B) 
								);
								
								
 control      control_unit(
                        .Clk(Clk),
								.Reset(Reset_Load_Clear_SH), 
								.Run(Run_SH), 
								.Cl_A_Load_B(Reset_Load_Clear_SH),
								.M(Y),
                        .Shift(Shift_enable), 
								.ADD(add), 
								.SUB(sub), 
								.Clr_Ld(Loading)
 
                     );
							
							
reg_1         reg_x( .Clk(Clk), 
                     .Reset(loading), 
							.Load(sub | add), 
							.Shift_En(Shift_enable),
                     .D(Sum[8]),
                     .Shift_Out(X),
                    );

add_nine      adder_nine(
                       .A(Data_out_A), 
							  .S(S),
	                    .out(Sum)
                        );
	
    
   
	 HexDriver        HexAL (
                        .In0(Bval[7:4]),
                        .Out0(HEX1) );
	 HexDriver        HexBL (
                        .In0(Bval[3:0]),
                        .Out0(HEX0) );
								
	 //When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
	 HexDriver        HexAU (
                        .In0(Aval[7:4]),
                        .Out0(HEX3) );	
	 HexDriver        HexBU (
                        .In0(Aval[3:0]),
                        .Out0(HEX2) );
								
	  //Input synchronizers required for asynchronous inputs (in this case, from the switches)
	  //These are array module instantiations
	  //Note: S stands for SYNCHRONIZED, H stands for active HIGH
	  //Note: We can invert the levels inside the port assignments
	  sync button_sync[1:0] (Clk, {~Run, ~Reset_load_clear}, {Run_SH, Reset_load_clear_SH});
	  sync Din_sync[7:0] (Clk, SW, SW_S);
	  
endmodule
