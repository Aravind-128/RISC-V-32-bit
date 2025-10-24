
`timescale 1ns / 1ps


module alu_con(
   input [2:0] fun3,
   input fun7,
   input op,
   input [1:0] alu_op,
   output [3:0] alu_ctrl
    );
    reg [3:0] ctrl;
    always@(*) 
        casez({alu_op,fun3,op,fun7})
          7'b10_000_1_0 : ctrl=4'b0000;   // addd
          7'b10_000_1_1 : ctrl=4'b0001;     // sub
          7'b10_111_1_0 : ctrl=4'b0010;     // AND
          7'b10_110_1_0 : ctrl=4'b0011;     // OR
          7'b10_001_1_0 : ctrl=4'b0100;     // sll
          7'b10_010_1_0 : ctrl=4'b0101;     //slt
          7'b10_101_1_0 : ctrl=4'b0110;     // srl
          7'b10_101_1_1 : ctrl=4'b0111;     // sra
          7'b10_100_1_0 : ctrl=4'b1000;     // XOR
        
         endcase
      
        assign alu_ctrl = ctrl ;
endmodule
