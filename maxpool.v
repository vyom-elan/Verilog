`timescale 1ns/1ps
module maxpool(
    input clk,
    input rst,
    input [7:0] feature_map[7:0][7:0],
    output reg [7:0] pooled_map[5:0][5:0]
);
    reg [7:0] max_val;
    integer i, j, k, l;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
          pooled_map[i][j] <= 8'h00; 
            // Reset pooled_map on reset
            /*for (i = 0; i < 6; i = i + 1) begin
                for (j = 0; j < 6; j = j + 1) begin
                    // Initialize to 0
                end
            end*/
        end else begin
            // Perform max pooling
            for (i = 0; i < 6; i = i + 1) begin
                for (j = 0; j < 6; j = j + 1) begin
                    max_val = 8'h00; // Initialize max_val to minimum value
                    // Iterate over the 3x3 window
                    for (k = 0; k < 3; k = k + 1) begin
                        for (l = 0; l < 3; l = l + 1) begin
                            // Check if the current index is within the bounds of the feature map
                            if ((i + k < 8) && (j + l < 8)) begin
                                // Update max_val if current element is greater
                                if (feature_map[i+k][j+l] > max_val) begin
                                    max_val = feature_map[i+k][j+l];
                                    pooled_map[i][j] = max_val;
                                end
                            end
                        end
                    end
                    // Debug statement to display the values
                    $display("i=%d, j=%d, max_val=%d", i, j, max_val);
                    // Assign max_val to pooled_map
 
                    $display("Assigning %d to pooled_map[%d][%d]", max_val, i, j);
                end
            end
        end
    end
endmodule