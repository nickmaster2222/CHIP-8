`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 09:30:02 PM
// Design Name: 
// Module Name: execute
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
module execute(
    input clk,
    input rst
	input u16 instruction,//is passed to execute multi-clock instructions so that the decode doesn't have to bother with those
	input u8 r1,
	input u8 r2,
	input u16 I,
	input u8 opcode,
	input u12 immediate,
	input u16 keyboard,
	input stalled,
	output stall,
	output waiting_for_key,
	output branching,
	output u16 out,
	output u16 I_out,
	output u2 mem_in_out,//0 for no memory access, 1 for read memory, 2 for write memory
	output u16 mem_addr,
	output writeback_reg,
	output execute_trap
	output u5 bypass_reg,
	output u16 bypass_val
    );
	//											Load BCD representation
	enum multi_mode {NORMAL = 'b000, DRAW = 'b001, LD_B = 'b010};
		
	u4 key = 0;
	u8 stall_reason = 0;//what instruction we're stalling the pipeline for
	//Stall reasons
	//0 waiting for key press
	//1 waiting for key release
	always (posedge clk) begin
		if(waiting_for_key) begin
			case 0:
				if(keyboard[key])
					waiting_for_key <= 0;
			case 1:
				if(!keyboard[key])
					waiting_for_key <= 0;
		end
	end
	

	always_comb begin
		if(multi_mode == NORMAL)
			0: begin 	//NOP
				
			end 
			1: begin	//CLS
			
			end
			2: begin	//RET
			
			end
			3: begin	//JP addr
			
			end
			4: begin	//JP V0, addr
			
			end
			5: begin 	//CALL addr
			
			end
			6: begin 	//SE Vx, byte
			
			end
			7: begin 	//SE Vx, Vy
			
			end
			8: begin 	//SNE Vx, byte
			
			end
			9: begin 	//SNE Vx, Vy
			
			end
			10: begin 	//LD Vx, byte
			
			end
			11: begin 	//LD Vx, Vy
			
			end
			12: begin 	//LD I, addr
			
			end
			13: begin 	//LD Vx, DT
			
			end
			14: begin 	//LD Vx, K
			
			end
			15: begin 	//LD DT, Vx
			
			end
			16: begin 	//LD ST, Vx
			
			end
			17: begin 	//LD F, Vx
			
			end
			18: begin 	//LD B, Vx
			
			end
			19: begin 	//LD [I], Vx
			
			end
			20: begin 	//LD Vx, [I]
			
			end
			21: begin 	//ADD Vx, byte
			
			end
			22: begin 	//ADD Vx, Vy and ADD I, Vx
			
			end
			23: begin
			
			end
			24: begin 	//SUB Vx, Vy
			
			end
			25: begin 	//SUBN Vx, Vy
			
			end
			26: begin 	//OR Vx, Vy
			
			end
			27: begin 	//AND Vx, Vy
			
			end
			28: begin 	//XOR Vx, Vy
			
			end
			29: begin 	//SHR Vx, Vy
			
			end
			30: begin 	//SHL Vx
			
			end
			31: begin 	//RND Vx, byte
			
			end
			32: begin 	//DRW Vx, Vy, nibble
			
			end
			33: begin 	//SKP Vx
			
			end
			34: begin 	//SKNP Vx
			
			end
		end
	end


endmodule
