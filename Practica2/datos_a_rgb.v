module datos_a_rgb (data, R, G, B);
	
	input		  	[15:0]	data;
	output wire [7:0]	R;
	output wire [7:0]	G;
	output wire [7:0]	B;
	
	assign R[7:0] = {data[15:11]	,  data[15:13]};
	assign G[7:0] = {data[10:5]	,  data[10:9]}	;
	assign B[7:0] = {data[4:0]		,  data[4:2]}	; 
	
	
endmodule