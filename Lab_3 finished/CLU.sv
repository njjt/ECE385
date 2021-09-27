module clu_4(input [3:0] P,G
	     input 	  cin,
	     output 	  [3:0]cout,
	     output 	  pout,
	     output 	  gout
	     );
   
   logic  c0,c1,c2,p0,p1,p2,p3,g0,g1,g2,g3;
   
   
   pout = P[0] & P[1] & P[2] & P[3];
   

   gout = (G[0] & P[1] & P[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[2] & P[3]) | G[3];

   cout[0] = (cin & P[0])                  | G[0];
   cout[1] = (cin & P[0] & P[1])             | (G[0] & P[1])           | G[1]; 
   cout[2] = (cin & P[0] & P[1] & P[2])        | (G[0] & P[1] & P[2])      | (G[1] & P[2])      | G[2];
   cout[3] = (cin & P[0] & P[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[2] & P[3]) | G[3];
   
   
endmodule
   
  
