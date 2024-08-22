module regfile_19bit (
    input wire clk,              // Clock signal
    input wire rst,              // Reset signal
    input wire [4:0] read_addr1, // Address for read port 1
    input wire [4:0] read_addr2, // Address for read port 2
    input wire [4:0] write_addr, // Address for write port
    input wire [18:0] write_data,// Data to write
    input wire write_enable,     // Write enable signal
    output wire [18:0] read_data1, // Data from read port 1
    output wire [18:0] read_data2  // Data from read port 2
);

    reg [18:0] regfile [31:0]; // 32 registers, each 19 bits wide

    // Read operations
    assign read_data1 = regfile[read_addr1];
    assign read_data2 = regfile[read_addr2];

    // Write operation
    always @(posedge clk or posedge rst) begin
        if (rst)
            regfile[write_addr] <= 19'b0; // Reset the register on reset
        else if (write_enable)
            regfile[write_addr] <= write_data; // Write data to the specified register
    end

endmodule
