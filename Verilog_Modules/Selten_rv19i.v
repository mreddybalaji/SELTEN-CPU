`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    21.08.2024 19:16:50
// Design Name:    
// Module Name:    Selten_rv19i
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module Selten_rv19i(clk, RN, NPC, WB_OUT);
input clk;
input RN;
integer k;
wire EX_MEM_COND;

reg BR_EN;

// I_FETCH STAGE
reg [18:0] IF_ID_IR, IF_ID_NPC;                                

// I_DECODE STAGE
reg [18:0] ID_EX_A, ID_EX_B, ID_EX_RD, ID_EX_IMMEDIATE, ID_EX_IR, ID_EX_NPC;      

// EXECUTION STAGE
reg [18:0] EX_MEM_ALUOUT, EX_MEM_B, EX_MEM_IR;                        

// MEM STAGE
reg [18:0] MEM_WB_IR, MEM_WB_ALUOUT, MEM_WB_LDM;                      

// Output signals
output reg [18:0] WB_OUT, NPC;

// REG FILE
reg [18:0] REG[0:31];                                               
// IMEM: 32x19
reg [18:0] MEM[0:31];                                             
// DMEM: 32x19
reg [18:0] DM[0:31];   

// ALU Operation Types
parameter ADD = 3'd0,
          SUB = 3'd1,
          AND = 3'd2,
          OR  = 3'd3,
          XOR = 3'd4,
          SLT = 3'd5;

parameter ADDI = 3'd0,
          SUBI = 3'd1,
          ANDI = 3'd2,
          ORI  = 3'd3,
          XORI = 3'd4;

parameter LW  = 3'd0,
          SW  = 3'd1;

parameter BEQ = 3'd0,
          BNE = 3'd1;

parameter SLL = 3'd0,
          SRL = 3'd1;

// Instruction Types
parameter AR_TYPE = 7'd0,
          M_TYPE  = 7'd1,
          BR_TYPE = 7'd2,
          SH_TYPE = 7'd3;

always @(posedge clk or posedge RN) begin
    if(RN) begin
        NPC <= 19'd0;
        BR_EN <= 1'd0;
        REG[0] <= 19'h00000;
        REG[1] <= 19'd1;
        REG[2] <= 19'd2;
        REG[3] <= 19'd3;
        REG[4] <= 19'd4;
        REG[5] <= 19'd5;
        REG[6] <= 19'd6;
    end else begin
        NPC <= BR_EN ? EX_MEM_ALUOUT : NPC + 19'd1;
        BR_EN <= 1'd0;
        IF_ID_IR <= MEM[NPC];
        IF_ID_NPC <= NPC + 19'd1;
    end
end

always @(posedge RN) begin
    MEM[0] <= 19'h12345; // Replace with actual 19-bit instructions
    MEM[1] <= 19'h12346;
    MEM[2] <= 19'h12347;
    MEM[3] <= 19'h12348;
    MEM[4] <= 19'h12349;
    MEM[5] <= 19'h1234A;
    MEM[6] <= 19'h1234B;
    MEM[7] <= 19'h1234C;
    MEM[8] <= 19'h1234D;
    MEM[9] <= 19'h1234E;
    MEM[25] <= 19'h1234F;
end

// I_DECODE STAGE 
always @(posedge clk) begin
    ID_EX_A <= REG[IF_ID_IR[18:14]];
    ID_EX_B <= REG[IF_ID_IR[13:9]];
    ID_EX_RD <= REG[IF_ID_IR[8:4]];
    ID_EX_IR <= IF_ID_IR;
    ID_EX_IMMEDIATE <= {{14{IF_ID_IR[18]}}, IF_ID_IR[18:14]}; // 19-bit sign extension
    ID_EX_NPC <= IF_ID_NPC;
end

// EXECUTION STAGE
always @(posedge clk) begin
    EX_MEM_IR <= ID_EX_IR;
    case(ID_EX_IR[18:14])
        AR_TYPE: begin
            case(ID_EX_IR[13:11])
                ADD: EX_MEM_ALUOUT <= ID_EX_A + ID_EX_B;
                SUB: EX_MEM_ALUOUT <= ID_EX_A - ID_EX_B;
                AND: EX_MEM_ALUOUT <= ID_EX_A & ID_EX_B;
                OR : EX_MEM_ALUOUT <= ID_EX_A | ID_EX_B;
                XOR: EX_MEM_ALUOUT <= ID_EX_A ^ ID_EX_B;
                SLT: EX_MEM_ALUOUT <= (ID_EX_A < ID_EX_B) ? 19'd1 : 19'd0;
            endcase
        end

        M_TYPE: begin
            case(ID_EX_IR[13:11])
                LW: EX_MEM_ALUOUT <= ID_EX_A + ID_EX_IMMEDIATE;
                SW: EX_MEM_ALUOUT <= ID_EX_IR[13:9] + ID_EX_IR[18:14];
            endcase
        end

        BR_TYPE: begin
            case(ID_EX_IR[13:11])
                BEQ: begin 
                    EX_MEM_ALUOUT <= ID_EX_NPC + ID_EX_IMMEDIATE;
                    BR_EN <= (ID_EX_IR[18:14] == ID_EX_IR[8:4]);
                end
                BNE: begin 
                    EX_MEM_ALUOUT <= ID_EX_NPC + ID_EX_IMMEDIATE;
                    BR_EN <= (ID_EX_IR[18:14] != ID_EX_IR[8:4]);
                end
            endcase
        end

        SH_TYPE: begin
            case(ID_EX_IR[13:11])
                SLL: EX_MEM_ALUOUT <= ID_EX_A << ID_EX_B;
                SRL: EX_MEM_ALUOUT <= ID_EX_A >> ID_EX_B;
            endcase
        end
    endcase
end

// MEMORY STAGE
always @(posedge clk) begin
    MEM_WB_IR <= EX_MEM_IR;
    case(EX_MEM_IR[18:14])
        AR_TYPE, SH_TYPE: MEM_WB_ALUOUT <= EX_MEM_ALUOUT;
        M_TYPE: begin
            case(EX_MEM_IR[13:11])
                LW: MEM_WB_LDM <= DM[EX_MEM_ALUOUT];
                SW: DM[EX_MEM_ALUOUT] <= REG[EX_MEM_IR[8:4]];
            endcase
        end
    endcase
end

// WRITE BACK STAGE
always @(posedge clk) begin
    case(MEM_WB_IR[18:14])
        AR_TYPE, SH_TYPE: begin 
            WB_OUT <= MEM_WB_ALUOUT;
            REG[MEM_WB_IR[8:4]] <= MEM_WB_ALUOUT;
        end

        M_TYPE: begin
            case(MEM_WB_IR[13:11])
                LW: begin
                    WB_OUT <= MEM_WB_LDM;
                    REG[MEM_WB_IR[8:4]] <= MEM_WB_LDM;
                end
            endcase
        end
    endcase
end

endmodule
