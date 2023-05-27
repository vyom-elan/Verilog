// structural lvl 

module half_adder(
    input i0,
    input i1,
    output s,
    output c
    );
               and(c,i0,i1);
               xor(s,i0,i1);
endmodule
