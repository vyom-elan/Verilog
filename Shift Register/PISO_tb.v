module tb;
  reg clk,clr,load; 
  reg [3:0] D;
  wire Q;
  PISO uut (D,clk,clr,load,Q);
  always #5 clk=~clk;
  initial begin
    $monitor("Time=%2t  D=%b,clr=%0b,load=%0b,Q=%b",$time,D,clr,load,Q);
    clr=1;clk=0;
    #5
    clr = 0;load=1;D=4'b1010;#10
    load = 0;#45
    clr=1;#5
    clr=0;load=1;D=4'b0101;#10
    load=0;
    #60
    $finish;
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end
endmodule
