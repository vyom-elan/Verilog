//structural modelling

module jkff(input j, input k, input clk, input rs, output reg q, output reg qn);
    always@(posedge clk) begin
        if (rs) begin
            q=0;
            qn=1;
        end
        else begin
            q=(j&k)?~q:(j&~k)?1:(~j&k)?0:q;
            qn=~q;
        end
    end
endmodule

module johnson(input clk, input rs);
    wire q1, q2, q3, q4;
    wire qn1, qn2, qn3, qn4;
    jkff jkff1(qn4, q4, clk, rs, q1, qn1);
    jkff jkff2(q1, qn1, clk, rs, q2, qn2);
    jkff jkff3(q2, qn2, clk, rs, q3, qn3);
    jkff jkff4(q3, qn3, clk, rs, q4, qn4);
endmodule
