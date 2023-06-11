module SRAM (
  input wire clk,
  input wire rst,
  input wire wr,
  input wire [9:0] ad,
  input wire [7:0] din,
  output wire [7:0] dout
);
  parameter width=8;
  parameter depth=16;
  reg [width-1:0] mem [depth-1:0];
  always @(posedge clk) begin
    if (wr)
      mem[adr] <= din;
  end
  assign dout = mem[adr];
endmodule
