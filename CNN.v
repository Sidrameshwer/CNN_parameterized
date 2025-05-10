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
           input signed [12:0]a,
           output signed [15:0]out,
           output  done);
      
           
      wire signed [12:0]out11,out12,out13,out14,out15,out16,out17,out18,out19,out20;
      wire signed [12:0] out31,out32,out33,out34,out35;
      wire done1,done2; 
      reg [15:0] in; 
      reg signed [15:0] in1=0;
      reg [2:0] state,next_state;
      parameter s0=0,s1=1,s2=2,s3=3,s4=4;
      reg signed [12:0] w[0:3];//weights
      //wire signed [19:0] mult_result;
      integer i;
      //assign mult_result = $signed(out31) * $signed(w[i]);
      initial begin
      w[0]=1;
      w[1]=-1;
      w[2]=-1;
      w[3]=-1;
      end   
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
layer1#(16,5,10) l1 (clk,rst,a,out11,out12,out13,out14,out15,out16,out17,out18,out19,out20,done1);
layer2#(6,3,5) l2 (clk,rst2,out11,out31,out32,out33,out34,out35,done2);
sigmoid l3 (in,out);
always @(posedge clk)
    begin
    if(rst)
        state<=s0;
    else 
        state<=next_state;
   
    case(state)
    s0: i<=0;
    s1: ;
    s2: begin
        in1<=in1+out31*w[i]; 
        i<=i+1;
        end
    s3: in<=in1*4096;
    s4: ;
    endcase
    end
    
    always@(*)
    begin
    next_state=s0;
    case(state)
    s0: next_state=done2? s1: s0;
    s1: next_state=(i<4)? s2: s3;
    s2: next_state= s1;
    s3: next_state= s4;
    s4: next_state=s4;
    endcase
    end
endmodule

/*always @(posedge clk)
    begin
           *//* if(rst)
                state<=s0;
            else
                state<=next_state;*//*
    end
always @(posedge clk)
    begin
        case(state)
            s0:begin
                //rst1<=1;
                //rst2<=1;
                end
            s1: rst1<=0;
            s2: begin//rst2<=0;
            
                end
            s3: begin
            
                end
        endcase
    
    end
always @(*)
    begin
        case(state)
            s0: next_state=s1;
            s1: next_state=done1?s2:s1;
            s2: next_state=done2?s3:s2;
            s3: next_state=s3;
        endcase
    end*/
