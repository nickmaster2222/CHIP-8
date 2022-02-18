`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 09:30:02 PM
// Design Name: 
// Module Name: writeback
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


module writeback(
    input clk,
    input rst,
	input u5 reg_write1,
	input u5 reg_write2,
	input u5 r1,
	input u5 r2,
	input u8 val1,
	input u8 val2,
	output u8 registers [15:0],
	output u16 I,
	output u1 branching
	output u16 branch,
	
    );
	
	always_ff(negedge clk) begin
		
	end
	
endmodule
