
`timescale 1ns / 1ps


module extend(
   input [24:0] Imm,
   input [1:0] immsrc,
   output  [31:0] Immext);
   reg [31:0] extnd;

   always@(*)
    case(immsrc)
        2'b00 : extnd = {{20{Imm[24]}},Imm[24:13]} ;    // lw
        2'b01 : extnd = {{20{Imm[24]}},Imm[24:18],Imm[4:0]} ; // sw
        2'b10 : extnd = {{20{Imm[24]}},Imm[0],Imm[23:17],Imm[4:1],1'b0};   // branch
        2'b11 : extnd = {{12{Imm[24]}},Imm[12:5],Imm[13],Imm[23:12],1'b0};  // for jump
    endcase
    
    assign Immext = extnd;
         
endmodule

