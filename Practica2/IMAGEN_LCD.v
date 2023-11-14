module IMAGEN_LCD (CLK,RST_n, NCLK,GREST,HD,VD,DEN, R,G,B);
	
	input 	CLK, RST_n;
	output 	NCLK, GREST, HD, VD, DEN;
	output	[7:0]	R;
	output	[7:0]	G;
	output	[7:0]	B;
	wire 		[15:0]data;
	wire		[16:0]address;
	wire [10:0] COLUMNA;
	wire [9:0] FILA;
	
	
	LCD_SYNC 			lcd_sync_module 		(CLK,RST_n,NCLK,GREST,HD,VD,DEN, COLUMNA, FILA);
	Direccionamiento 	Dir_module				(FILA, COLUMNA, address);
	ROM_image			ROM_image_inst			(.address(address), .clock(CLK), .q(data));
	datos_a_rgb			datos_a_rgb_module	(data, R, G, B);
	

endmodule