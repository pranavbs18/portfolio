module cla_4bit (
    input  [3:0] a,      
    input  [3:0] b,        
    input        cin,    
    output [3:0] sum,    
    output       cout,   
    output       pg,     // block propagate
    output       gg      // block generate
);

    
    wire [3:0] g, p;
    wire [3:0] c;  // internal carries
   
    // Bit-level generate and propagate
    assign g = a & b;           // Generate: ai AND bi
    assign p = a ^ b;           // Propagate: ai XOR bi
   
    // Carry lookahead logic
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);
   
    // Sum calculation
    assign sum = p ^ c;
   
    // Block-level generate and propagate for next level
    assign gg = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    assign pg = p[3] & p[2] & p[1] & p[0];

endmodule
