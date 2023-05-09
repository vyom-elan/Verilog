module fulladder(a,b,ic,o,oc);
  input a,b,ic;     //inputs  
  output o,oc;      //outputs
  assign o = (~ic & ((a & ~b) | (~a & b)) ) | (ic & ~((a & ~b) | (~a & b)) );   
  assign oc = (a & b) | (b & ic) | (ic & a); 
endmodule
