`timescale 1ns / 1ps

module Custom_Instruction_Unit_tb;

// Inputs
reg clk;
reg [3:0] opcode;
reg [18:0] r1, r2;

// Outputs
wire [18:0] result;


Custom_Instruction_Unit uut (
    .clk(clk),
    .opcode(opcode),
    .r1(r1),
    .r2(r2),
    .result(result)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Clock with 10ns period
end

// Stimulus
initial begin
    // Test FFT
    opcode = 4'b0001; // FFT
    r1 = 19'd1; // Destination address
    r2 = 19'd2; // Source address
    uut.memory[r2] = 19'd500; // Initialize memory at r2
    #10;
    $display("FFT Result at r1: %d", uut.memory[r1]);

    // Test ENC
    opcode = 4'b0010; // ENC
    r1 = 19'd3; // Destination address
    r2 = 19'd4; // Source address
    uut.memory[r2] = 19'd1000; // Initialize memory at r2
    #10;
    $display("ENC Result at r1: %d", uut.memory[r1]);

    // Test DEC
    opcode = 4'b0011; // DEC
    r1 = 19'd5; // Destination address
    r2 = 19'd6; // Source address
    uut.memory[r2] = uut.memory[3]; // Use result of ENC for decryption
    #10;
    $display("DEC Result at r1: %d", uut.memory[r1]);

    // Test SPM
    opcode = 4'b0100; // SPM
    r1 = 19'd7; // Destination address
    r2 = 19'd8; // Source address
    uut.memory[r2] = 19'd2000; // Initialize memory at r2
    #10;
    $display("SPM Result at r1: %d", uut.memory[r1]);

    // Test DWT
    opcode = 4'b0101; // DWT
    r1 = 19'd9; // Destination address
    r2 = 19'd10; // Source address
    uut.memory[r2] = 19'd4000; // Initialize memory at r2
    #10;
    $display("DWT Result at r1: %d", uut.memory[r1]);

    // Test MAC
    opcode = 4'b0110; // MAC
    r1 = 19'd20; // Operand 1
    r2 = 19'd30; // Operand 2
    #10;
    $display("MAC Accumulated Result: %d", result);

    // Test RNG
    opcode = 4'b0111; // RNG
    r1 = 19'd11; // Destination address
    #10;
    $display("RNG Result at r1: %d", uut.memory[r1]);

    
    $finish;
end

endmodule
