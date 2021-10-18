module bus_mux(input logic [15:0] PC, MDR,PC_add, ALU,
					input logic GatePC,GateMDR,GateMARMUX,GateALU,
					output logic [15:0] Q);
		
		logic [3:0] select;
		always_comb
		begin
		select[0] = GatePC;
		select[1] = GateMDR;
		select[2] = GateMARMUX;
		select[3] = GateALU;
		case(select)
			4'b0001	:	Q = PC;
			4'b0010	:	Q = MDR;
			4'b0100	:	Q = PC_add;
			4'b1000 :	Q = ALU;
			default : Q = PC;
			
		endcase
		end
endmodule