
`timescale 1ns/1ps

module barras_lcd_tb();
	localparam T = 20;
	
	integer fd;
	event cierraFichero;
	
	wire NCLK,GREST,HD,VD,DEN;
	wire [7:0]R;
	wire [7:0]G;
	wire [7:0]B;
	reg clk =0;
	reg reset = 0;
	
	barras_lcd DUT (clk, reset, NCLK,GREST,HD,VD,DEN, R, G, B);
	
	always
	begin
		#(T/2) clk <= ~clk; //the clk change half period
	end
	
	initial
	begin
		#(T*10)
		reset = 1'b1;
		#(T*4)
		@(posedge VD);
		$display ("Fin de la simulacion\n");
		-> cierraFichero;
		#10;
		$stop;
	end
		
	initial
	begin
		fd = $fopen("vga.txt","w");
		@(cierraFichero);
		disable guardaFichero;
		$display("Cierro  fichero");
		$fclose(fd);
	end

	initial forever begin:guardaFichero
		@(posedge NCLK)
		$fwrite(fd,"%0t ps: %b %b %b %b %b %b \n", $time, HD, VD, DEN, R, G ,B);
	end
		
endmodule