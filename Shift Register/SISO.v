module SISO(data,clk,rst,op);
  input clk,rst;
  input data;
  output op;
  reg [3:0]T;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        T=4'b0000;
      else
        begin
          T[3]<=T[2];
          T[2]<=T[1];
          T[1]<=T[0];
          T[0]<=data;
        end
    end
  assign op = T[3];
endmodule
