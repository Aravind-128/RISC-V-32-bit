
`timescale 1ns / 1ps

// Module Name: TOP
module TOP(
   input clk,rst,
   output [31:0] pc_next,
   output [31:0] pc,
   output [4:0] rs1,rs2,rd,
   output [6:0] opcode,
   output [2:0] fun3,
   output [6:0] fun7,
   output [31:0] SrcA,SrcB,SrcB2,
   output [31:0] Immext,
   output [31:0] pcplus4,
   output [31:0] pc_target,
   output zero_f,
   output [31:0] Alu_result ,
   output [31:0] Read_data,
   output [31:0] Write_data,
   output pc_src,
   output [1:0] result_src,
   output memwrite,
   output [1:0] alu_op,
   output alu_src,
   output [1:0] imm_src,
   output regwrite ,
   output [3:0] alu_ctrl
    );
    
    mux1 a1(pcplus4,pc_target,pc_src,pc_next);
    
    program_counter a2(clk,rst,pc_next,pc);
    
    pc_adder a4(pc,pcplus4);
    
    instruction_memory a3(pc,{fun7,rs2,rs1,fun3,rd,opcode});
    
    control a5(opcode,zero_f,pc_src,result_src,memwrite,alu_op,alu_src,imm_src,regwrite);
    
    register_file a6(clk,rs1,rs2,rd,Write_data,regwrite,SrcA,SrcB);
    
    extend a7({fun7,rs2,rs1,fun3,rd},imm_src,Immext);
    
    mux2 a8(SrcB,Immext,alu_src,SrcB2);
    
    alu_con a9(fun3,fun7[5],opcode[5],alu_op,alu_ctrl);
    
    ALU a10(SrcA,SrcB2,alu_ctrl,Alu_result,zero_f);
    
    pc_target a11(pc,Immext,pc_target);
    
    data_memory a12(clk,Alu_result,SrcB,memwrite,Read_data);
    
    mux3 a13(Alu_result,Read_data,pcplus4,result_src,Write_data);
    
    
endmodule




