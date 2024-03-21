`timescale 1ns / 1ps

module minpool(
    input clk,
    input rst,
    input [7:0] feature_map[7:0][7:0],
    output reg [7:0] pooled_map[5:0][5:0]
);

    reg [7:0] min_val;
    integer i, j, k, l;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pooled_map[i][j] <= 8'hFF; // Initialize to maximum value
            // Reset pooled_map on reset
           /* for (i = 0; i < 6; i = i + 1) begin
                for (j = 0; j < 6; j = j + 1) begin
                    
                end
            end*/
        end else begin
            // Perform minimum pooling
            for (i = 0; i < 6; i = i + 1) begin
                for (j = 0; j < 6; j = j + 1) begin
                    min_val = 8'hFF; // Initialize min_val to maximum value
                    // Iterate over the 3x3 window
                    for (k = 0; k < 3; k = k + 1) begin
                        for (l = 0; l < 3; l = l + 1) begin
                            // Check if the current index is within the bounds of the feature map
                            if ((i + k < 8) && (j + l < 8)) begin
                                // Update min_val if current element is smaller
                                if (feature_map[i+k][j+l] < min_val) begin
                                    min_val = feature_map[i+k][j+l];
                                end
                            end
                        end
                    end
                    // Assign min_val to pooled_map
                    pooled_map[i][j] <= min_val;
                end
            end
        end
    end

endmodule
///////////////////////////////////////////////////