module pipeline_tb;

reg clk = 0;
reg reset = 1;

Pipeline_Top uut(clk, reset);

always #5 clk = ~clk;

initial begin
    #10 reset = 0;
    #200 $finish;
end

endmodule
