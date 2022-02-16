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
	input u16 instruction,//this will be passed to execute as well for multi-clock instructions
	output u4 r1,
	output u4 r2,
	output u12 immediate
    );
	always_comb begin
		case(instruction) begin
			16'h0000: begin 
				instruction = 0;//NOP
			end
			16'h00E0: begin		//CLS
				instruction = 1;
			end
			16'h00EE: begin 	//RET
				instruction = 2;
			end
			16'h1???: begin 	//JP addr
				instruction = 3;
				immediate = instruction[4:];
			end
			16'h2???: begin 	//CALL addr
				instruction = 4;
				immediate = instruction[4:];
			end
			16'h3???: begin 	//SE Vx, byte
				instruction = 5;
				
			end
			16'h4???: begin 	//SNE Vx, byte
				instruction = 6;
			end
			16'h5???: begin 	//SE Vx, Vy
				instruction = 5;
			end
			16'h6???: begin 	//LD Vx, byte
				instruction = 7;
			end
			16'h7???: begin 	//ADD Vx, byte
				instruction = 8;
			end
			16'h8??0: begin 	//LD Vx, Vy
				instruction = 7;
			end
			16'h8??1: begin 	//OR Vx, Vy
				instruction = 9;
			end
			16'h8??2: begin 	//AND Vx, Vy
				instruction = 10;
			end
			16'h8??3: begin 	//XOR Vx, Vy
				instruction = 11;
			end
			16'h8??4: begin 	//ADD Vx, Vy
				instruction = 8;
			end
			16'h8??5: begin 	//SUB Vx, Vy
				instruction = 12;
			end
			16'h8??6: begin 	//SHR Vx, Vy
				instruction = 13;
			end
			16'h8??7: begin 	//SUBN Vx, Vy
				instruction = 14;
			end
			16'h8??E: begin 	//SHL Vx
				instruction = 15;
			end
			16'h9??0: begin 	//SNE Vx, Vy
				instruction = 6;
			end
			16'hA???: begin 	//LD I, addr
				instruction = 7;
			end
			16'hB???: begin 	//JP V0, addr
				instruction = 17;
			end
			16'hC???: begin 	//RND Vx, byte
				instruction = 18;
			end
			16'hD???: begin 	//DRW Vx, Vy, nibble
				instruction = 19;
			end
			16'hE?9E: begin 	//SKP Vx
				instruction = 20;
			end
			16'hE?A1: begin 	//SKNP Vx
				instruction = 21;
			end
			16'hF?07: begin 	//LD Vx, DT
				instruction = 7;
			end
			16'hF?0A: begin 	//LD Vx, K
				instruction = 22;
			end
			16'hF?15: begin 	//LD DT, Vx
				instruction = 7;
			end
			16'hF?18: begin 	//LD ST, Vx
				instruction = 7;
			end
			16'hF?1E: begin 	//ADD I, Vx
				instruction = 8;
			end
			16'hF?29: begin 	//LD F, Vx
				instruction = 23;
			end
			16'hF?33: begin 	//LD B, Vx
				instruction = 24;
			end
			16'hF?55: begin 	//LD [I], Vx
				instruction = 5;
			end
			16'hF?65: begin 	//LD Vx, [I]
				instruction = 5;
			end
		endcase
	end
endmodule
