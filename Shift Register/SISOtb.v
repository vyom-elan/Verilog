module SISO_tb;
  reg clk,rst;
  reg data;
  wire op;
  SISO uut (data,clk,rst,op);
  always #5 clk=~clk;
  initial begin
    $monitor("Time=%2t  D=%0b, clr=%0b, Q=%b",$time,data,rst,op);
    rst=1;clk=0;
    #5
    rst = 0;
    data=1;#10
    data=0;#10
    data=1;#10
    data=0;#10
    #30
    $finish;
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end
endmodule
