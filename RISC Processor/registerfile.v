`timescale 1ns/1ps
module GPRs(input clk,
            input reg_write_en,
            input  [2:0] reg_write_dest,
            input  [15:0] reg_write_data,
            input  [2:0] reg_read_addr_1,
            output  [15:0] reg_read_data_1,
            input  [2:0] reg_read_addr_2,
            output  [15:0] reg_read_data_2);
    reg [15:0] reg_array [7:0];
    integer i;
    initial begin
    for(i=0;i<8;i=i+1)
      reg_array[i] <= 16'd0;
    end
    always @ (posedge clk ) 
    begin
      if(reg_write_en) 
      begin
        reg_array[reg_write_dest] <= reg_write_data;
      end
   end
  assign reg_read_data_1 = reg_array[reg_read_addr_1];
 assign reg_read_data_2 = reg_array[reg_read_addr_2];
endmodule
