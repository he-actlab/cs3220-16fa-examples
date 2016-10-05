/* Copyright (C) 2014 Hadi Esmaeilzadeh */

module  Inverter(a, z);
	input a;
	output z;
	
	assign z = ~a;
endmodule