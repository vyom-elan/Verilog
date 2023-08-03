//Parallel in and Parallel out

module PIPO_tb;
  reg clk,rst;
  reg[7:0] data;
  wire[7:0] op;
  PIPO dut(data,clk,rst,op);  
  always #5 clk=~clk;
  initial
    begin
      $monitor("Time=%2t  data=%0b, rst=%0b, op=%b",$time,data,rst,op);
      rst=1;
      clk=0;
      #5
      rst=0;
      data=8'b11110000;
      #10 data=8'b01010101;
      #10 data=8'b10111010;
      $finish;
    end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end
endmodule
