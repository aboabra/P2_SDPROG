module barras_lcd (CLK,RST_n,NCLK,GREST,HD,VD,DEN, R ,G ,B);

	input CLK,RST_n;

	output  NCLK, GREST, HD, VD, DEN;
	output  [7:0]R;
	output  [7:0]G;
	output  [7:0]B;

	wire [10:0]COLUMNA;
	wire [9:0]FILA;

	LCD_SYNC 	lcd_sync_module 		(CLK,RST_n,NCLK,GREST,HD,VD,DEN, COLUMNA, FILA);
	barras_rgb 	barras_rgb_module 	(COLUMNA, R, G, B);

endmodule