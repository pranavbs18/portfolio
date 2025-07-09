module tb_cla_4bit;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout, pg, gg;
   
    // Instantiating DUT
    cla_4bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout),
        .pg(pg),
        .gg(gg)
    );
   
    initial begin
        $display("4-bit CLA Test Starting...");
       
        // Test basic cases
        a = 4'h3; b = 4'h5; cin = 0; #10;
        $display("3 + 5 = %h (cout=%b)", sum, cout);
       
        a = 4'hF; b = 4'h1; cin = 0; #10;
        $display("F + 1 = %h (cout=%b)", sum, cout);
       
        a = 4'h7; b = 4'h8; cin = 1; #10;
        $display("7 + 8 + 1 = %h (cout=%b)", sum, cout);
       
        $display("Test completed!");
        $finish;
    end

endmodule
