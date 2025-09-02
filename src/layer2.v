`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 15:22:56
// Design Name: 
// Module Name: layer2
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


/*module layer2#(parameter N=6,M=3,L=5)(input clk,rst,
              input signed [7:0] i0,
              output reg [7:0]out00,out10,out20,out30,out40,
              output reg done); 
      //reg 
      wire [7:0] out1[0:L-1];
      wire [7:0] out2[0:L-1];
      wire done1,done2,out_en;
      reg en;
      reg[5:0] size=(N-M+1)>>1;
      reg [7:0]in1[0:L-1];
    reg [7:0]in2[0:L-1];
    reg [7:0]in3[0:L-1];
    reg [7:0]in4[0:L-1];
    integer i=0,j=0,j2=0,k2=0,j1=-1,k1=0;
    reg [3:0]state,next_state;
    localparam s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9,s10=10; 
     reg [7:0] out_temp1[0:L-1][0:(N-M+1)*(N-M+1)-1];
      reg [7:0] out_temp2[0:L-1][0:3];//change this
     
      conv1#(6,3) x1  (clk, rst, i0, out1[0] , done1,out_en);
      conv1#(6,3) x2  (clk, rst, i0, out1[1] , ,);
      conv1#(6,3) x3  (clk, rst, i0, out1[2] , ,);
      conv1#(6,3) x4  (clk, rst, i0, out1[3] , ,);
      conv1#(6,3) x5  (clk, rst, i0, out1[4] , ,);
      
      max_pool m1  (clk, in1[0], in2[0], in3[0], in4[0], en, out2[0], done2);
    max_pool m2  (clk, in1[1], in2[1], in3[1], in4[1], en, out2[1], done2);
    max_pool m3  (clk, in1[2], in2[2], in3[2], in4[2], en, out2[2], done2);
    max_pool m4  (clk, in1[3], in2[3], in3[3], in4[3], en, out2[3], done2);
    max_pool m5  (clk, in1[4], in2[4], in3[4], in4[4], en, out2[4], done2);
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
            end
        s7: begin
                k2<=0;
                j2<=j2+(N-M+1)*2;
                
            end
        s9:done<=1;
        s8: begin
                if(k1<(size*size))
                begin
                out00<=out_temp2[0][k1];
                out10<=out_temp2[1][k1];
                out20<=out_temp2[2][k1];
                out30<=out_temp2[3][k1];
                out40<=out_temp2[4][k1];
                
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
    s10: next_state=s10;
    endcase
    end
    
      
endmodule*/
module layer2#(parameter N=6, M=3, L=5)(
    input clk, rst,
    input signed [12:0] i0,
    output reg signed[12:0] out00, out10, out20, out30, out40,
    output reg done
); 
    wire signed[12:0] out1[0:L-1];
    wire signed[12:0] out2[0:L-1];
    wire signed[12:0] out3[0:L-1];
    wire done1, done2, out_en;
    reg en;
    reg [5:0] size = (N - M + 1) >> 1;
    
    reg [12:0] in1[0:L-1];
    reg [12:0] in2[0:L-1];
    reg [12:0] in3[0:L-1];
    reg [12:0] in4[0:L-1];
    reg [12:0] in_temp[0:L-1];

    integer i = 0, j = 0, j2 = 0, k2 = 0, j1 = -1, k1 = 0;
    
    reg [3:0] state, next_state;
    localparam s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9, s10=10,s11=11,s12=12;

    reg [12:0] out_temp1 [0:L*(N-M+1)*(N-M+1)-1];  // Flattened 2D: [L][(N-M+1)^2]
    reg [12:0] out_temp2 [0:L*4-1];               // Flattened 2D: [L][4] = 5*4=20

    // Convolution layer
    conv1#(6,3) x1(clk, rst, i0, out1[0], done1, out_en);
    conv1#(6,3) x2(clk, rst, i0, out1[1], ,);
    conv1#(6,3) x3(clk, rst, i0, out1[2], ,);
    conv1#(6,3) x4(clk, rst, i0, out1[3], ,);
    conv1#(6,3) x5(clk, rst, i0, out1[4], ,);

    // Max pooling
    max_pool m1(clk, in1[0], in2[0], in3[0], in4[0], en, out2[0], done2);
    max_pool m2(clk, in1[1], in2[1], in3[1], in4[1], en, out2[1], done2);
    max_pool m3(clk, in1[2], in2[2], in3[2], in4[2], en, out2[2], done2);
    max_pool m4(clk, in1[3], in2[3], in3[3], in4[3], en, out2[3], done2);
    max_pool m5(clk, in1[4], in2[4], in3[4], in4[4], en, out2[4], done2);
    
    ReLu t1 (clk,in_temp[0],out3[0]);
    ReLu t2 (clk,in_temp[1],out3[1]);
    ReLu t3 (clk,in_temp[2],out3[2]);
    ReLu t4 (clk,in_temp[3],out3[3]);
    ReLu t5 (clk,in_temp[4],out3[4]);

    // FSM state transition
    always @(posedge clk) begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end

    // FSM functionality
    always @(posedge clk) begin
        case(state)
            s0: begin
                j <= 0;
                done <= 0;
                en <= 1;
            end

            s2: ;  // Idle or wait

            s3: begin
                out_temp1[0*(N-M+1)*(N-M+1) + j] <= out1[0];
                out_temp1[1*(N-M+1)*(N-M+1) + j] <= out1[1];
                out_temp1[2*(N-M+1)*(N-M+1) + j] <= out1[2];
                out_temp1[3*(N-M+1)*(N-M+1) + j] <= out1[3];
                out_temp1[4*(N-M+1)*(N-M+1) + j] <= out1[4];
                j <= j + 1;
            end

            s4: begin
                for (i = 0; i < L; i = i + 1) begin
                    in1[i] <= out_temp1[i*(N-M+1)*(N-M+1) + j2 + k2];
                    in2[i] <= out_temp1[i*(N-M+1)*(N-M+1) + j2 + k2 + (N - M + 1)];
                    in3[i] <= out_temp1[i*(N-M+1)*(N-M+1) + j2 + k2 + 1];
                    in4[i] <= out_temp1[i*(N-M+1)*(N-M+1) + j2 + k2 + (N - M + 2)];
                end
            end

            s5: begin
                k2 <= k2 + 2;
                j1 <= j1 + 1;
            end
            s11: begin
                in_temp[0] <= out2[0];
                in_temp[1] <= out2[1];
                in_temp[2] <= out2[2];
                in_temp[3] <= out2[3];
                in_temp[4] <= out2[4];
            end
            s12 : begin
                    end

            s6: begin
                out_temp2[0*4 + j1] <= out3[0];
                out_temp2[1*4 + j1] <= out3[1];
                out_temp2[2*4 + j1] <= out3[2];
                out_temp2[3*4 + j1] <= out3[3];
                out_temp2[4*4 + j1] <= out3[4];
            end

            s7: begin
                k2 <= 0;
                j2 <= j2 + (N - M + 1) * 2;
            end

            s9: done <= 1;

            s8: begin
                if (k1 < size * size) begin
                    out00 <= out_temp2[0*4 + k1];
                    out10 <= out_temp2[1*4 + k1];
                    out20 <= out_temp2[2*4 + k1];
                    out30 <= out_temp2[3*4 + k1];
                    out40 <= out_temp2[4*4 + k1];
                end
            end

            s1: k1 <= k1 + 1;
            s10: ; // Final state
        endcase
    end

    // FSM next state logic
    always @(*) begin
        next_state = s0;
        case(state)
            s0: next_state = s2;
            s2: next_state = (j < (N - M + 1) * (N - M + 1)) ?
                             (out_en ? s3 : s2) : s4;
            s3: next_state = s2;
            s4: next_state = (j2 < (N - M + 1) * (N - M + 1)) ?
                             ((k2 < (N - M + 1)) ? s5 : s7) : s9;
            s5: next_state = s11;
            s11: next_state = s12;
            s12: next_state= s6;
            s6: next_state = s4;
            s7: next_state = s4;
            s9: next_state = s8;
            s8: next_state = (k1 < size * size) ? s1 : s10;
            s1: next_state = s8;
            s10: next_state = s10;
        endcase
    end

endmodule



