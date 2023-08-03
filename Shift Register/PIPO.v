//Parallel in and Parallel out

module PIPO(data,clk,rst,op);
  input clk,rst;
  input [7:0] data;
  output reg[7:0] op;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        op=8'b00000000;
      else
        op=data;
    end
endmodule
