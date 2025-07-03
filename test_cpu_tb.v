module test_cpu;
    reg clk = 0;
    RISC_CPU cpu(.clk(clk));

    always #5 clk = ~clk; // Clock period = 10ns

    initial begin
        #100 $finish;
    end
endmodule
