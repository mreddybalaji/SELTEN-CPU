`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 19:16:50
// Design Name: 
// Module Name: ALU
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

module ALU(

 output reg [18:0] result,  
 output zero,
 input  [18:0] a,  // 19-bit source 1
 input  [18:0] b,  // 19-bit source 2
 input  [3:0] alu_control // width for operations
 

);

always @(*) begin 
 case(alu_control)
  4'b0000: result = a + b;     // ADD
  4'b0001: result = a - b;     // SUB
  4'b0010: result = a * b;     // MUL
  4'b0011: result = a / b;     // DIV
  4'b0100: result = a + 19'd1; // INC
  4'b0101: result = a - 19'd1; // DEC
  4'b0110: result = a & b;     // AND
  4'b0111: result = a | b;     // OR
  4'b1000: result = a ^ b;     // XOR
  4'b1001: result = ~a;        // NOT
  default: result = 19'd0;     // Default case
 endcase
end

assign zero = (result == 19'd0) ? 1'b1 : 1'b0; // Zero flag for branch instructions

endmodule
