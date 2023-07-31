module testbench_blocking;
  logic [7:0] a, b;
  bit clk;
  logic [7:0] a_swapped_blocking, b_swapped_blocking;

  blocking_assignment swapper_blocking (
    .a(a),
    .b(b),
    .a_swapped(a_swapped_blocking),
    .b_swapped(b_swapped_blocking)
  );

  always #5 clk = ~clk;
  initial begin
    a = 123;
    b = 456;
    clk = 0;
    #100;
    $finish;
  end

  always @(*)
    $display("a = %d, b = %d | Blocking: a_swapped = %d, b_swapped = %d", a, b, a_swapped_blocking, b_swapped_blocking);
endmodule
