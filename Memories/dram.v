module dram(out, data, wr, rd, clk, rst);
  parameter width = 8;
  parameter depth = 16;
  parameter addr = 3;
  reg [width-1:0] mem [depth-1:0];
  input wire clk, rst, wr, rd;
  input wire [width-1:0] data;
  output reg [width-1:0] out;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      mem[0] <= 0;
    end 
    else if (rd && wr) begin
      mem[addr] <= data; 
    end 
    else if (rd && ~wr) begin
      out <= mem[addr]; 
    end
  end
endmodule
