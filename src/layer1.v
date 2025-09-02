`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2025 17:07:26
// Design Name: 
// Module Name: layer1
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

/*module layer1#(parameter N=16,M=5,L=10)(input clk,rst,
              input [7:0] a,
              output reg [7:0]out11,out12,out13,out14,out15,out16,out17,out18,out19,out20,
              output reg done
    );
    wire [7:0] out1[0:L-1];
    wire [7:0] out2[0:L-1];
    wire done1,done2;
    wire done_temp;
    reg [7:0]in1[0:L-1];
    reg [7:0]in2[0:L-1];
    reg [7:0]in3[0:L-1];
    reg [7:0]in4[0:L-1];
    wire out_en;
    //wire size;
   // assign size=(N-M+1)>>2;
   reg[5:0] size=(N-M+1)>>1;
    reg en;
    integer i=0,j=0,j2=0,k2=0,j1=-1,k1=0;
    reg [3:0]state,next_state;
    localparam s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9,s10=10; 
   // reg [7:0] out_temp1[0:L-1][0:N-M][0:N-M];
   reg [7:0] out_temp1[0:L-1][0:(N-M+1)*(N-M+1)-1];
    reg [7:0] out_temp2[0:L-1][0:35]; //change according to design
conv c1  (clk, rst, a, out1[0], done1,out_en);
conv c2  (clk, rst, a, out1[1], done1,);
conv c3  (clk, rst, a, out1[2], done1,);
conv c4  (clk, rst, a, out1[3], done1,);
conv c5  (clk, rst, a, out1[4], done1,);
conv c6  (clk, rst, a, out1[5], done1,);
conv c7  (clk, rst, a, out1[6], done1,);
conv c8  (clk, rst, a, out1[7], done1,);
conv c9  (clk, rst, a, out1[8], done1,);
conv c10 (clk, rst, a, out1[9], done1,);

    max_pool m1  (clk, in1[0], in2[0], in3[0], in4[0], en, out2[0], done2);
    max_pool m2  (clk, in1[1], in2[1], in3[1], in4[1], en, out2[1], done2);
    max_pool m3  (clk, in1[2], in2[2], in3[2], in4[2], en, out2[2], done2);
    max_pool m4  (clk, in1[3], in2[3], in3[3], in4[3], en, out2[3], done2);
    max_pool m5  (clk, in1[4], in2[4], in3[4], in4[4], en, out2[4], done2);
    max_pool m6  (clk, in1[5], in2[5], in3[5], in4[5], en, out2[5], done2);
    max_pool m7  (clk, in1[6], in2[6], in3[6], in4[6], en, out2[6], done2);
    max_pool m8  (clk, in1[7], in2[7], in3[7], in4[7], en, out2[7], done2);
    max_pool m9  (clk, in1[8], in2[8], in3[8], in4[8], en, out2[8], done2);
    max_pool m10 (clk, in1[9], in2[9], in3[9], in4[9], en, out2[9], done2);

    
    always@(posedge clk) 
    begin
    if(rst)
        state<=s0;
    else
        state<=next_state;
    end
    always@(posedge clk)
    begin
    case(state)
        s0: begin
                //i<=0;
                //s<=0;
                j<=0;
                //k<=0;
                done<=0;
                en<=1;
            end
        s2: begin
        
             end
   
     
        s3: begin
                        out_temp1[0][j] <= out1[0];
                        out_temp1[1][j] <= out1[1];
                        out_temp1[2][j] <= out1[2];
                        out_temp1[3][j] <= out1[3];
                        out_temp1[4][j] <= out1[4];
                        out_temp1[5][j] <= out1[5];
                        out_temp1[6][j] <= out1[6];
                        out_temp1[7][j] <= out1[7];
                        out_temp1[8][j] <= out1[8];
                        out_temp1[9][j] <= out1[9];
                        
                        j<=j+1;
                end
         
        s4: begin
                
                
                for (i = 0; i < L; i = i + 1) begin
                    in1[i] <= out_temp1[i][j2+k2];
                    in2[i] <= out_temp1[i][j2+k2+N-M+1];//j2+k2+12
                    in3[i] <= out_temp1[i][j2+k2+1];
                    in4[i] <= out_temp1[i][j2+k2+N-M+2];//j2+k2+13
                end
            end
            
        s5: begin
                k2<=k2+2;
                j1<=j1+1;
                //out<=out2;
            end
        s6: begin
                        out_temp2[0][j1] <= out2[0];
                        out_temp2[1][j1] <= out2[1];
                        out_temp2[2][j1] <= out2[2];
                        out_temp2[3][j1] <= out2[3];
                        out_temp2[4][j1] <= out2[4];
                        out_temp2[5][j1] <= out2[5];
                        out_temp2[6][j1] <= out2[6];
                        out_temp2[7][j1] <= out2[7];
                        out_temp2[8][j1] <= out2[8];
                        out_temp2[9][j1] <= out2[9];
            end
        s7: begin
                k2<=0;
                j2<=j2+24;
                
            end
        s9:done<=1;
        s8: begin
                if(k1<size*size)
                begin
                out11<=out_temp2[0][k1];
                out12<=out_temp2[1][k1];
                out13<=out_temp2[2][k1];
                out14<=out_temp2[3][k1];
                out15<=out_temp2[4][k1];
                out16<=out_temp2[5][k1];
                out17<=out_temp2[6][k1];
                out18<=out_temp2[7][k1];
                out19<=out_temp2[8][k1];
                out20<=out_temp2[9][k1];
                //done<=1;
                end
            end
        s1: k1<=k1+1;
        s10: begin
        
             end
    endcase
    end  
    
    always@(*)
    begin
    next_state=s0;
    case(state)
    s0: next_state=s2;
    s2:begin
        if (j < (N-M+1) * (N-M+1))
        
            begin
                if(out_en)
                    next_state=s3;
                else 
                    next_state=s2;
            end
        else
            next_state=s4;
       end
    s3: next_state=s2;
    s4: begin
        
                if(j2<(N-M+1)*(N-M+1))
                    begin
                        if(k2<N-M+1)
                            next_state=s5;
                        else
                            next_state=s7;
                    end
                else
                    next_state=s9;
            
        
        end
    s5: next_state=s6;
    s6: next_state=s4;
    s7: next_state=s4;
    s9: next_state=s8;
    s8: begin
            if(k1<(size*size))
                next_state=s1;
            else 
                next_state=s10;
        end
    s1: next_state=s8;
    s10:next_state=s10;
    endcase
    end
    
endmodule*/
module layer1#(parameter N=16, M=5, L=10)(input clk, rst,
              //input signed [12:0] a,
              output reg signed[12:0] out11, out12, out13, out14, out15, out16, out17, out18, out19, out20,
              output reg done
    );
    wire signed[12:0] out1[0:L-1];
    wire signed[12:0] out2[0:L-1];
    wire signed[12:0] out3[0:L-1];
    wire done1, done2;
    wire out_en;
    
    reg signed [12:0] in1[0:L-1], in2[0:L-1], in3[0:L-1], in4[0:L-1],in_temp[0:L-1];
    reg [5:0] size = (N-M+1) >> 1;

    reg signed [12:0] out_temp1_flat[0:L*(N-M+1)*(N-M+1)-1];
    reg signed [12:0] out_temp2_flat[0:L*36-1]; // 36 = 6x6, change according to design

    reg en;
    integer i = 0, j = 0, j2 = 0, k2 = 0, j1 = -1, k1 = 0;
    reg [3:0] state, next_state;
    localparam s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9, s10=10,s11=11,s12=12;
    
// Instantiate conv modules
    conv_unroll c1  (clk, rst, out1[0], done1,out_en);
conv_unroll c2  (clk, rst, out1[1], done1,);
conv_unroll c3  (clk, rst, out1[2], done1,);
conv_unroll c4  (clk, rst, out1[3], done1,);
conv_unroll c5  (clk, rst, out1[4], done1,);
conv_unroll c6  (clk, rst, out1[5], done1,);
conv_unroll c7  (clk, rst, out1[6], done1,);
conv_unroll c8  (clk, rst, out1[7], done1,);
conv_unroll c9  (clk, rst, out1[8], done1,);
conv_unroll c10 (clk, rst, out1[9], done1,);

    max_pool m1  (clk, in1[0], in2[0], in3[0], in4[0], en, out2[0], done2);
    max_pool m2  (clk, in1[1], in2[1], in3[1], in4[1], en, out2[1], );
    max_pool m3  (clk, in1[2], in2[2], in3[2], in4[2], en, out2[2], );
    max_pool m4  (clk, in1[3], in2[3], in3[3], in4[3], en, out2[3], );
    max_pool m5  (clk, in1[4], in2[4], in3[4], in4[4], en, out2[4], );
    max_pool m6  (clk, in1[5], in2[5], in3[5], in4[5], en, out2[5], );
    max_pool m7  (clk, in1[6], in2[6], in3[6], in4[6], en, out2[6], );
    max_pool m8  (clk, in1[7], in2[7], in3[7], in4[7], en, out2[7], );
    max_pool m9  (clk, in1[8], in2[8], in3[8], in4[8], en, out2[8], );
    max_pool m10 (clk, in1[9], in2[9], in3[9], in4[9], en, out2[9], );
    
    ReLu t1 (clk,in_temp[0],out3[0]);
    ReLu t2 (clk,in_temp[1],out3[1]);
    ReLu t3 (clk,in_temp[2],out3[2]);
    ReLu t4 (clk,in_temp[3],out3[3]);
    ReLu t5 (clk,in_temp[4],out3[4]);
    ReLu t6 (clk,in_temp[5],out3[5]);
    ReLu t7 (clk,in_temp[6],out3[6]);
    ReLu t8 (clk,in_temp[7],out3[7]);
    ReLu t9 (clk,in_temp[8],out3[8]);
    ReLu t10 (clk,in_temp[9],out3[9]);

    always @(posedge clk) begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end

    always @(posedge clk) begin
        case (state)
            s0: begin
                j <= 0;
                done <= 0;
                en <= 1;
            end

            s3: begin
                for (i = 0; i < L; i = i + 1)
                    out_temp1_flat[i*(N-M+1)*(N-M+1) + j] <= out1[i];
                j <= j + 1;
            end

            s4: begin
                for (i = 0; i < L; i = i + 1) begin
                    in1[i] <= out_temp1_flat[i*(N-M+1)*(N-M+1) + (j2 + k2)];
                    in2[i] <= out_temp1_flat[i*(N-M+1)*(N-M+1) + (j2 + k2 + N - M + 1)];
                    in3[i] <= out_temp1_flat[i*(N-M+1)*(N-M+1) + (j2 + k2 + 1)];
                    in4[i] <= out_temp1_flat[i*(N-M+1)*(N-M+1) + (j2 + k2 + N - M + 2)];
                end
            end

            s5: begin
                k2 <= k2 + 2;
                j1 <= j1 + 1;
            end
            s11: begin
                //for (i = 0; i < L; i = i + 1)
                 in_temp[0] <= out2[0];
                in_temp[1] <= out2[1];
                in_temp[2] <= out2[2];
                in_temp[3] <= out2[3];
                in_temp[4] <= out2[4];
                in_temp[5] <= out2[5];
                in_temp[6] <= out2[6];
                in_temp[7] <= out2[7];
                in_temp[8] <= out2[8];
                in_temp[9] <= out2[9];
            end
            s12 : begin
                    end

            s6: begin
                for (i = 0; i < L; i = i + 1)
                    out_temp2_flat[i*size*size + j1] <= out3[i];
            end

            s7: begin
                k2 <= 0;
                j2 <= j2 + 2*(N-M+1);
            end

            s8: begin
                if (k1 < size * size) begin
                    out11 <= out_temp2_flat[0*size*size + k1];
                    out12 <= out_temp2_flat[1*size*size + k1];
                    out13 <= out_temp2_flat[2*size*size + k1];
                    out14 <= out_temp2_flat[3*size*size + k1];
                    out15 <= out_temp2_flat[4*size*size + k1];
                    out16 <= out_temp2_flat[5*size*size + k1];
                    out17 <= out_temp2_flat[6*size*size + k1];
                    out18 <= out_temp2_flat[7*size*size + k1];
                    out19 <= out_temp2_flat[8*size*size + k1];
                    out20 <= out_temp2_flat[9*size*size + k1];
                end
            end

            s1: k1 <= k1 + 1;
            s9: done <= 1;
        endcase
    end

    always @(*) begin
        next_state = s0;
        case (state)
            s0: next_state = s2;
            s2: begin
                if (j < (N-M+1)*(N-M+1)) begin
                    if (out_en)
                        next_state = s3;
                    else
                        next_state = s2;
                end else
                    next_state = s4;
            end
            s3: next_state = s2;
            s4: begin
                if (j2 < (N-M+1)*(N-M+1)) begin
                    if (k2 < N-M+1)
                        next_state = s5;
                    else
                        next_state = s7;
                end else
                    next_state = s9;
            end
            s5: next_state = s11;
            s11: next_state = s12;
            s12: next_state = s6;
            s6: next_state = s4;
            s7: next_state = s4;
            s9: next_state = s8;
            s8: begin
                if (k1 < size*size)
                    next_state = s1;
                else
                    next_state = s10;
            end
            s1: next_state = s8;
            s10: next_state = s10;
        endcase
    end
endmodule