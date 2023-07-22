module RPM_Measurement(
    input wire clk,       
    input wire rpm_signal,
    output reg [31:0] time_period 
);
reg rpm_signal_prev;
reg counting;
reg [31:0] count;
always @(posedge clk) begin
    rpm_signal_prev <= rpm_signal;
    if (!counting && rpm_signal && !rpm_signal_prev) begin
        counting <= 1;
        count <= 0;
    end else if (counting) begin
        count <= count + 1;
        if (!rpm_signal) counting <= 0;
    end
end
always @(posedge clk) begin
    if (counting && rpm_signal_prev) begin
        counting <= 0;
        time_period <= count;
    end
end
endmodule
