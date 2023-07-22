module RPM_Measurement_Test();
reg clk;
reg rpm_signal;
wire [31:0] time_period;
RPM_Measurement rpm_measurement(
    .clk(clk),
    .rpm_signal(rpm_signal),
    .time_period(time_period)
);
always begin
  clk = 1;
  #50;
  clk = 0;
  #50;
end
initial begin
    #100; 
    repeat (100) begin
        rpm_signal = 1; 
        #500; 
        rpm_signal = 0; 
        #500; 
    end
    $finish;
end
endmodule
