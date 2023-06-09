module ctr_tb();
  reg clk,rst;
  wire[3:0] cout;
  ctr coun(.clk(clk), .rst(rst), .cout(cout));
  always #5 clk = ~clk;
  initial begin
    rst = 1;
    #10 rst = 0;
	$finish;
  end
  always @(posedge clk) begin
    $display("Count: %b", cout);
  end

endmodule