`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:45 12/30/2015 
// Design Name: 
// Module Name:    ID 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`include "define.v"

module ID (
    input wire clock,
    input wire reset,
    input wire state,
    input wire [15:0] id_ir,
    input wire [15:0] mem_ir,
    input wire [15:0] wb_ir,
    input wire [15:0] ALUo,
    input wire [15:0] reg_C,
    input wire [15:0] reg_C1,
    input wire [15:0] d_datain,
    input wire [15:0] gr0,
    input wire [15:0] gr1,
    input wire [15:0] gr2,
    input wire [15:0] gr3,
    input wire [15:0] gr4,
    input wire [15:0] gr5,
    input wire [15:0] gr6,
    input wire [15:0] gr7,
    input wire jump,
    output reg [15:0] ex_ir,
    output reg [15:0] reg_A,
    output reg [15:0] reg_B,
    output reg [15:0] smdr
    );

wire [15:0] gr [7:0];

assign gr[0] = gr0;
assign gr[1] = gr1;
assign gr[2] = gr2;
assign gr[3] = gr3;
assign gr[4] = gr4;
assign gr[5] = gr5;
assign gr[6] = gr6;
assign gr[7] = gr7;

always @ (posedge clock or negedge reset) begin
    if(!reset) begin
        ex_ir <= 16'b0000_0000_0000_0000;
        reg_A <= 16'b0000_0000_0000_0000;
        reg_B <= 16'b0000_0000_0000_0000;
        smdr  <= 16'b0000_0000_0000_0000;
    end
    else if (state == `exec) begin
        if (id_ir[15:11] == `JUMP)
            ex_ir <= 0;
        else
        if (jump) begin //  flush
            ex_ir <= 16'b0000_0000_0000_0000;
        end
        else begin
            ex_ir <= id_ir;

            //  write reg_A
            if (//  reg_A <= gr1
                   (id_ir[15:11] == `BZ) || (id_ir[15:11] == `BNZ)
                || (id_ir[15:11] == `BN) || (id_ir[15:11] == `BNN)
                || (id_ir[15:11] == `BC) || (id_ir[15:11] == `BNC)
                || (id_ir[15:11] == `JMPR) || (id_ir[15:11] == `ADDI)
                || (id_ir[15:11] == `SUBI) || (id_ir[15:11] == `LDIH)
               ) begin
                    if (//  if Hazard
                        (
                            (ex_ir[15:11] == `LDIH) || (ex_ir[15:11] == `SRA)
                        ||  (ex_ir[15:11] == `ADD)  || (ex_ir[15:11] == `ADDI)
                        ||  (ex_ir[15:11] == `ADDC) || (ex_ir[15:11] == `SUB)
                        ||  (ex_ir[15:11] == `SUBI) || (ex_ir[15:11] == `SUBC)
                        ||  (ex_ir[15:11] == `AND)  || (ex_ir[15:11] == `OR)
                        ||  (ex_ir[15:11] == `XOR)  || (ex_ir[15:11] == `SLL)
                        ||  (ex_ir[15:11] == `SRL)  || (ex_ir[15:11] == `SLA)
                        ) && (id_ir[10:8] == ex_ir[10:8])
                       )
                        reg_A <= ALUo;
                    else if (
                        (
                            (mem_ir[15:11] == `SRA)  || (mem_ir[15:11] == `LDIH)
                        ||  (mem_ir[15:11] == `ADD)  || (mem_ir[15:11] == `ADDI)
                        ||  (mem_ir[15:11] == `ADDC) || (mem_ir[15:11] == `SUB)
                        ||  (mem_ir[15:11] == `SUBI) || (mem_ir[15:11] == `SUBC)
                        ||  (mem_ir[15:11] == `AND)  || (mem_ir[15:11] == `OR)
                        ||  (mem_ir[15:11] == `XOR)  || (mem_ir[15:11] == `SLL)
                        ||  (mem_ir[15:11] == `SRL)  || (mem_ir[15:11] == `SLA) 
                        ) && (id_ir[10:8] == mem_ir[10:8])
                       )
                        reg_A <= reg_C;
                    else if ((mem_ir[15:11] == `LOAD) && (id_ir[10:8] == mem_ir[10:8])) // LOAD hazard
                        reg_A <= d_datain;
                    else if (
                        (
                            (wb_ir[15:11] == `SRA)  || (wb_ir[15:11] == `LDIH)
                        ||  (wb_ir[15:11] == `ADD)  || (wb_ir[15:11] == `ADDI)
                        ||  (wb_ir[15:11] == `ADDC) || (wb_ir[15:11] == `SUB)
                        ||  (wb_ir[15:11] == `SUBI) || (wb_ir[15:11] == `SUBC)
                        ||  (wb_ir[15:11] == `AND)  || (wb_ir[15:11] == `OR)
                        ||  (wb_ir[15:11] == `XOR)  || (wb_ir[15:11] == `SLL)
                        ||  (wb_ir[15:11] == `SRL)  || (wb_ir[15:11] == `SLA)
                        ||  (wb_ir[15:11] == `LOAD)
                        ) && (id_ir[10:8] == wb_ir[10:8])
                       )
                        reg_A <= reg_C1;
                    else//  no hazard
                        reg_A <= gr[id_ir[10:8]];
                end
            else if (//  reg_A <= gr2
                        (id_ir[15:11] == `LOAD)|| (id_ir[15:11] == `STORE)
                     || (id_ir[15:11] == `ADD) || (id_ir[15:11] == `ADDC)
                     || (id_ir[15:11] == `SUB) || (id_ir[15:11] == `SUBC)
                     || (id_ir[15:11] == `CMP) || (id_ir[15:11] == `AND)
                     || (id_ir[15:11] == `OR)  || (id_ir[15:11] == `XOR)
                     || (id_ir[15:11] == `SLL) || (id_ir[15:11] == `SRL)
                     || (id_ir[15:11] == `SLA) || (id_ir[15:11] == `SRA)
                    ) begin
                    if (//  if Hazard
                        (
                            (ex_ir[15:11] == `SRA)  || (ex_ir[15:11] == `LDIH)
                        ||  (ex_ir[15:11] == `ADD)  || (ex_ir[15:11] == `ADDI)
                        ||  (ex_ir[15:11] == `ADDC) || (ex_ir[15:11] == `SUB)
                        ||  (ex_ir[15:11] == `SUBI) || (ex_ir[15:11] == `SUBC)
                        ||  (ex_ir[15:11] == `AND)  || (ex_ir[15:11] == `OR)
                        ||  (ex_ir[15:11] == `XOR)  || (ex_ir[15:11] == `SLL)
                        ||  (ex_ir[15:11] == `SRL)  || (ex_ir[15:11] == `SLA)
                        ) && (id_ir[6:4] == ex_ir[10:8])
                       )
                        reg_A <= ALUo;
                    else if (
                        (
                            (mem_ir[15:11] == `SRA)  || (mem_ir[15:11] == `LDIH)
                        ||  (mem_ir[15:11] == `ADD)  || (mem_ir[15:11] == `ADDI)
                        ||  (mem_ir[15:11] == `ADDC) || (mem_ir[15:11] == `SUB)
                        ||  (mem_ir[15:11] == `SUBI) || (mem_ir[15:11] == `SUBC)
                        ||  (mem_ir[15:11] == `AND)  || (mem_ir[15:11] == `OR)
                        ||  (mem_ir[15:11] == `XOR)  || (mem_ir[15:11] == `SLL)
                        ||  (mem_ir[15:11] == `SRL)  || (mem_ir[15:11] == `SLA)
                        ) && (id_ir[6:4] == mem_ir[10:8])
                       )
                        reg_A <= reg_C;
                    else if ((mem_ir[15:11] == `LOAD) && (id_ir[6:4] == mem_ir[10:8])) // LOAD hazard
                        reg_A <= d_datain;
                    else if (
                        (
                            (wb_ir[15:11] == `SRA)  || (wb_ir[15:11] == `LDIH)
                        ||  (wb_ir[15:11] == `ADD)  || (wb_ir[15:11] == `ADDI)
                        ||  (wb_ir[15:11] == `ADDC) || (wb_ir[15:11] == `SUB)
                        ||  (wb_ir[15:11] == `SUBI) || (wb_ir[15:11] == `SUBC)
                        ||  (wb_ir[15:11] == `AND)  || (wb_ir[15:11] == `OR)
                        ||  (wb_ir[15:11] == `XOR)  || (wb_ir[15:11] == `SLL)
                        ||  (wb_ir[15:11] == `SRL)  || (wb_ir[15:11] == `SLA)
                        ||  (wb_ir[15:11] == `LOAD)
                        ) && (id_ir[6:4] == wb_ir[10:8])
                       )
                        reg_A <= reg_C1;
                    else//  no hazard
                        reg_A <= gr[id_ir[6:4]];
                    end

            //  write reg_B
            if (
                    (id_ir[15:11] == `LOAD) || (id_ir[15:11] == `SLL)
                 || (id_ir[15:11] == `SRL)  || (id_ir[15:11] == `SLA)
                 || (id_ir[15:11] == `SRA)  || (id_ir[15:11] == `STORE)
               )
                //  reg_B <= val3
                reg_B <= {12'b0000_0000_0000, id_ir[3:0]};
            else if (id_ir[15:11] == `LDIH)
                //  reg_B <= {val2, val3, 8'b0000_0000}
                reg_B <= {id_ir[7:0], 8'b0000_0000};
            else if (
                       (id_ir[15:11] == `BZ) || (id_ir[15:11] == `BNZ)
                    || (id_ir[15:11] == `BN) || (id_ir[15:11] == `BNN)
                    || (id_ir[15:11] == `BC) || (id_ir[15:11] == `BNC)
                    || (id_ir[15:11] == `JMPR)
                    || (id_ir[15:11] == `ADDI) || (id_ir[15:11] == `SUBI)
                    )
                //  reg_B <= {val2, val3}
                reg_B <= {8'b0000_0000, id_ir[7:0]};
            else if (//  reg_B <= gr3
                        (id_ir[15:11] == `ADD) || (id_ir[15:11] == `ADDC)
                     || (id_ir[15:11] == `SUB) || (id_ir[15:11] == `SUBC)
                     || (id_ir[15:11] == `CMP) || (id_ir[15:11] == `AND)
                     || (id_ir[15:11] == `OR)  || (id_ir[15:11] == `XOR)
                    ) begin
                        if (//  if Hazard
                            (
                                (ex_ir[15:11] == `SRA)  || (ex_ir[15:11] == `LDIH)
                            ||  (ex_ir[15:11] == `ADD)  || (ex_ir[15:11] == `ADDI)
                            ||  (ex_ir[15:11] == `ADDC) || (ex_ir[15:11] == `SUB)
                            ||  (ex_ir[15:11] == `SUBI) || (ex_ir[15:11] == `SUBC)
                            ||  (ex_ir[15:11] == `AND)  || (ex_ir[15:11] == `OR)
                            ||  (ex_ir[15:11] == `XOR)  || (ex_ir[15:11] == `SLL)
                            ||  (ex_ir[15:11] == `SRL)  || (ex_ir[15:11] == `SLA)
                            ) && (id_ir[2:0] == ex_ir[10:8])
                           )
                            reg_B <= ALUo;
                        else if (
                            (
                                (mem_ir[15:11] == `SRA)  || (mem_ir[15:11] == `LDIH)
                            ||  (mem_ir[15:11] == `ADD)  || (mem_ir[15:11] == `ADDI)
                            ||  (mem_ir[15:11] == `ADDC) || (mem_ir[15:11] == `SUB)
                            ||  (mem_ir[15:11] == `SUBI) || (mem_ir[15:11] == `SUBC)
                            ||  (mem_ir[15:11] == `AND)  || (mem_ir[15:11] == `OR)
                            ||  (mem_ir[15:11] == `XOR)  || (mem_ir[15:11] == `SLL)
                            ||  (mem_ir[15:11] == `SRL)  || (mem_ir[15:11] == `SLA)
                            ) && (id_ir[2:0] == mem_ir[10:8])
                           )
                            reg_B <= reg_C;
                        else if ((mem_ir[15:11] == `LOAD) && (id_ir[2:0] == mem_ir[10:8])) // LOAD hazard
                            reg_B <= d_datain;
                        else if (
                            (
                                (wb_ir[15:11] == `SRA)  || (wb_ir[15:11] == `LDIH)
                            ||  (wb_ir[15:11] == `ADD)  || (wb_ir[15:11] == `ADDI)
                            ||  (wb_ir[15:11] == `ADDC) || (wb_ir[15:11] == `SUB)
                            ||  (wb_ir[15:11] == `SUBI) || (wb_ir[15:11] == `SUBC)
                            ||  (wb_ir[15:11] == `AND)  || (wb_ir[15:11] == `OR)
                            ||  (wb_ir[15:11] == `XOR)  || (wb_ir[15:11] == `SLL)
                            ||  (wb_ir[15:11] == `SRL)  || (wb_ir[15:11] == `SLA)
                            ||  (wb_ir[15:11] == `LOAD)
                            ) && (id_ir[2:0] == wb_ir[10:8])
                           )
                            reg_B <= reg_C1;
                        else//  no hazard
                            reg_B <= gr[id_ir[2:0]];
                    end

            //  write smdr
            if (id_ir[15:11] == `STORE) begin
                if (//  if Hazard
                    (
                        (ex_ir[15:11] == `SRA)  || (ex_ir[15:11] == `LDIH)
                    ||  (ex_ir[15:11] == `ADD)  || (ex_ir[15:11] == `ADDI)
                    ||  (ex_ir[15:11] == `ADDC) || (ex_ir[15:11] == `SUB)
                    ||  (ex_ir[15:11] == `SUBI) || (ex_ir[15:11] == `SUBC)
                    ||  (ex_ir[15:11] == `AND)  || (ex_ir[15:11] == `OR)
                    ||  (ex_ir[15:11] == `XOR)  || (ex_ir[15:11] == `SLL)
                    ||  (ex_ir[15:11] == `SRL)  || (ex_ir[15:11] == `SLA)
                    ) && (id_ir[10:8] == ex_ir[10:8])
                   )
                    smdr <= ALUo;
                else if (
                    (
                        (mem_ir[15:11] == `SRA)  || (mem_ir[15:11] == `LDIH)
                    ||  (mem_ir[15:11] == `ADD)  || (mem_ir[15:11] == `ADDI)
                    ||  (mem_ir[15:11] == `ADDC) || (mem_ir[15:11] == `SUB)
                    ||  (mem_ir[15:11] == `SUBI) || (mem_ir[15:11] == `SUBC)
                    ||  (mem_ir[15:11] == `AND)  || (mem_ir[15:11] == `OR)
                    ||  (mem_ir[15:11] == `XOR)  || (mem_ir[15:11] == `SLL)
                    ||  (mem_ir[15:11] == `SRL)  || (mem_ir[15:11] == `SLA)
                    ) && (id_ir[10:8] == mem_ir[10:8])
                   )
                    smdr <= reg_C;
                else if ((mem_ir[15:11] == `LOAD) && (id_ir[10:8] == mem_ir[10:8])) // LOAD hazard
                    smdr <= d_datain;
                else if (
                    (
                        (wb_ir[15:11] == `SRA)  || (wb_ir[15:11] == `LDIH)
                    ||  (wb_ir[15:11] == `ADD)  || (wb_ir[15:11] == `ADDI)
                    ||  (wb_ir[15:11] == `ADDC) || (wb_ir[15:11] == `SUB)
                    ||  (wb_ir[15:11] == `SUBI) || (wb_ir[15:11] == `SUBC)
                    ||  (wb_ir[15:11] == `AND)  || (wb_ir[15:11] == `OR)
                    ||  (wb_ir[15:11] == `XOR)  || (wb_ir[15:11] == `SLL)
                    ||  (wb_ir[15:11] == `SRL)  || (wb_ir[15:11] == `SLA)
                    ||  (wb_ir[15:11] == `LOAD)
                    ) && (id_ir[10:8] == wb_ir[10:8])
                   )
                    smdr <= reg_C1;
                else//  no hazard
                    smdr <= gr[id_ir[10:8]];
            end
        end
    end
end
endmodule
