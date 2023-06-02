module mealy_verilog_code(out, in, rst, clk);
output out;
input in;
input clk, rst;
reg out;
reg[1:0] state;
parameters0=2'd0, s1=2'd1, s2=2'd2, s3=2'd3;
always @(posedge clk or negedge rst)
if(rst==0) begin state=s0; out=0; end
else begin
case (state)
s0: if(in==0) begin out=0; state=s1; end
else begin out=0; state=s0; end
s1: if(in==0) beginout=0; state=s1; end
else begin out=0; state=s2; end
s2: if(in==0) begin out=0; state=s3; end
else begin out=0; state=s0; end
s3: if(in==0) begin out=0; state=s1; end
else begin out=1; state=s2; end
default: state=s0;
endcase
end
endmodule
