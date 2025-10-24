
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
        7'b00_zzz_z_z : ctrl= 4'b000 ;  // for lw,sw
        7'b01_zzz_z_z : ctrl = 4'b001;  // for branch
        
        /////////////////////////////////////////////////////////////////////////////////
        
        7'b10_000_0_0,7'b10_000_0_1,7'b10_000_1_0 : ctrl=4'b000 ;  // for add
        7'b10_000_1_1:ctrl = 4'b001 ;   //for subtract
        7'b10_111_z_z:ctrl = 4'b010 ;   //for and
        7'b10_110_z_z:ctrl = 4'b011 ;   //for or
        7'b10_001_z_0:ctrl = 4'b100 ;   // for shift logical left
        7'b10_010_z_0:ctrl = 4'b101 ;   //for set less than
        7'b10_101_z_0:ctrl = 4'b110;    // for shift logical right
        7'b10_101_1_1:ctrl = 4'b111;    // for shift right arithmetic
        7'b10_100_z_0:ctrl = 4'b1000;   // for xor 
     
        
       /////////////////////////////////////////////////////////////////////////////////////
        
        endcase
        
        assign alu_ctrl = ctrl ;
endmodule
