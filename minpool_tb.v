`timescale 1ns / 1ps
module minpool_tb;

    // Parameters
    parameter DATA_WIDTH = 8;
    // Signals
    reg clk = 0;
    reg rst = 1;
    reg [DATA_WIDTH-1:0] feature_map[7:0][7:0];
    wire [DATA_WIDTH-1:0] pooled_map[5:0][5:0];
    // Instantiate the DUT
    minpool dut (
        .clk(clk),
        .rst(rst),
        .feature_map(feature_map),
        .pooled_map(pooled_map)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset assertion
    initial begin
        $display("Starting simulation");
        #10; // Wait for 10 time units
        rst = 0; // Assert reset
        #10; // Wait for additional 10 time units
        rst = 1; // Deassert reset
        #100; // Wait for 100 time units
        $display("Simulation complete");
        $finish; // Finish simulation
    end

    // Stimulus
    initial begin
        // Set feature map values
        for (int i = 0; i < 8; i = i + 1) begin
            for (int j = 0; j < 8; j = j + 1) begin
                feature_map[i][j] = $random % 256; // Random values between 0 and 255
            end
        end
    end

    // Display original feature map matrix and pooled result matrix
    initial begin
        // Wait for enough simulation time for the design to update pooled_map values
        #120;

        $display("Original Feature Map Matrix:");
        for (int i = 0; i < 8; i = i + 1) begin
            for (int j = 0; j < 8; j = j + 1) begin
                $write("%d ", feature_map[i][j]);
            end
            $write("\n");
        end

        $display("Pooled Result Matrix:");
        for (int i = 0; i < 6; i = i + 1) begin
            for (int j = 0; j < 6; j = j + 1) begin
                // Find minimum value in the corresponding 3x3 window
                int min_val = feature_map[i][j];
                for (int m = 0; m < 3; m = m + 1) begin
                    for (int n = 0; n < 3; n = n + 1) begin
                        if (feature_map[i+m][j+n] < min_val)
                            min_val = feature_map[i+m][j+n];
                    end
                end
                $write("i=%6d, j=%6d, min_val=%d\n", i, j, min_val);
            end
        end
    end

endmodule
