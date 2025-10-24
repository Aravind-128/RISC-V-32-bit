
`timescale 1ns / 1ps

module register_file(
    input clk,
    input [4:0] a1,a2,a3,
    input [31:0] write_data,
    input write_enable,
    output [31:0] RD1,RD2
    ); 
    reg [31:0] registers [0:31] ;
    
    initial begin 
        registers[0] = 32'd0;
        registers[1] = 32'd20;
        registers[2] = 32'd30;
        registers[3] = 32'd40;
        registers[4] = 32'd30;
        registers[8] = 32'd0;
        registers[9] = 32'd10;
        registers[11] = 32'd5;
        registers[12] = 32'd4;
        registers[15] = 32'hffffffff;
        registers[14] = 32'd0;
        registers[17] = 32'd4;
        registers[18] = 32'd2;
        registers[20] = 32'd4;
        registers[21] = 32'd2;
        
    
    end
    always@(posedge clk)
    begin
            if(write_enable)  registers[a3] <= write_data;
    end
    assign RD1 = registers[a1] ;       
    assign RD2 = registers[a2] ;
     

endmodule
