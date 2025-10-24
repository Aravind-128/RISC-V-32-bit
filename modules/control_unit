
`timescale 1ns / 1ps

module control(
            input [6:0] opcode,
            input zf,
            output Pc_src,
            output [1:0] result_src,
            output memwrite,
            output [1:0] alu_op,
            output alusrc,
            output [1:0] immsrc,
            output regwrite);
            reg [10:0] ctrl;
            wire branch,jump;
            always@(*) 
                casez(opcode)
                 7'b0000011 : ctrl=11'b1_00_1_0_01_0_00_0;   //lw
                 7'b0100011 : ctrl=11'b0_01_1_1_zz_0_00_0;   // sw
                 7'b0110011 : ctrl=11'b1_zz_0_0_00_0_10_0;   // r type
                 7'b1100011 : ctrl=11'b0_10_0_0_zz_1_01_0;   // beq
                 7'b0010011 : ctrl=11'b1_00_1_0_00_0_10_0;   // i type alu
                 7'b1101111 : ctrl=11'b1_11_z_0_10_0_zz_1;   // jal
                endcase

             assign {regwrite,immsrc,alusrc,memwrite,result_src,branch,alu_op,jump} = ctrl;
             assign Pc_src=(zf&branch)|jump;
     
endmodule
