module fsm_4states(output reg gnt,
                   input dly, done, req, clk, rst_n);
  parameter [1:0] IDLE = 2'd0,
  BBUSY = 2'd1,
  BWAIT = 2'd2,
  BFREE = 2'd3;
  reg [1:0] state;
  always @(posedge clk or negedge rst_n)
  if (!rst_n) begin
    state <= IDLE;
    gnt <= 1'b0;
  end
  else begin
    state <= 2'bx;
    gnt <= 1'b0;
    case (state)
      IDLE : if (req) begin
        state <= BBUSY;
        gnt <= 1'b1;
      end
    else
    BBUSY: if (!done) begin
      state <= BBUSY;
      gnt <= 1'b1;
    end
    else if ( dly) begin
      state <= BWAIT;
      gnt <= 1'b1;
    end
    else 
      state <= BFREE;
      BWAIT: if ( dly) begin
        state <= BWAIT;
        gnt <= 1'b1;
      end
    else state <= BFREE;
      BFREE: if (req) begin
        state <= BBUSY;
        gnt <= 1'b1;
      end
      else 
        state <= IDLE;
    endcase
  end
endmodule
