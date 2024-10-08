module tb_regfile_19bit;

    reg clk;
    reg rst;
    reg [40] read_addr1;
    reg [40] read_addr2;
    reg [40] write_addr;
    reg [180] write_data;
    reg write_enable;
    wire [180] read_data1;
    wire [180] read_data2;

     Instantiate the register file
    regfile_19bit uut (
        .clk(clk),
        .rst(rst),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .write_addr(write_addr),
        .write_data(write_data),
        .write_enable(write_enable),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

     Clock generation
    always #5 clk = ~clk;

    initial begin
         Initialize signals
        clk = 0;
        rst = 1;
        write_enable = 0;
        read_addr1 = 5'b0;
        read_addr2 = 5'b0;
        write_addr = 5'b0;
        write_data = 19'b0;

         Reset the register file
        #10;
        rst = 0;

         Write data to register 5
        #10;
        write_enable = 1;
        write_addr = 5'b00101;
        write_data = 19'b1010101010101010101;
        #10;
        write_enable = 0;

         Read data from register 5
        #10;
        read_addr1 = 5'b00101;
        #10;
        $display(Read Data 1 %b, read_data1);

         Write new data to register 10
        write_enable = 1;
        write_addr = 5'b01010;
        write_data = 19'b1111111111111111111;
        #10;
        write_enable = 0;

         Read data from register 10
        read_addr2 = 5'b01010;
        #10;
        $display(Read Data 2 %b, read_data2);

         Finish simulation
        #20;
        $finish;
    end

endmodule
