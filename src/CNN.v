`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 21:42:33
// Design Name: 
// Module Name: CNN
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


module CNN(input clk, rst,
           //input signed [12:0]a,
           output signed [12:0]out31,out32,out33,out34,out35,
           output  done);
      
           
      wire signed [12:0]out11,out12,out13,out14,out15,out16,out17,out18,out19,out20;
      //wire signed [12:0] out31,out32,out33,out34,out35;
      wire done1,done2; 
      
      //wire signed [19:0] mult_result;
      //assign mult_result = $signed(out31) * $signed(w[i]);
      //wire [7:0]out21,out22,out23,out24,out25;    
      reg rst1;
      wire rst2; 
      
      //reg [3:0] state,next_state;
     // parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6;
      assign done=done2;  
     // assign out31=out21;
      //assign out32=out22;
      //assign out33=out23;
      //assign out34=out24;
      //assign out35=out25;   
      assign rst2=~done1;
layer1#(16,5,10) l1 (clk,rst,out11,out12,out13,out14,out15,out16,out17,out18,out19,out20,done1);
layer2#(6,3,5) l2 (clk,rst2,out11,out31,out32,out33,out34,out35,done2);
endmodule
