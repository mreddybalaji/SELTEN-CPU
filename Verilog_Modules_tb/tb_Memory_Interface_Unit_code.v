`timescale 1ns / 1ps

module tb_Memory_Interface;
    
    // Testbench variables
    reg clk;
    reg mem_read;
    reg mem_write;
    reg [18:0] address;
    reg [18:0] write_data;
    wire [18:0] read_data;

    // Instantiate the Unit Under Test (UUT)
    Memory_Interface uut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5ns
    end

    // Test Procedure
    initial begin
        // Initialize Inputs
        mem_read = 0;
        mem_write = 0;
        address = 0;
        write_data = 0;

        
        #10;

        // Test Case 1: Write data to memory
        address = 19'd2;
        write_data = 19'h1A2B; //  19-bit value
        mem_write = 1;
        mem_read = 0;
        #10;
        mem_write = 0;
        $display("Writing 0x%h to address 0x%h", write_data, address);

        // Test Case 2: Read data from memory
        mem_write = 0;
        mem_read = 1;
        address = 19'd2; // Reading from address 2
        #10;
        $display("Reading 0x%h from address 0x%h", read_data, address);

        // Test Case 3: Write another value to a different memory address
        address = 19'd3;
        write_data = 19'h3F4E;
        mem_write = 1;
        mem_read = 0;
        #10;
        mem_write = 0;
        $display("Writing 0x%h to address 0x%h", write_data, address);

        // Test Case 4: Read the value from memory
        address = 19'd3;
        mem_write = 0;
        mem_read = 1;
        #10;
        $display("Reading 0x%h from address 0x%h", read_data, address);

        // Test Case 5: Attempt reading from an unwritten memory location (should default to unknown)
        address = 19'd4;
        mem_read = 1;
        #10;
        $display("Reading 0x%h from address 0x%h (unwritten location)", read_data, address);

        
        $finish;
    end

endmodule
