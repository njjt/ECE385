 //Two-always example for state machine

module control (input  logic Clk,Reset, Run, Cl_A_Load_B,M,
                output logic Shift, ADD, SUB, Clr_Ld );

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [2:0] {Initial_state, Start_state, ADD_state, Shift_state, Sub_state,Final_shift_state}   curr_state, next_state;    
    logic Counter;
	 //assign Counter = 4'b0000;
	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
		  begin
            curr_state <= Initial_state;
		  end
        else 
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin
		  Counter = 4'b1000;
		  next_state = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            Initial_state :   if (Cl_A_Load_B)
										next_state = Start_state;
									   else 
										next_state = curr_state;

							  
            Start_state :    if(M && Run)
									  next_state = ADD_state;
							        else if (M == 0 && Run)
									  next_state = Shift_state;
									  else 
									  next_state = curr_state;
                            
									  
									 

				Shift_state :    if(M == 1 && Counter > 4'b0001 )
				                 next_state = ADD_state;
							        else if (M == 0 && Counter > 4'b0001)    
									  next_state = Shift_state;
									  else if (M == 1 && Counter == 4'b0001)
									  next_state = Sub_state;
									  else if (Counter == 4'b0000)
									  next_state =  Final_shift_state;
									  else 
									  next_state = curr_state;
					
				ADD_state: 
	                     next_state = Shift_state;			
									  
				Sub_state:  next_state = Shift_state;			 
            
				
            Final_shift_state :
                       if (Run == 0)				
                       next_state = Initial_state;
						
				
				
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
				
	   	   Start_state: 
		      begin
                Clr_Ld = 1'b1;
					 ADD= 1'b0;
					 SUB = 1'b0;
					 Shift = 1'b0;
					 Counter = Counter;
		      end
				
				Shift_state :
				begin
                Clr_Ld = 1'b0;
					 ADD= 1'b0;
					 SUB = 1'b0;
					 Shift = 1'b1;
					 Counter--;				 
		      end
				
				ADD_state :
				begin
                Clr_Ld = 1'b0;
					 ADD= 1'b1;
					 SUB = 1'b0;
					 Shift = 1'b0;
				    Counter = Counter;
		      end
				
				Sub_state :
				begin
                Clr_Ld = 1'b0;
					 ADD= 1'b0;
					 SUB = 1'b1;
					 Shift = 1'b0;
		          Counter = Counter;			 
		      end
				
				
	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
		      begin 
                Clr_Ld = 1'b0;
					 ADD= 1'b0;
					 SUB = 1'b0;
					 Shift = 1'b0;
					 Counter = Counter;
		      end
        endcase
    end

endmodule