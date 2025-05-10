`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 11:30:01
// Design Name: 
// Module Name: ReLu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ReLu(input clk,
            input signed [12:0] a,
            output reg [12:0] out);

always@(posedge clk)
    begin
       if($signed(a)<0)
            out<=0;
        else
            out<=a;
    end
endmodule
