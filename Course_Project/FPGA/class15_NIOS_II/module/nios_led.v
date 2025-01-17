module nios_led(
	clk,
	rst,
	led
);

input clk,rst;
output led;

nios u0(
	.clk_clk(clk),
	.reset_reset_n(rst),
	.led_export(led)
);

endmodule