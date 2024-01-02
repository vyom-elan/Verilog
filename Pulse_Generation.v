module PulGen(
  input clk,        
  input rst,        
  output reg pul_out  
);
  parameter PERIOD = 100;  
  parameter WIDTH = 50;    //50 percent duty cycle
  reg [PERIOD-1:0] count; //a ctr to count for 1 full period

  always @(posedge clk) begin
    if (rst) begin
      count <= 0;
      pul_out <= 1'b0;
    end else begin
      if (count < WIDTH) begin
        pul_out <= 1'b1;
      end else begin
        pul_out <= 1'b0;
      end
      if (count == PERIOD - 1) begin
        count <= 0;
      end else begin
        count <= count + 1;
      end
    end
  end
endmodule
