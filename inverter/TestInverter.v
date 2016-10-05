/* Copyright (C) 2014 Hadi Esmaeilzadeh */

`timescale 1ns/1ns

module TestInverter;
	reg p;
	wire q;
	
	integer i;
	
	Inverter u0(p, q);
	
	initial begin
		# 10
		p = 0;
		# 7
		p = 1;
		
		for (i = 0; i < 100; i = i + 1) begin
			# 5
			p = ~p;
		end
		
		$stop;
	end
	
endmodule