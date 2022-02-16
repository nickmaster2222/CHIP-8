`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 09:30:02 PM
// Design Name: 
// Module Name: fetch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

import types::*;
module fetch(
    input clk,
    input rst,
	input branching,
	input u12 branch,
	input offsetting,
	input i16 offset,
	input stalled,
	output u16 program_counter
);

always_ff @(posedge clk) begin
    if(rst) begin
		program_counter = 32;//should always be even but I won't enfore that/forceably set the LSB to 0
	end else begin
		if(branching)
			program_counter <= branch;
		else if(offseting)
			program_counter <= program_counter + 2 + offset;
		else if(stalled)
			program_counter <= program_counter + 2;
		else
			program_counter <= program_counter;//for when waiting on a keypress
	end
end


endmodule
