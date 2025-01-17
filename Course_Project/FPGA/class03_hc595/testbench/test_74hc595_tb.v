`timescale 10ns/10ns
module test_74hc595_tb();

reg clk,rst,key;
wire lock595,out595,clk595;

test_74hc595 test_74hc595_1(
	.clk(clk),
	.rst(rst),
	.key(key),
	.lock595(lock595),
	.out595(out595),
	.clk595(clk595)
);


initial begin
clk = 0;
rst = 1;
key = 1;
end

always #1 clk <= ~clk;

initial begin
#100;
rst <= 0;
#3000000;
rst <= 1;
#3000000;
key <= 0;
#3000000;
key <= 1;
#300000000;
end

endmodule