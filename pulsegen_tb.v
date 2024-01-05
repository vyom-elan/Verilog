`timescale 1ns / 1ps

module pulse_gen_testbench;

  reg clk, rst, start_pulse;
  reg [7:0] pulse_duration;
  wire pulse, pulse_active;

  pulse_generation_top #(
    .COUNTER_WIDTH(4),
    .DEFAULT_PULSE_DURATION(2),
    .DEFAULT_PULSE_PERIOD(3)
  ) uut (
    .clk(clk),
    .rst(rst),
    .pulse(pulse),
    .pulse_active(pulse_active)
  );

  initial begin
    clk = 0;
    rst = 1;
    start_pulse = 0;
    pulse_duration = 3;

    #10 rst = 0;

    #10 start_pulse = 1;

    #10000;

    if (pulse_active != 1) begin
        $display("Fail - Duration not match");
    end
    if (pulse_active == 1) begin    // pulse duration > pulse period
      $display("Error");
    end else begin
      $display("Pass");
    end

    $finish;
  end

  always #5 clk = ~clk;

endmodule
