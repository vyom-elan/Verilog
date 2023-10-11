module bidirect_cnt8( input wire clk, reset,
                      input wire en, load, up_downb,
                      input wire [7:0] d,
                      output reg [7:0] q);
  reg [7:0] q_next;
	always @(posedge clk, posedge reset)
	if (reset)
  	q <= 8'h00;
	else
		q <= q_next;
	always @*
		if(load)
	    q_next = d;
    else if (~en)
   		q_next = q;
    else if (up_downb)
  		q_next = q + 8'h01;
		else 
			q_next = q - 8'h01;
endmodule
