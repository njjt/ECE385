module mux(input [3:0] zero,
	   input [3:0] one,
	   input c,
	   output [3:0] S
	   );
   if(c)
     S = one;
   
       else
	 S = zero;
   
endmodule
