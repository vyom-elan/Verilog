module timertwo
    #(parameter BITS = 8)
(
    input clk,   
    input rst,    
    input en,    
    input [BITS - 1 : 0] d_in,  
    output [BITS - 1 : 0] q,    
    output tick                 
);
    reg [BITS - 1 : 0] rCounter;
    wire [BITS - 1 : 0] rNext;
    always @(posedge clk, posedge rst)
    begin
        if (rst)
            rCounter <= d_in;
        else
            if (en) begin
                rCounter <= rNext;
            end            
    end  
    assign rNext = (rCounter == 0) ? d_in : rCounter - 1;
    assign tick = (rCounter == 0) ? 1'b1 : 1'b0;
    assign q = rCounter;
endmodule
