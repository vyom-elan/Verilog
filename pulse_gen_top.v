`timescale 1ns / 1ps
module pulse_generation_top #(
  parameter COUNTER_WIDTH = 4,
  parameter DEFAULT_PULSE_DURATION = 2,
  parameter DEFAULT_PULSE_PERIOD = 3
)(
  input logic clk,
  input logic rst,
  output logic pulse,
  output logic pulse_active
);

  logic [COUNTER_WIDTH-1:0] count;
  logic [COUNTER_WIDTH-1:0] pulse_duration;
  logic [COUNTER_WIDTH-1:0] pulse_period;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 0;
      pulse_duration <= DEFAULT_PULSE_DURATION;
      pulse_period <= DEFAULT_PULSE_PERIOD;
      pulse <= 0;
      pulse_active <= 0;
    end else if (count == pulse_duration) begin
      pulse <= ~pulse;
      pulse_active <= 1;
      count <= 0;
    end else begin
      count <= count + 1;
      pulse_active <= 0;
    end
  end

  always @(posedge clk) begin
    if (count == pulse_period) begin
      count <= 0;
    end
  end

endmodule
