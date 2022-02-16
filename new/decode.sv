`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 09:30:02 PM
// Design Name: 
// Module Name: decode
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

import types:**
module decode(
    input clk,
    input rst,
	input u16 instruction,//this will be passed to execute as well for multi-clock instructions without this section having to handle it
	input u8 registers[15:0],
	input u16 I,
	output u16 r1,
	output u16 r2,
	output u8 opcode,
	output u12 immediate,
	output decode_trap //invalid instruction encountered
    );
	always_comb begin//this could be shortened to instead use a LUT for the opcodes and this only handle every input format
		case(instruction) inside
			16'h0000: begin 
				opcode = 0;		//NOP
			end
			16'h00E0: begin		//CLS
				opcode = 1;
			end
			16'h00EE: begin 	//RET
				opcode = 2;
			end
			16'h1???: begin 	//JP addr
				opcode = 3;
				immediate = instruction[2:0];
			end
			16'hB???: begin 	//JP V0, addr
				opcode = 4;
				immediate = instruction[2:0]
			end
			16'h2???: begin 	//CALL addr
				opcode = 5;
				immediate = instruction[2:0];
			end
			16'h3???: begin 	//SE Vx, byte
				opcode = 6;
				immediate = instruction[1:0];
				r1 = registers[instruction[2]];
			end
			16'h5???: begin 	//SE Vx, Vy
				opcode = 7;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'h4???: begin 	//SNE Vx, byte
				opcode = 8;
				immediate = instruction[1:0];
				r1 = registers[instruction[2]];
			end
			16'h9??0: begin 	//SNE Vx, Vy
				opcode = 9;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'h6???: begin 	//LD Vx, byte
				opcode = 10;
				immediate = instruction[1:0];
				r1 = registers[instruction[2]];
			end
			16'h8??0: begin 	//LD Vx, Vy
				opcode = 11;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'hA???: begin 	//LD I, addr
				opcode = 10;
				immediate = instruction[3:0];
				r1 = 16;//Physical register name for I
			end
			16'hF?07: begin 	//LD Vx, DT
				opcode = 13;
				r1 = registers[instruction[2]];
			end
			16'hF?0A: begin 	//LD Vx, K
				opcode = 14;
				r1 = registers[instruction[2]];
			end
			16'hF?15: begin 	//LD DT, Vx
				opcode = 15;
				r1 = registers[instruction[2]];
			end
			16'hF?18: begin 	//LD ST, Vx
				opcode = 16;
				r1 = registers[instruction[2]];
			end
			16'hF?29: begin 	//LD F, Vx
				opcode = 17;
				r1 = registers[instruction[2]];
			end
			16'hF?33: begin 	//LD B, Vx
				opcode = 18;
				r1 = registers[instruction[2]];
			end
			16'hF?55: begin 	//LD [I], Vx
				opcode = 19;
				r1 = registers[instruction[2]];
			end
			16'hF?65: begin 	//LD Vx, [I]
				opcode = 20;
				r1 = registers[instruction[2]];
			end
			16'h7???: begin 	//ADD Vx, byte
				opcode = 21;
				immediate = instruction[1:0];
				r1 = registers[instruction[2]];
			end
			16'h8??4: begin 	//ADD Vx, Vy
				opcode = 22;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'hF?1E: begin 	//ADD I, Vx
				opcode = 22;
				r1 = registers[instruction[2]];
				r2 = 16;
			end
			16'h8??5: begin 	//SUB Vx, Vy
				opcode = 24;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'h8??7: begin 	//SUBN Vx, Vy
				opcode = 25;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'h8??1: begin 	//OR Vx, Vy
				opcode = 26;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'h8??2: begin 	//AND Vx, Vy
				opcode = 27;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'h8??3: begin 	//XOR Vx, Vy
				opcode = 28;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'h8??6: begin 	//SHR Vx, Vy
				opcode = 29;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'h8??E: begin 	//SHL Vx
				opcode = 30;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
			end
			16'hC???: begin 	//RND Vx, byte
				opcode = 31;
				r1 = registers[instruction[2]];
				immediate = instruction[1:0];
			end
			16'hD???: begin 	//DRW Vx, Vy, nibble
				opcode = 32;
				r1 = registers[instruction[2]];
				r2 = registers[instruction[1]];
				immediate = instruction[0];
			end
			16'hE?9E: begin 	//SKP Vx
				opcode = 33;
				r1 = registers[instruction[2]];
			end
			16'hE?A1: begin 	//SKNP Vx
				opcode = 34;
				r1 = registers[instruction[2]];
			end
			default:
				decode_trap = 1;
		endcase
	end
endmodule
