/* Copyright (C) 2014 Hadi Esmaeilzadeh */

module SevenSegDisplayExample
  (input CLOCK_50, 
   input [9:0] SW,	
   input [3:0] KEY, 
   output [6:0] HEX0,
   output [6:0] HEX1,
   output [6:0] HEX2,
   output [6:0] HEX3,
   output reg [7:0] LEDG
   );
	parameter n = 31;
	
	reg [n:0] counter = 0;
	wire [3:0] num = 0;
	
	PLL	PLL_inst (
	.inclk0 ( CLOCK_50 ),
	.c0 ( CLOCK_10 ),
	.locked ( locked_sig )
	);

	
	ClkDivider clk1 (CLOCK_10, CLOCK);
	
	// HEX1
	reg[3:0] decimal_counter;
	
	always @(posedge CLOCK) begin
		decimal_counter <= decimal_counter + 1;

		if (decimal_counter == 9)
		//if (decimal_hand_counter == 10)
			decimal_counter <= 0;
	end

	
	dec2_7seg u3 (decimal_counter, HEX0);
	
endmodule

module ClkDivider(input clkIn, output clkOut);
	reg[31: 0] counter;
	
	reg clkReg;
	
	assign clkOut = clkReg;
	
	always @(posedge clkIn) begin
		counter <= counter + 1;
		
		if (counter == 25000000) begin
			clkReg <= ~clkReg;
			counter <= 0;
		end
	end
endmodule

module dec2_7seg(input [3:0] num, output [6:0] display);
   assign display = 
	num == 0 ? ~7'b0111111 :
	num == 1 ? ~7'b0000110 :
	num == 2 ? ~7'b1011011 :
	num == 3 ? ~7'b1001111 :
	num == 4 ? ~7'b1100110 :
	num == 5 ? ~7'b1101101 :
	num == 6 ? ~7'b1111101 :
	num == 7 ? ~7'b0000111 :
	num == 8 ? ~7'b1111111 :
	num == 9 ? ~7'b1100111 :
	7'bxxxxxxx;   // Output is a don't care if illegal input
endmodule // dec2_7seg
