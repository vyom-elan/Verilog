`timescale 1ns / 1ps
module maxPooling(input clk,
		  input [7:0] ip_a, //inputa
		  input [7:0] ip_b, //inputb	
		  input [7:0] ip_c, //inputc
		  input [7:0] ip_d, //inputd
                  input en,  //en pin
		  output reg signed [7:0] op, //output
                  output reg PoolComplete);
	reg [7:0] initialMax = 7'b1000000;
	reg [7:0] tempOutput;
    
   	always @ (posedge clk) begin
		if(en) begin
			if($signed(initialMax) < $signed(ip_a)) begin
				if($signed(ip_b) < $signed(ip_a)) begin
					if($signed(ip_c) < $signed(ip_a)) begin
						if($signed(ip_d) < $signed(ip_a)) begin
							op <= ip_a;
							PoolComplete <= 1;
						end
						else begin
							op <= ip_d;
							PoolComplete <= 1;
						end
					end
					else begin
						if($signed(ip_c) < $signed(ip_d)) begin
							op <= ip_d;
							PoolComplete <= 1;
						end
						else begin
							op <= ip_c;
							PoolComplete <= 1;
						end
					end
				end
				else begin
					if($signed(ip_c) < $signed(ip_b)) begin
						if($signed(ip_d) < $signed(ip_b)) begin
							op <= ip_b;
							PoolComplete <= 1;
						end
						else begin
							op <= ip_d;
							PoolComplete <= 1;
						end
					end
					else begin
						if($signed(ip_c) < $signed(ip_d)) begin
							op <= ip_d;
							PoolComplete <= 1;
						end
						else begin
							op <= ip_c;
							PoolComplete <= 1;
						end
					end 
				end
			end  
			else begin
				op <= initialMax;
				PoolComplete <= 1;
			end
		end
		else begin
			op <= 0;
			PoolComplete <= 0;
		end
	end
    
endmodule



#include <stdio.h>
void extractAllKernels(int inputMatrix[8][8], int kernelSize, int outputKernels[][3][3]) {
    const int rows = 8;
    const int cols = 8;

    // Calculate the number of kernels that can be extracted
    int numKernels = (rows - kernelSize + 1) * (cols - kernelSize + 1);

    // Initialize indices for the output kernels
    int kernelIndex = 0;

    // Loop through the input matrix to extract all kernels
    for (int i = 0; i < rows - kernelSize + 1; i++) {
        for (int j = 0; j < cols - kernelSize + 1; j++) {
            // Extract a 3x3 kernel at the current position
            for (int k = 0; k < kernelSize; k++) {
                for (int l = 0; l < kernelSize; l++) {
                    outputKernels[kernelIndex][k][l] = inputMatrix[i + k][j + l];
                }
            }

            // Increment the kernel index
            kernelIndex++;
        }
    }
}

int main() {
    // Example 8x8 matrix
    int inputMatrix[8][8] = {
        {1, 2, 3, 4, 5, 6, 7, 8},
        {9, 10, 11, 12, 13, 14, 15, 16},
        {17, 18, 19, 20, 21, 22, 23, 24},
        {25, 26, 27, 28, 29, 30, 31, 32},
        {33, 34, 35, 36, 37, 38, 39, 40},
        {41, 42, 43, 44, 45, 46, 47, 48},
        {49, 50, 51, 52, 53, 54, 55, 56},
        {57, 58, 59, 60, 61, 62, 63, 64}
    };

    // Define the size of the kernel
    const int kernelSize = 3;

    // Calculate the maximum number of kernels that can be extracted
    const int maxKernels = (8 - kernelSize + 1) * (8 - kernelSize + 1);

    // Declare an array to store all extracted kernels
    int outputKernels[maxKernels][3][3];

    // Extract all kernels from the input matrix
    extractAllKernels(inputMatrix, kernelSize, outputKernels);

    // Display all extracted kernels
    printf("All 3x3 kernels extracted from the 8x8 matrix:\n");
    for (int i = 0; i < maxKernels; i++) {
        printf("Kernel %d:\n", i + 1);
        for (int j = 0; j < kernelSize; j++) {
            for (int k = 0; k < kernelSize; k++) {
                printf("%d\t", outputKernels[i][j][k]);
            }
            printf("\n");
        }
        printf("\n");
    }

    return 0;
}
