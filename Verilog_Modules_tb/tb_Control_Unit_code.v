`timescale 1ns / 1ps

module Datapath_Unit_tb;
    // Inputs
    reg clk;
    reg jump, beq, bne, call, ret, mem_read, mem_write, alu_src, reg_dst, mem_to_reg, reg_write;
    reg [1:0] alu_op;

    // Outputs
    wire [18:0] pc_current;
    wire [3:0] opcode;

    
    Datapath_Unit uut (
        .clk(clk),
        .jump(jump),
        .beq(beq),
        .bne(bne),
        .call(call),
        .ret(ret),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .alu_op(alu_op),
        .pc_current(pc_current),
        .opcode(opcode)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle the clock every 5ns
    end

    // Stimulus
    initial begin
        // Initialize Inputs
        jump = 0;
        beq = 0;
        bne = 0;
        call = 0;
        ret = 0;
        mem_read = 0;
        mem_write = 0;
        alu_src = 0;
        reg_dst = 0;
        mem_to_reg = 0;
        reg_write = 0;
        alu_op = 2'b00;

        
        #10;

        // Test Case 1: Simple PC increment
        #10;
        $display("PC Current after reset: %d", pc_current);

        // Test Case 2: Call (jump to subroutine)
        call = 1;
        #10;
        call = 0;
        $display("PC Current after CALL: %d", pc_current);

        // Test Case 3: Return (return from subroutine)
        ret = 1;
        #10;
        ret = 0;
        $display("PC Current after RET: %d", pc_current);

        // Test Case 4: Unconditional Jump
        jump = 1;
        #10;
        jump = 0;
        $display("PC Current after JUMP: %d", pc_current);

        // Test Case 5: Branch if Equal (BEQ)
        beq = 1;
        #10;
        beq = 0;
        $display("PC Current after BEQ: %d", pc_current);

        // Test Case 6: Branch if Not Equal (BNE)
        bne = 1;
        #10;
        bne = 0;
        $display("PC Current after BNE: %d", pc_current);

        
        $finish;
    end
endmodule
