module reduction_operators ();
  reg r_C;
  initial
    begin
      #10;
      $display("AND  Reduction of 4'b1101 is: %b", &4'b1101);
      $display("AND  Reduction of 4'b1111 is: %b", &4'b1111);
      $display("NAND Reduction of 4'b1101 is: %b", ~&4'b1101);
      $display("NAND Reduction of 4'b1111 is: %b", ~&4'b1111);
      $display("OR   Reduction of 4'b1101 is: %b", |4'b1101);
      $display("OR   Reduction of 4'b0000 is: %b", |4'b0000);
      $display("NOR  Reduction of 4'b1101 is: %b", ~|4'b1101);
      $display("NOR  Reduction of 4'b0000 is: %b", ~|4'b0000);
      $display("XOR  Reduction of 4'b1101 is: %b", ^4'b1101);
      $display("XOR  Reduction of 4'b0000 is: %b", ^4'b0000);      
      $display("XNOR Reduction of 4'b1101 is: %b", ~^4'b1101);
      $display("XNOR Reduction of 4'b0000 is: %b", ~^4'b0000);
      r_C = |4'b0010;
      $display("Reduction of 4'b0010 stored into a reg is: %b", r_C);
    end
endmodule
