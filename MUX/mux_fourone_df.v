module mux_fourone_df(output reg Y, input [3:0] I, input [1:0] S,);
assign Y = (S == 2'b00) ? I[0] :
                 (S == 2'b01) ? I[1] :
                 (S == 2'b10) ? I[2] :
                 (S == 2'b11) ? I[3] ;
endmodule
