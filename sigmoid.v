`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2025 14:23:20
// Design Name: 
// Module Name: sigmoid
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


module sigmoid (
    input  signed [15:0] x,       // Q4.12 format
    output signed [15:0] out      // Q4.12 output
);
    // Constants in Q4.12 format
    parameter signed [15:0] A0 = 16'h0800; // 0.5
    parameter signed [15:0] A1 = 16'h0400; // 0.25
    parameter signed [15:0] A3 = 16'hFFAB; // -1/48
    parameter signed [15:0] A5 = 16'h0008; // 1/480
    parameter signed [15:0] A7 = 16'hFFFF; // -1/8064

    wire signed [31:0] x1, x3, x5, x7;
    wire signed [31:0] t1, t3, t5, t7;
    wire signed [31:0] sum1, sum2, sum3, sum4;

    // x1 = A1 * x
    assign x1 = (x * A1) >>> 12;

    // x^2
    wire signed [15:0] x2 = (x * x) >>> 12;

    // x^3 = x * x^2
    assign x3 = (x * x2) >>> 12;

    // t3 = A3 * x^3
    assign t3 = (x3[15:0] * A3) >>> 12;

    // x^5 = x^2 * x^3
    assign x5 = (x2 * x3[15:0]) >>> 12;

    // t5 = A5 * x^5
    assign t5 = (x5[15:0] * A5) >>> 12;

    // x^7 = x^2 * x^5
    assign x7 = (x2 * x5[15:0]) >>> 12;

    // t7 = A7 * x^7
    assign t7 = (x7[15:0] * A7) >>> 12;

    // Sum all terms
    assign sum1 = A0 + x1[15:0];            // A0 + A1*x
    assign sum2 = sum1 + t3[15:0];          // + A3*x^3
    assign sum3 = sum2 + t5[15:0];          // + A5*x^5
    assign sum4 = sum3 + t7[15:0];          // + A7*x^7

    assign out = sum4[15:0];

endmodule