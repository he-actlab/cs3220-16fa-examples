/* Copyright (C) 2014 Hadi Esmaeilzadeh */

module FlipFlop(reset, clk, dIn, dOut);
	input reset, clk;
	input dIn;
	
	output dOut;
	reg dOut;
	
	always @(posedge reset or posedge clk) begin
		dOut <= dIn;
		if (reset)
			dOut <= 0;
	end
endmodule