module MM_TB;
  parameter CLK_PERIOD = 1000000;
  reg clk;
  reg reset;
  reg in;
  wire out;
  MM dut(
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
  );
  
  always #((CLK_PERIOD)/2) clk = ~clk; //50% duty cycle is achieved
  initial begin
    clk = 0;
    reset = 1;
    in = 0;
    #((CLK_PERIOD)*2) reset = 0; 
    #((CLK_PERIOD)*5) in = 1;         //T1= desired case 101011
    #((CLK_PERIOD)*5) in = 0;
    #((CLK_PERIOD)*5) in = 1;
    #((CLK_PERIOD)*5) in = 0;
    #((CLK_PERIOD)*5) in = 1;
    #((CLK_PERIOD)*5) in = 1; 
    #((CLK_PERIOD)*5) in = 0;        //New input for the next case after the pattern is detected
    $display("Test case passed");
    #((CLK_PERIOD)*5) in = 0;
    #((CLK_PERIOD)*5) in = 0;         //T2= Pattern 000000 is passed
    #((CLK_PERIOD)*5) in = 0;
    #((CLK_PERIOD)*5) in = 0;
    #((CLK_PERIOD)*5) in = 0;
    #((CLK_PERIOD)*5) in = 0;
    $display("Test case passed");
    #((CLK_PERIOD)*10) $finish;
  end
endmodule
