//FSM
module MM (			//Mealy Machine
  input wire clk,
  input wire reset,
  input wire in,
  output reg out
);
  typedef enum logic [2:0] {                //2^3=8
    S0, //000=0
    S1, //001=1
    S2, //010=2
  	S3,	//011=3
  	S4,	//100=4
  	S5,         //101=5
  	S6          //110=6
  } State;
  reg [1:0] current_state;
  reg next_state;
  always @(posedge clk or posedge reset) begin
    if (reset)
      current_state <= S0;
    else
      current_state <= next_state;
    
    case (current_state)
      S0: begin
        if (in==1)
          next_state = S1;				//in takes the pattern 101011
        else
          next_state = S0;
        out = 0;
      end
      endmodule
      S1: begin
        if (in==0)
          next_state = S2;
        else
          next_state = S0;
        out = 0;
      end
      
      S2: begin
        if (in==1)
          next_state = S3;
        else
          next_state = S0;
        out = 0;
      end
      S3: begin
        if (in==0)
          next_state = S4;
        else
          next_state = S0;
        out = 0;
      end
      S4: begin
        if (in==1)
          next_state = S5;
        else
          next_state = S0;
        out = 0;
      end
      S5: begin
        if (in==1)
          next_state = S6;
        else 
          next_state = S0;
        out = 1;
      end
      default: next_state = S0;
    endcase
  end
endmodule
