
`timescale 1ns / 1ps

module data_memory(
    input clk,
    input [31:0] A,WD,
    input write_enable,
    output [31:0] RD
    );
    
    reg [31:0] data_mem [0:1024];
    initial begin 
        data_mem[6]=32'd30;
        data_mem[30]=32'd40;
        data_mem[40]=32'd50;
        data_mem[50]=32'd60;
        
        
    end
    
    assign RD = data_mem[A];
    
    always@(posedge clk)
    begin
        if(write_enable) data_mem[A] <= WD;
    end
    
endmodule
