//------------------------------------------------------------------------------------
// Universitat Politècnica de València
// Escuela Técnica Superior de Ingenieros de Telecomunicación
//------------------------------------------------------------------------------------
// Sistemas Digitales Programables
// Curso 2023-2024
//------------------------------------------------------------------------------------
//Nombre del archivo: contNb.v
//
// Descripción: Contador parametrizable de N bits
//			Entradas:
//				-Reset: cuando vale 0 resetea el valor del contador


// Contador de N bits sincrono
module contNb (reset, clk, Q, tc, up_down, enable);
	parameter 	M=10;
	parameter 	N = $clog2(M);
	input		reset,clk,enable, up_down;
	output reg 	[N-1:0]Q;
	output reg	tc;
	
	always @(posedge clk)
	begin
		if (!reset)
			Q <= {N{1'b0}};
		else
			if (enable== 1'b1)
				if (!up_down)
					Q <= (Q==0)? (M-1) : Q - 1;
				else
					Q <= (Q==(M-1))? {N{1'b0}} : Q + 1;
	end
	
	always @(Q, up_down)
	begin
		if (!up_down)
			tc = (Q==0) ? 1'b1 : 1'b0;
		else
			tc = (Q==M-1) ? 1'b1 : 1'b0;
	end

endmodule