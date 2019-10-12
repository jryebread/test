// load and store register
// CSE140L   Fall 2018
module register # (parameter N = 8)
  (input clk,
   input [N-1:0] in,		  // data in
   output logic [N-1:0] out,  // data out
   input load,				  // controls
         clear
   );
	 
  always @ (posedge clk, posedge clear)	begin
	if(clk || clear) begin //WHY DO WE HAVE TO CHECK CLK FOR THIS TO WORK?
   if((clear == 1) && (load == 0)) begin
	out = 00000000;
  end else if((clear == 1) && (load == 1)) begin
	out = 00000000;
  end else if((clear == 0) && (load == 0)) begin 
	out = out;
  end else begin
	out = in;
  end
  end
// fill in guts				case({clear,load})
//   clear   load    out
// 	 1       0      0
//     1       1      0
//     0       0     hold
//     0       1      in   

// What would be the impact of leaving posedge clear out of 
//  the sensitivity list? 
  end
		
endmodule

