


`timescale 1ns / 1ps

module instruction_memory(
    input [31:0] addr,
    output [31:0] instruction   );
reg [31:0] instr_memory [0:1024] ;



//  | fun7[31:25]  | rs2[24:20] | rs1[19:15] | fun3[14:12] | rd[11:7]    | opcode[6:0] |   R - type 
//  |         imm[31:20]        | rs1[19:15] | fun3[14:12] | rd[11:7]    | opcode[6:0] |   I - type
//  |  imm[11:5]   | rs2[24:20] | rs1[19:15] | fun3[14:12] | imm[4:0]    | opcode[6:0] |   S - type
//  |[12]|imm[11:5]| rs2[24:20] | rs1[19:15] | fun3[14:12] |imm[4:1]|[11]| opcode[6:0] |   B - type
//  |                    imm[31:12]                        | rd[11:7]    | opcode[6:0] |   U - type
//  |[20]|   imm[10:1]      [11]|          imm[19:12]      | rd[11:7]    | opcode[6:0] |   J - type


initial begin

instr_memory[0] = 32'd0;
instr_memory[4] = 32'd0;
instr_memory[8] = 32'd0;
instr_memory[12] = 32'd0;
instr_memory[16] = 32'b0000000_00011_00010_000_00001_0110011;
instr_memory[20] = 32'b0100000_00110_00101_000_00100_0110011;
instr_memory[24] = 32'b0000000_01011_01010_111_00101_0110011;
instr_memory[28] = 32'b0000000_01101_01011_100_00111_0110011;

end

assign instruction = instr_memory[addr];

endmodule
