 //Two-always example for state machine

module control (input  logic Clk,Reset, Run,M,
                output logic Shift, ADD, SUB, Clr_Ld);

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [4:0] {Initial_state, Start_state, End_state,Sub_state,A1,S1,A2,S2,A3,S3,A4,S4,A5,S5,A6,S6,A7,S7,S8} curr_state, next_state;    
 
	 //assign Counter = 4'b0000;
	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
			if(Reset)
				curr_state <= Initial_state;
			else
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin

		  next_state = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            Initial_state:   
				            if (~Reset)
								next_state = Start_state;
		
				Start_state: 
							  if(Run)
				           next_state = A1;
							 
				A1: 
				           next_state = S1;
							  
							  S1: 
				           next_state = A2;
							  
							  A2: 
				           next_state = S2;
							  
							  S2: 
				           next_state = A3;
							  
							  A3: 
				           next_state = S3;
							  
							  S3: 
				           next_state = A4;
							  							  
							  A4: 
				           next_state = S4;
							  							  
							  S4: 
				           next_state = A5;
							  							  
							  A5: 
				           next_state = S5;
							  							  
							  S5: 
				           next_state = A6;
							  							  
							  A6: 
				           next_state = S6;
							  							  
							  S6: 
				           next_state = A7;
							  
							  							  
							  A7: 
				           next_state = S7;
							  
							  							  
							  S7: 
				           next_state = Sub_state;
							  
							  
							  Sub_state:
							  next_state = S8;
							  
							  S8:
							  next_state = End_state;
							  
							  End_state:    if (~Run && Reset) 
                                     next_state = Initial_state;
							  
				
								  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
				
	   	   Initial_state: 
		      begin
                Clr_Ld = 1;
					 ADD= 0;
					 SUB = 0;
					 Shift = 0;

		      end
				
				Start_state :
				begin
                Clr_Ld = 0;
					 ADD= 0;
					 SUB = 0;
					 Shift = 0;

		      end
				
				A1, A2, A3, A4, A5, A6, A7 :
				begin
                Clr_Ld = 0;
					 ADD= M;
					 SUB = 0;
					 Shift = 0;

		      end
				
				S1, S2, S3, S4, S5, S6, S7, S8 :
				begin
                Clr_Ld = 0;
					 ADD= 0;
					 SUB = 0;
					 Shift = 1;
	 
		      end
				
						Sub_state :
				begin
                Clr_Ld = 0;
					 ADD= 0;
					 SUB = M;
					 Shift = 0;
		 
		      end
				
				
				End_state:
					begin
                Clr_Ld = 0;
					 ADD= 0;
					 SUB = 0;
					 Shift = 0;
	 
		      end
				

        endcase
    end

endmodule