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
	output u4 r1,
	output u4 r2,
	output u8 opcode,
	output u12 immediate
    );
	always_comb begin
		case(instruction) begin
			16'h0000: begin 
				opcode = 0;//NOP
			end
			16'h00E0: begin		//CLS
				opcode = 1;
			end
			16'h00EE: begin 	//RET
				opcode = 2;
			end
			16'h1???: begin 	//JP addr
				opcode = 3;
				immediate = instruction[4:];
			end
			16'hB???: begin 	//JP V0, addr
				opcode = 4;
			end
			16'h2???: begin 	//CALL addr
				opcode = 4;
				immediate = instruction[4:];
			end
			16'h3???: begin 	//SE Vx, byte
				opcode = 5;
			end
			16'h5???: begin 	//SE Vx, Vy
				opcode = 5;
			end
			16'h4???: begin 	//SNE Vx, byte
				opcode = 6;
			end
			16'h9??0: begin 	//SNE Vx, Vy
				opcode = 6;
			end
			16'h6???: begin 	//LD Vx, byte
				opcode = 7;
			end
			16'h8??0: begin 	//LD Vx, Vy
				opcode = 7;
			end
			16'hA???: begin 	//LD I, addr
				opcode = 7;
			end
			16'hF?07: begin 	//LD Vx, DT
				opcode = 7;
			end
			16'hF?0A: begin 	//LD Vx, K
				opcode = 22;
			end
			16'hF?15: begin 	//LD DT, Vx
				opcode = 7;
			end
			16'hF?18: begin 	//LD ST, Vx
				opcode = 7;
			end
			16'hF?29: begin 	//LD F, Vx
				opcode = 23;
			end
			16'hF?33: begin 	//LD B, Vx
				opcode = 24;
			end
			16'hF?55: begin 	//LD [I], Vx
				opcode = 5;
			end
			16'hF?65: begin 	//LD Vx, [I]
				opcode = 5;
			end
			16'h7???: begin 	//ADD Vx, byte
				opcode = 8;
			end
			16'h8??4: begin 	//ADD Vx, Vy
				opcode = 8;
			end
			16'hF?1E: begin 	//ADD I, Vx
				opcode = 8;
			end
			16'h8??5: begin 	//SUB Vx, Vy
				opcode = 12;
			end
			16'h8??7: begin 	//SUBN Vx, Vy
				opcode = 14;
			end
			16'h8??1: begin 	//OR Vx, Vy
				opcode = 9;
			end
			16'h8??2: begin 	//AND Vx, Vy
				opcode = 10;
			end
			16'h8??3: begin 	//XOR Vx, Vy
				opcode = 11;
			end
			16'h8??6: begin 	//SHR Vx, Vy
				opcode = 13;
			end
			16'h8??E: begin 	//SHL Vx
				opcode = 15;
			end
			16'hC???: begin 	//RND Vx, byte
				opcode = 18;
			end
			16'hD???: begin 	//DRW Vx, Vy, nibble
				opcode = 19;
			end
			16'hE?9E: begin 	//SKP Vx
				opcode = 20;
			end
			16'hE?A1: begin 	//SKNP Vx
				opcode = 21;
			end
		endcase
	end
endmodule
