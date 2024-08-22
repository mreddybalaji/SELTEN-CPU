`timescale 1ns / 1ps

module tb__CPU;

    reg clk;
    reg rst;

    // Instantiate the CPU module
    CPU uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;

        // Apply reset
        rst = 1;
        #10;
        rst = 0;

        // Load some test instructions into the instruction memory
        // Note: Modify the instructions as per your CPU instruction set architecture

        // NOP (no operation)
        uut.instr_memory[0] = 19'h00000;

        // ADD r1, r2, r3 (add r2 and r3 and store result in r1)
        uut.instr_memory[1] = 19'h00021;

        // SUB r4, r5, r6 (subtract r6 from r5 and store result in r4)
        uut.instr_memory[2] = 19'h00046;

        // AND r7, r8, r9 (bitwise AND r8 and r9 and store result in r7)
        uut.instr_memory[3] = 19'h00169;

        // OR r10, r11, r12 (bitwise OR r11 and r12 and store result in r10)
        uut.instr_memory[4] = 19'h001BC;

        // SLT r13, r14, r15 (set r13 to 1 if r14 < r15, else set to 0)
        uut.instr_memory[5] = 19'h002FD;

        // BEQ r1, r0, Label (branch to Label if r1 == r0)
        uut.instr_memory[6] = 19'h04000;

        // Custom instruction (perform custom operation on r1 and r2)
        uut.instr_memory[7] = 19'h08012;

        // JUMP to address 2
        uut.instr_memory[8] = 19'h10002;

        // CALL to subroutine at address 3
        uut.instr_memory[9] = 19'h20003;

        // RET from subroutine
        uut.instr_memory[10] = 19'h30000;

        // Test Memory read/write
        uut.instr_memory[11] = 19'h40000; // Assume memory operation

        // Start simulation
        #1000;

        // Display results
        $display("Test Completed.");
        $stop;
    end

endmodule
