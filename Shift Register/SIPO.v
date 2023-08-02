//Serial In Parallel Out

module SIPO(data,clk,rst,op);
  input data,clk,rst;
  output reg [7:0] op;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        op=8'b00000000;
      else
        begin
          op[0]<=data;
          op[1]<=op[0];
          op[2]<=op[1];
          op[3]<=op[2];
          op[4]<=op[3];
          op[5]<=op[4];
          op[6]<=op[5];
          op[7]<=op[6];
        end
    end
endmodule
