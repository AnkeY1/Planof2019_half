module tlv5618a_device(
	DATA_A,
	DATA_B,
	clk,
	rst,
	dac_sclk,
	dac_din,
	dac_csn
);

input [11:0]DATA_A;
input [11:0]DATA_B;
input clk,rst;

output dac_sclk,dac_din,dac_csn;

reg [11:0]BUFFER;
reg R1,R0;
reg flag;
reg ab;
reg start;
wire FastMode;
wire PowerCTR;
wire busy;

localparam SEND_STATE = 1'b0;
localparam WAIT_STATE = 1'b1;


tlv5618a_interface tlv5618a_interface1(
	.data({R1,FastMode,PowerCTR,R0,BUFFER}),
	.clk(clk),
	.rst(rst),
	.start(start),
	.busy(busy),
	.dac_sclk(dac_sclk),
	.dac_din(dac_din),
	.dac_csn(dac_csn)
);


always@(posedge clk,negedge rst)
if(!rst) begin
	R1<=0;
	R0<=1;
	flag<=WAIT_STATE;
	BUFFER<= 0;
	ab <= 0;
	start <= 0;
end
else case(flag)
	SEND_STATE:
		if(busy)
			flag<=WAIT_STATE;
		else
			start <= 1'b1;
	WAIT_STATE:
		if(!busy && ab) begin
			BUFFER<=DATA_A;
			R1<=1;
			R0<=0;
			flag<=SEND_STATE;
			ab <= 0;
		end
		else if(!busy && !ab) begin
			BUFFER<=DATA_B;
			R1<=0;
			R0<=1;
			flag<=SEND_STATE;
			ab <= 1;
		end
		else
			start <= 1'b0;
endcase

assign FastMode = 1;
assign PowerCTR = 0;

endmodule