module barras_rgb(COLUMNA,R,G,B);

	input [10:0]COLUMNA;

	output reg [7:0]R;
	output reg [7:0]G;
	output reg [7:0]B;

	parameter width_barra = 100;

	always @(COLUMNA)
	begin
		if ((COLUMNA-216) < width_barra)
		begin
			R[7:0]<=8'b11111111;
			G[7:0]<=8'b11111111;
			B[7:0]<=8'b11111111;
		end
		else if ((COLUMNA-216) < 2*width_barra)
		begin
			R[7:0]<=8'b11111111;
			G[7:0]<=8'b11111111;
			B[7:0]<=8'b00000000;
		end
		else if (COLUMNA-216 < 3*width_barra)
		begin
			R[7:0]<=8'b00000000;
			G[7:0]<=8'b11111111;
			B[7:0]<=8'b11111111;
		end
		else if ((COLUMNA-216) < 4*width_barra)
		begin
			R[7:0]<=8'b00000000;
			G[7:0]<=8'b11111111;
			B[7:0]<=0;
		end
		else if ((COLUMNA-216) < 5*width_barra)
		begin
			R[7:0]<=8'b11111111;
			G[7:0]<=8'b00000000;
			B[7:0]<=8'b11111111;
		end
		else if ((COLUMNA-216) < 6*width_barra)
		begin
			R[7:0]<=8'b11111111;
			G[7:0]<=8'b00000000;
			B[7:0]<=8'b00000000;
		end
		else if ((COLUMNA-216) < 7*width_barra)
		begin
			R[7:0]<=8'b00000000;
			G[7:0]<=8'b00000000;
			B[7:0]<=8'b11111111;
		end
		else
		begin
			R[7:0]<=8'b00000000;
			G[7:0]<=8'b00000000;
			B[7:0]<=8'b00000000;
		end
	end
endmodule