`timescale 1ns / 1ps

module ALU(
    input rst,
    input[3:0] alu_ct,
    input[31:0] alu_src1, alu_src2,
    output alu_zero,
    output reg [31:0] alu_res
    );

    assign alu_zero= (alu_res==0)?1:0;
    
    always@(*)
        if(!rst)
        begin
            alu_res = 32'b0;
        end
        else
        begin
            case(alu_ct)
            //在此补充代码：当 alu_ct 为 4'b0010，执行加法运算；为 4'b0110 时，执行减法运算。
            4'b0010:
            begin
                alu_res = alu_src1 + alu_src2;
            end
            4'b0110:
            begin
                alu_res = alu_src1 - alu_src2;
            end
            default:
            begin
                alu_res = 32'b0;
            end
        endcase
    end
endmodule
