//task and function
//function to count a number

function counter;
  input clk;
  input rst;
  output reg [7:0] count;

  always @(posedge clk or posedge rst) begin
    if (rst)
      count <= 0;
    else
      count <= count + 1;
  end
  counter = count;			//to return the val by definition of counter
endfunction
