`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 21:22:49
// Design Name: 
// Module Name: Control_Unit
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

module Control_Unit(
 input clk,
 input jump, beq, bne, call, ret, mem_read, mem_write, alu_src, reg_dst, mem_to_reg, reg_write,
 input [1:0] alu_op,
 output reg [18:0] pc_current, // Declaring the pc_current as a reg type and output
 output [3:0] opcode
);

 // Stack pointer and stack memory for CALL/RET
 reg  [18:0] sp;
 reg  [18:0] stack [0:15]; // Stack size of 16 
 
 wire [18:0] pc_next, pc2, instr, reg_write_data, ALU_out;
 wire [18:0] return_address;
 wire zero_flag;

 // PC logic for JMP, BEQ, BNE, CALL, RET
 always @(posedge clk) begin
   if (call) begin
     stack[sp] <= pc2; // Store return address in stack
     sp <= sp + 1;
     pc_current <= ALU_out; // Jump to subroutine address
   end else if (ret) begin
     sp <= sp - 1;
     pc_current <= stack[sp]; // Return to saved address
   end else if (jump) begin
     pc_current <= ALU_out; // Unconditional jump
   end else if (beq && zero_flag) begin
     pc_current <= ALU_out; // Branch if equal
   end else if (bne && !zero_flag) begin
     pc_current <= ALU_out; // Branch if not equal
   end else begin
     pc_current <= pc_next; // Default PC increment
   end
 end
 
endmodule
