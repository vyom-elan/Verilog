module sram_tb();
  reg clk, rst, wr, addr;
  reg [7:0] din;
  wire [7:0] dout;
  dram dut (
    .clk(clk),
    .rst(rst),
    .wr(wr),
    .adr(adr),
    .din(din),
    .out(out)
  );
 always begin
    #5 clk = ~clk;
 end
  initial 
    begin
      $dumpfile("dump.vcd"); 
  $dumpvars;
    clk = 0;
    rst = 1;
    wr = 0;
    rd = 0;
    data = 8'h00;
    #10 rst = 0;
    #5 wr = 1;
    #5 data = 8'hFF;
    #5 wr = 0;
    #5 rd = 1;
    #5 rd = 0;
    #10 $finish;
  end 
endmodule
