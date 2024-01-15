module iiitb_piso (clk, load, data_in, data_out);
  
  input clk, load;
  input [3:0]data_in;
  output data_out;
  //reg temp;
  
  // PISO register array to load and shift data
  reg [3:0]q;
  //reg [3:0]q= 0;
  
  always @ (posedge clk) 
  begin
    if (~load)
    begin
      q = data_in;// Load the data to the PISO register array 
      //temp=(~(data_in[0]));
    end
    else
    begin // Shift the loaded data 1 bit right; into the serial data out register
      q[0]=q[1];
      //temp=~q[0];
      //q[0]=~q[0];
      q[1]=q[2];
      q[2]=q[3];
      q[3]=1'b1;
    end
  end
  //assign data_out=~temp; //Serial Output
  assign data_out=q[0];
endmodule
