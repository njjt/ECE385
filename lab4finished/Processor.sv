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
    logic add_sh, sub_sh;
	 logic Clr_sh;
	 logic [8:0] Sum;
	 logic B_in;
	 logic Shift_sh;
	 logic Run_SH;
	 logic Reset_Load_Clear_SH;
	 logic [7:0] SW_S;
	 logic AClear;
	 
	 //Instantiation of modules here
	 reg_8    reg_A (
                        .Clk(Clk),
                        .Reset(AClear),
								.Shift_In(Xval),								
								.Load(add_sh | sub_sh),
                        .D(Sum[7:0]),
								.Shift_En(Shift_sh),
                        .Shift_Out(B_in),
                        .Data_Out(Aval[7:0]) 
								);
								
								
	 reg_8    reg_B (
                        .Clk(Clk),
                        .Reset(0),
								.Shift_In(B_in),								
								.Load(Clr_sh),
                        .D(SW_S),
								.Shift_En(Shift_sh),
                        .Data_Out(Bval[7:0]) 
								);
								
								
								
 control      control_unit(
                        .Clk(Clk),
								.Reset(Reset_Load_Clear_SH), 
								.Run(Run_SH), 
								.M(Bval[0]),
                        .Shift(Shift_sh), 
								.ADD(add_sh), 
								.SUB(sub_sh), 
								.Clr_Ld(Clr_sh),
								.Clear_A(AClear)
                     );
							
							
reg_1         reg_x( 
                     .Clk(Clk), 
                     .Reset(AClear), 
							.Load(add_sh | sub_sh), 
							.Shift_in(Sum[8]),
							.Shift_Out(Xval)
                    );

add_nine      adder_nine(
                       .A(Aval), 
							  .S(SW_S),
							  .SUB(sub_sh),
	                    .out(Sum[8:0])
                        );
	
    
   
	 HexDriver        HexBU (
                        .In0(Bval[7:4]),
                        .Out0(HEX1) );
	 HexDriver        HexBL (
                        .In0(Bval[3:0]),
                        .Out0(HEX0) );
								
	 HexDriver        HexA (
                        .In0(Aval[7:4]),
                        .Out0(HEX3) );	
	 HexDriver        HexAU (
                        .In0(Aval[3:0]),
                        .Out0(HEX2) );

	  sync button_sync[1:0] (Clk, {~Run, ~Reset_Load_Clear}, {Run_SH, Reset_Load_Clear_SH});
	  sync Din_sync[7:0] (Clk, SW, SW_S);
	  
endmodule
