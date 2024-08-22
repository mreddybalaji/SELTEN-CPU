`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 19:26:13
// Design Name: 
// Module Name: ALU_tb
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


`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg [18:0] a;
    reg [18:0] b;
    reg [3:0] alu_control;

    // Outputs
    wire [18:0] result;
    wire zero;

    // Instantiate the ALU module
    ALU uut (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    initial begin
        
        $monitor("At time %t, a = %d, b = %d, alu_control = %b, result = %d, zero = %b", 
                  $time, a, b, alu_control, result, zero);

        // Initialize inputs
        a = 19'd0;
        b = 19'd0;
        alu_control = 4'b0000;

        // Test Case 1: ADD (1 + 2)
        a = 19'd1;
        b = 19'd2;
        alu_control = 4'b0000; // ADD
        #10; // Wait 10 time units

        // Test Case 2: SUB (3 - 2)
        a = 19'd3;
        b = 19'd2;
        alu_control = 4'b0001; // SUB
        #10;

        // Test Case 3: MUL (4 * 2)
        a = 19'd4;
        b = 19'd2;
        alu_control = 4'b0010; // MUL
        #10;

        // Test Case 4: DIV (8 / 2)
        a = 19'd8;
        b = 19'd2;
        alu_control = 4'b0011; // DIV
        #10;

        // Test Case 5: INC (10 + 1)
        a = 19'd10;
        b = 19'd0; // Ensure `b` is 0 to not affect INC operation
        alu_control = 4'b0100; // INC
        #10;

        // Test Case 6: DEC (10 - 1)
        a = 19'd10;
        b = 19'd0; // Ensure `b` is 0 to not affect DEC operation
        alu_control = 4'b0101; // DEC
        #10;

        // End of simulation
        $finish;
    end

endmodule



