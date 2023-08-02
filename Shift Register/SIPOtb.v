module tb;
  reg data,clk,rst;
  wire [7:0]op;  
  SIPO uut (data,clk,rst,op);
  always #5 clk=~clk;    //clock generation
  
  initial begin
    $monitor("Time=%2t  data=%0b, rst=%0b, op=%b",$time,data,rst,op);
    rst=1;clk=0;
    #5
    rst = 0;
    data=1; #5
    data=0; #5
    data=1; #5
    data=0; #5
    data=1; #5
    data=0; #5
    data=0; #5
    data=1; #5
    #30
    $finish;
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end
endmodule
