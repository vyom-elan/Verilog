module UpCounter(
  input clk,
  input rst,
  output reg [3:0] count
);
	parameter
	reg [3:0] count;
	task increment;
		count <= count + 1;
	endtask
	task reset_counter;
		count <= 4'b0000;	
	endtask
	always @(posedge clk or posedge rst) begin
    if (reset)
		reset_counter(); 
	else
		increment(); 
	end
endmodule
