/* Copyright (C) 2014 Hadi Esmaeilzadeh */

module TestFlipFlop;
	parameter clkPeriod = 10;

	reg reset, clk;
	reg dIn;
	
	wire dOut;
	
	integer i;
	
	FlipFlop u0(reset, clk, dIn, dOut);
	
	always begin
		#(clkPeriod / 2) clk = ~clk;
	end
	
	initial begin
		# 3
		clk = 0;
		dIn = 1;
		
		# 17
		reset = 1;
		# 7
		reset = 0;
	
		for (i = 0; i < 10; i = i + 1) begin
			#7 dIn = ~dIn;
		end
		
		$stop;
	end
	
	always @(posedge clk) begin
	  	$display("i = %d: reset=%d, clk=%d, dIn=%d, dOut=%d", i, reset, clk, dIn, dOut);
	  	# 1
	  	$display("i = %d: reset=%d, clk=%d, dIn=%d, dOut=%d", i, reset, clk, dIn, dOut);
	  	$display("==========================================================");
	end
		
endmodule