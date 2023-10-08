module tb_BSR;
   parameter MSB = 8;        
   reg data;                  
   reg clk;                   
   reg en;                    
   reg dir;                   
   reg rstn;                
   wire [MSB-1:0] out;        
   bdShiftReg  #(MSB) sr0  (  .d (data),
                             .clk (clk),
                             .en (en),
                             .dir (dir),
                             .rstn (rstn),
                             .out (out));

   always #10 clk = ~clk;
   initial begin
      clk <= 0;
      en <= 0;
      dir <= 0;
      rstn <= 0;
      data <= 'h1;
   end
   initial begin
      rstn <= 0;
      #20 rstn <= 1;
          en <= 1;
      repeat (7) @ (posedge clk)
         data <= ~data;
         #10 dir <= 1;
      repeat (7) @ (posedge clk)
         data <= ~data;
      repeat (7) @ (posedge clk);
      $finish;
   end
   initial
      $monitor ("rstn=%0b data=%b, en=%0b, dir=%0b, out=%b", rstn, data, en, dir, out);
endmodule
