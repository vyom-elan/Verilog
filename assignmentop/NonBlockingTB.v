module testbench;
  logic [7:0] a, b;
  bit clk;
  logic [7:0] a_swapped_nonblocking, b_swapped_nonblocking;

  nonblocking_assignment #(.CLK_PERIOD(10)) swapper_nonblocking (
    .a(a),
    .b(b),
    .a_swapped(a_swapped_nonblocking),
    .b_swapped(b_swapped_nonblocking)
  );

  always #5 clk = ~clk;
  initial begin
    a = 123;
    b = 200;
    clk = 0;
    #100;
    $finish;
  end
  always @(*)
    $display("a = %d, b = %d | Non-blocking: a_swapped = %d, b_swapped = %d", a, b, a_swapped_nonblocking, b_swapped_nonblocking);
endmodule
