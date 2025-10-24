
`timescale 1ns / 1ps



module mux1(
   input [31:0] pc4,pctar,
   input Pc_src,
   output [31:0] pin);
   
   assign pin = (Pc_src)?pctar:pc4;
endmodule
