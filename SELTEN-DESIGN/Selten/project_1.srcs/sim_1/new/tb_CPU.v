`timescale 1ns / 1ps

module tb_CPU;

    // Testbench signals
    reg clk;
    reg reset;
    
    // Instantiate the CPU module
    CPU uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns period for 100MHz clock

    // Testbench initialization and stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;

        // Wait for a few clock cycles
        #50;

        // Add more test cases here
        // For example, you can initialize memory and provide specific instructions
        // or control signals to test different scenarios.

        // End simulation after a while
        #1000;
        $finish;
    end

    // Monitor signals (optional)
    initial begin
        $monitor("Time: %0t | PC: %h | Instruction: %h", $time, uut.pc_current, uut.instruction);
    end

endmodule
