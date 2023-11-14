module LCD_SYNC(CLK,RESET,NCLK,GREST,HD,VD,DEN, COLUMNA, FILA);

input 		CLK, RESET;
output 		NCLK, GREST, HD, VD, DEN;

wire			o_tc_hd;
wire			o_tc_vd;
output 	 	[10:0]COLUMNA;
output 		[9:0]FILA;

//	total imits

parameter hi=0;
parameter hf=1055;
parameter vi=0;
parameter vf=524;

// screen limits

parameter	xi=216;
parameter	xf=1015;
parameter	yi=35;
parameter	yf=514;

//--------------------------Debug
/*
parameter	xi=1;
parameter	xf=8;
parameter	yi=1;
parameter	yf=6;
parameter hi=0;
parameter hf=10;
parameter vi=0;
parameter vf=10;
output 	 	[3:0]COLUMNA;
output 		[3:0]FILA;
*/
//--------------------------------

pll_ltm 			pll_timer	(.inclk0(CLK),		.c0(NCLK));
contNb #(hf) 	counterH 	(.reset(RESET), 	.clk(NCLK), .Q(COLUMNA), 	.tc(o_tc_hd),		.up_down(1'b1), .enable(1'b1));
contNb #(vf) 	counterV 	(.reset(RESET), 	.clk(NCLK), .Q(FILA), 		.tc(o_tc_vd),		.up_down(1'b1), .enable(o_tc_hd));

assign DEN = ((xi<COLUMNA) &&(COLUMNA<xf) && (yi<FILA) && (FILA<yf)) ? 1'b1 : 1'b0;
assign GREST = RESET;

assign HD = !o_tc_hd;
assign VD = !((o_tc_vd) && (o_tc_hd));

endmodule