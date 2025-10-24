


`timescale 1ns / 1ps

module TOP_tb;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [31:0] pc_next;
    wire [31:0] pc;
    wire [4:0] rs1, rs2, rd;
    wire [6:0] opcode;
    wire [2:0] fun3;
    wire [6:0] fun7;
    wire [31:0] SrcA, SrcB, SrcB2;
    wire [31:0] Immext;
    wire [31:0] pcplus4;
    wire [31:0] pc_target;
    wire zero_f;
    wire [31:0] Alu_result;
    wire [31:0] Read_data;
    wire [31:0] Write_data;
    wire pc_src;
    wire [1:0] result_src;
    wire memwrite;
    wire [1:0] alu_op;
    wire alu_src;
    wire [1:0] imm_src;
    wire regwrite;
    wire [3:0] alu_ctrl;

    // Instantiate the DUT (Device Under Test)
    TOP dut (
        .clk(clk),
        .rst(rst),
        .pc_next(pc_next),
        .pc(pc),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .opcode(opcode),
        .fun3(fun3),
        .fun7(fun7),
        .SrcA(SrcA),
        .SrcB(SrcB),
        .SrcB2(SrcB2),
        .Immext(Immext),
        .pcplus4(pcplus4),
        .pc_target(pc_target),
        .zero_f(zero_f),
        .Alu_result(Alu_result),
        .Read_data(Read_data),
        .Write_data(Write_data),
        .pc_src(pc_src),
        .result_src(result_src),
        .memwrite(memwrite),
        .alu_op(alu_op),
        .alu_src(alu_src),
        .imm_src(imm_src),
        .regwrite(regwrite),
        .alu_ctrl(alu_ctrl)
    );
    
    
initial begin 
clk=0;
end


        // Clock generation (100 MHz => 10 ns period)
    always #5 clk = ~clk;

    // Test stimulus
    initial begin

        rst = 1;
        $display("=== Starting Simulation ===");

        // Apply reset
        #20;
        rst = 0;

        // Run simulation for a while
        repeat (50) @(posedge clk);

        // Finish simulation
        $display("=== Simulation Complete ===");
        $stop;
        #40;
        $finish;
    end
    


endmodule
