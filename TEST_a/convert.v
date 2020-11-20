
module convert(clk,vpp_re,bin_send);
	 input clk;
	 input [7:0] vpp_re;
 			 
	 output [15:0] bin_send;
	 reg [15:0] bin_send;
	 reg [15:0]  vp;
always @(posedge clk)
begin
	
	vp <= vpp_re *39+ 8'd190;
	bin_send <= vp;

 
end

	 
endmodule
