module lcd_display(
	input lcd_clk, //lcd 驱动时钟
	input sys_rst_n, //复位信号
	input [10:0] pixel_xpos, //像素点横坐标
	input [10:0] pixel_ypos, //像素点纵坐标
	output reg [15:0] pixel_data //像素点数据
);
//参数定义
parameter H_DISP = 11'd800;//分辨率一行
parameter V_DISP = 11'd480;//分辨率一列
localparam WHITE = 16'b11111_111111_11111; //RGB565 白色
localparam BLACK = 16'b00000_000000_00000; //RGB565 黑色
localparam RED = 16'b11111_000000_00000; //RGB565 红色
localparam GREEN = 16'b00000_111111_00000; //RGB565 绿色
localparam BLUE = 16'b00000_000000_11111; //RGB565 蓝色


////LCD 彩条显示
//always @(posedge lcd_clk or negedge sys_rst_n) begin
//	if (!sys_rst_n)
//		pixel_data <= 16'd0;
//	else begin
//		if((pixel_ypos >=0) && (pixel_ypos < (V_DISP/5)*1))
//			pixel_data <= WHITE;
//		else if((pixel_ypos >= (V_DISP/5)*1) && (pixel_ypos < (V_DISP/5)*2))
//			pixel_data <= BLACK;
//		else if((pixel_ypos >= (V_DISP/5)*2) && (pixel_ypos < (V_DISP/5)*3))
//			pixel_data <= RED;
//		else if((pixel_ypos >= (V_DISP/5)*3) && (pixel_ypos < (V_DISP/5)*4))
//			pixel_data <= GREEN;
//		else
//			pixel_data <= BLUE;
//	end
//end
wire		[4:0]		cnt_x;						
wire		[3:0]		cnt_y;						
wire					sum_div40;							// least significant bit XOR

assign cnt_y = pixel_ypos / 40;
assign cnt_x = pixel_xpos / 40;
assign sum_div40 = cnt_y[0]^cnt_x[0];

//LCD方格显示
always @(posedge lcd_clk or negedge sys_rst_n) begin
	if (!sys_rst_n)
		pixel_data <= 16'd0;
	else begin
		if(sum_div40 == 1)
			pixel_data <= WHITE;
		else 
			pixel_data <= BLACK;
	end
end
//always @(posedge lcd_clk or negedge sys_rst_n) begin
//	if (!sys_rst_n)
//		pixel_data <= 16'd0;
//	else 
//		pixel_data <= GREEN;
//	end //LCD 设置界面显示红色
endmodule