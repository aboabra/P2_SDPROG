module Direccionamiento(FILA,COLUMNA, address);

	input 	[9:0]FILA;
	input 	[10:0]COLUMNA;
	reg 		[8:0]fila_p;
	reg 		[9:0]columna_p;
	reg 		[7:0]fila_i;
	reg 		[8:0]columna_i;
	output 	[16:0]address;
	
	always @(FILA  or COLUMNA)
	begin
		fila_p		= FILA - 35;
		columna_p	= COLUMNA - 216;
	end
	
	always @(fila_p or columna_p)
	begin
		fila_i		= fila_p/2;
		columna_i	= columna_p/2;
	end
	assign address = {fila_i, columna_i};
	
endmodule