

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
//instr_memory[0]= 32'b111111111100_01001_010_00110_0000011;  // lw  x6,-4(x9)
//instr_memory[4]= 32'b000000001010_00010_010_00001_0000011;   // lw x1,10(x2)
//instr_memory[8]= 32'b000000001010_00011_010_00010_0000011;    // lw x2,10(x3)
//instr_memory[12]= 32'b000000001010_00001_010_00011_0000011;     // lw x3,10(x2)
//instr_memory[16]= 32'b0000000_00001_00011_010_01000_0100011 ; // sw  
//instr_memory[20]= 32'b0000000_00001_00010_010_00011_0110011 ;
//instr_memory[0] = 32'b0000000_00010_00001_000_00101_0110011 ;

// R-type examples (opcode = 0110011)
// add x5,  x1,  x2
instr_memory[0] = 32'b0000000_00010_00001_000_00101_0110011;
// sub x6,  x3,  x4
instr_memory[4] = 32'b0100000_00100_00011_000_00110_0110011;
// and x7,  x8,  x9
instr_memory[8] = 32'b0000000_01001_01000_111_00111_0110011;
// or  x10, x11, x12
instr_memory[12] = 32'b0000000_01100_01011_110_01010_0110011;
// xor x13, x14, x15
instr_memory[16] = 32'b0000000_01111_01110_100_01101_0110011;
// sll x16, x17, x18
instr_memory[20] = 32'b0000000_10010_10001_001_10000_0110011;
// srl x19, x20, x21
instr_memory[24] = 32'b0000000_10101_10100_101_10011_0110011;
// sra x22, x23, x24
instr_memory[28] = 32'b0100000_11000_10111_101_10110_0110011;

// I-type examples (opcode = 0010011 for immediate ALU; load uses 0000011)
// addi x1,  x0,   100
instr_memory[32]  = 32'b000000110100_00000_000_00001_0010011;
// ori  x2,  x2,   0xFF (255)
instr_memory[36]  = 32'b00000011111111_00010_110_00010_0010011;
// andi x3,  x4,   0x0F (15)
instr_memory[40] = 32'b000000001111_00100_111_00011_0010011;
// slli x5,  x6,   2
instr_memory[44] = 32'b0000000_00010_00110_001_00101_0010011;
// srli x7,  x8,   3
instr_memory[48] = 32'b0000000_00011_01000_101_00111_0010011;
// lw   x9,  8(x10)
instr_memory[52] = 32'b000000001000_01010_010_01001_0000011;

// S-type examples (opcode = 0100011)
// sw  x5, 12(x1)
instr_memory[56] = 32'b0000000_00101_00001_010_01100_0100011;
// sb  x6,  3(x2)
instr_memory[60] = 32'b0000000_00110_00010_000_00011_0100011;
// sh  x7, 16(x3)
instr_memory[64] = 32'b0000001_00111_00011_001_00000_0100011;

end

assign instruction = instr_memory[addr];

endmodule
