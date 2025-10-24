
`timescale 1ns / 1ps



module ALU(
    input [31:0] SrcA,SrcB,
    input [3:0] alu_ctrl,
    output [31:0] alu_result ,
    output ZF   );
    reg flag;
    reg [31:0] result;
    
    always@(*)  begin
            case(alu_ctrl)
            4'b0000 : result = SrcA + SrcB;
            4'b0001 : result = SrcA - SrcB;
            4'b0010 : result = SrcA & SrcB;
            4'b0011 : result = SrcA | SrcB;
            4'b0100 : result = SrcA << SrcB ;
            4'b0101 : result = (SrcA<SrcB)?1:0;
            4'b0110 : result = SrcA >> SrcB ;
            4'b0111 : result = SrcA >>> SrcB ;
            4'b1000 : result = SrcA ^ SrcB ;
            endcase 
            flag = (result==32'd0)?1:0;
      end      
     assign alu_result = result;
     assign ZF = flag;
endmodule
