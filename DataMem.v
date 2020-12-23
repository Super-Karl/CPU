`timescale 1ns / 1ps

module DataMem(
    input clk,mem_wen,mem_ren,
    input[31:0] mem_addr,
    input[31:0] mem_data_i,
    output[31:0] mem_data_o
    );

    reg[7:0] data_mem0[0:66535];
    reg[7:0] data_mem1[0:66535];
    reg[7:0] data_mem2[0:66535];
    reg[7:0] data_mem3[0:66535];
    //写操作

    always@(negedge clk)
    begin
        if(mem_wen)
        begin
            data_mem0[mem_addr[31:2]] <= mem_data_i[7:0];
            data_mem1[mem_addr[31:2]] <= mem_data_i[15:8];
            data_mem2[mem_addr[31:2]] <= mem_data_i[23:16];
            data_mem3[mem_addr[31:2]] <= mem_data_i[31:24];
        end
    end
    //读操作
    //在此补充数据存储读操作代码
        assign mem_data_o[7:0] = mem_ren?data_mem0[mem_addr[31:2]]:32'b0;
        assign mem_data_o[15:8] = mem_ren?data_mem1[mem_addr[31:2]]:32'b0;
        assign mem_data_o[23:16] = mem_ren?data_mem2[mem_addr[31:2]]:32'b0;
        assign mem_data_o[31:24] = mem_ren?data_mem3[mem_addr[31:2]]:32'b0;
endmodule
