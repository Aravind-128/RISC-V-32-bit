
`timescale 1ns / 1ps


module pc_target(
input [31:0] pc_out,
input [31:0] immext,
output [31:0] pt
    );
    
    assign pt = pc_out + immext;
endmodule
