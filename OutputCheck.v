`timescale 1ns / 1ps
module fpga_topp (
	input clk,
	input rst,
	output logic out
    );
    
	logic [31:0] counter;
	logic [7:0] A;
	logic [7:0] B;
	logic [7:0] C;
	logic [7:0] D;
	logic [7:0] E;
	logic [7:0] F;
	
  	data_gen gen(
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
        );
    prog_data prog(
        .clk(clk),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .out(out)
        ); 

endmodule



module data_gen (
    input clk,
	input rst,
    logic [31:0] counter,
    output logic [7:0] A,
    output logic [7:0] B,
    output logic [7:0] C,
    output logic [7:0] D 
    );

always @(posedge clk) begin
      A <= counter[7:0];
      B <= counter[15:8];
      C <= counter[23:16];
      D <= counter[31:24];
  end 
endmodule



module prog_data (
	input clk,
    input [7:0] A,
    input [7:0] B,
    input [7:0] C,
    input [7:0] D,
    output logic [7:0] E,
    output logic [7:0] F,	
    output logic out
    );
  
    logic [7:0] E_reg1, E_reg2;
    logic [7:0] F_reg1, F_reg2, F_reg3;
    
    always_ff @(posedge clk) begin
		E_reg1 <= A | (B & C);
    end
  
    always_ff @(posedge clk) begin
		E_reg2 <= E_reg1;
    end
  
    always_ff @(posedge clk) begin
        F_reg1 <= (B & C) ^ (A | D);
    end
  
    always_ff @(posedge clk) begin
		F_reg2 <= F_reg1;
    end
  
    always_ff @(posedge clk) begin
	    F_reg3 <= F_reg2;
    end
  
    assign E = E_reg2;
    assign F = F_reg2;
		
	always_ff @ (posedge clk) begin
        if (E == F) begin
            out <= 1'b1;
        end 
        else begin
            out <= 1'b0;
        end
    end
endmodule
