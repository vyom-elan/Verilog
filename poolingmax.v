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
