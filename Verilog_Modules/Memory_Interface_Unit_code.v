`timescale 1ns / 1ps

module Memory_Interface(
    input clk,
    input mem_read,         // Sread from memory
    input mem_write,        // write to memory
    input [18:0] address,   // 19-bit memory address
    input [18:0] write_data, // 19-bit data to be written to memory
    output reg [18:0] read_data // 19-bit data read from memory
);

    // Memory array (16 memory locations of 19-bit wide data)
    reg [18:0] memory_array [15:0];

    // Memory read and write operations
    always @(posedge clk) begin
        if (mem_write) begin
            // Write to memory
            memory_array[address[3:0]] <= write_data;
        end
        if (mem_read) begin
            // Read from memory
            read_data <= memory_array[address[3:0]];
        end
    end

endmodule
