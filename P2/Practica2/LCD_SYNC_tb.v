
`timescale 1ns/1ps

module LCD_SYNC_tb();
	
	localparam T = 40;
	wire horizontalD, verticalD, display_en, reseto, clko;
	reg clki = 0;
	reg reseti = 0;
	
	LCD_SYNC DUT(.CLK(clki),	.RESET(reseti),	.NCLK(clko),	.GREST(reseto),	.HD(horizontalD),	.VD(verticalD),	.DEN(display_en));
	
	always
	begin
		#(T/2) clki <= ~clki; //the clk change half period
	end
	
	initial
	begin
		RESET_ALL();
		#(T*10)
		//WAIT_HD();
		WAIT_VD();
		$display("Fin de la simulacion");
		$stop;
	end


	task RESET_ALL;
	begin
		reseti = 1'b0;
		#(T*10)
		reseti = 1'b1;
	end
	endtask


	task WAIT_TIME;
	input tiempo;
	begin
		repeat(tiempo) @(posedge clki);
	end
	endtask


	task WAIT_HD;
	begin
		@(negedge horizontalD);
	end
	endtask

	task WAIT_VD;
	begin
		repeat(3)	@(negedge verticalD);
	end
	endtask

endmodule