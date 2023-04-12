//ALU 4-bit

module ALU(x,y,a,b,opcode);
input [3:0]a,b,opcode;
output [3:0]x,y;
always @(a,b,opcode)
	case(opcode)
		4'b0000: x[0]= |a;
		4'b0001: x[0]= &a;
		4'b0010: x[0]= ^a;
		4'b0011: x = a&b;
		4'b0100: x = a|b;
		4'b0101: x = a^b;
		4'b0110: x[0]=a>b;
		4'b0111: x[0]=a<b;
		4'b1000: x[0]=!a;
		4'b1001: x[0]= a==b;
		4'b1010: {y[0],x}= a+b;
		4'b1011: x = a-b;
		4'b1100: {y,x}=a*b;
		4'b1101: {y,x}=a>>b;
		4'b1110: {y,x}=a<<b;
		4'b1111: x = ~a;
		default:$display("error");
	endcase
endmodule