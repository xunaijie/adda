module vpp(
          input clk,
			 input [7:0] ch_dec,              
	      	 
			 output wire[7:0] vpp_out
 			 
    );

wire [7:0] vol_ins;
reg [7:0] vol_max;
reg [7:0] vol_min;
reg [20:0]  count;
reg[22:0] count_1;

parameter count_define = 20'd250000;

parameter count_define_1 = 22'd2500000;

assign vol_ins = ch_dec;
assign vpp_out = vol_max - vol_min;

always @(posedge clk)
begin
     count <= count + 1;
	  count_1 <= count_1 + 1;
	  
	  if(count == count_define) 
	  begin
			if(vol_ins > vol_max) 
			begin
				vol_max <= vol_ins;
			end
			if(vol_ins < vol_min) 
			begin
				vol_min <= vol_ins;
			end
		count <= 0;
	  end
	  
	  if(count_1 == count_define_1) 
	  begin
				vol_max <= vol_ins;
			
				vol_min <= vol_ins;
		end
		
		
		
		
end
	

endmodule
