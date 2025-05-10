`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 15:45:25
// Design Name: 
// Module Name: conv1
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


 module conv1#(parameter N=6,M=3)(
    input clk,rst,
    input signed [12:0] a,
    //output reg out_en,
    output reg signed [12:0] out,
    output reg done,out_en
    );
    reg signed [12:0] A[0:N*N-1];
    reg signed [12:0] W[0:M*M-1];
    initial begin
    //W[0][0] =  1;  W[0][1] = -1;  W[0][2] =  2;
W[0]  = -2;
W[1]  =  0;
W[2]  =  1;
W[3]  = -1;
W[4]  =  1;
W[5]  =  0;
W[6]  =  1;
W[7]  = -2;
W[8]  =  1;
/*W[9]  = -1;
W[10] = -1;
W[11] =  2;
W[12] =  0;
W[13] = -1;
W[14] = -1;
W[15] =  0;
W[16] = -3;
W[17] =  1;
W[18] =  1;
W[19] = -1;
W[20] =  1;
W[21] =  0;
W[22] = -1;
W[23] =  2;
W[24] =  1;*/

    end
    //reg [7:0] Y[0:N-M][0:N-M];//N-M+1 bits
    reg [3:0] state,next_state;
    localparam s_init=10,s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9;
    integer j,k,l,p,q;
    reg [12:0]sum=0;
    always@(posedge clk)
       begin
          if(rst)
          state<=s_init;
          else
          state<=next_state;
      end
   always@(posedge clk)
      begin
        case(state)
        s_init: begin
                //i<=0;
                j<=0;
                k<=0;
                l<=0;
                p<=0;
                q<=0;
                done<=0;
                //out_en<=0;
                end
        
        s0:
             begin
                    A[j] <= a;
             end
        
        s1:
            begin
                j<=j+1;
            end
        /*s2:
            begin
                j<=0;
                i<=i+1;
            end*/
            
        s3: 
            begin
            
            end
        s4: 
            begin
            sum <= A[(k+p)*N+(l+q)]* W[p*M+q] + sum;
            q<=q+1;
            end
        s5: 
            begin
                q<=0;
                p<=p+1;
            end
        s6: begin
             
                out<=sum;
                p<=0;
                q<=0;
                sum<=0;
                l<=l+1;
                out_en<=1;
            end
        s7: 
            out_en<=0;
        s8: 
            begin
                l<=0;
                k<=k+1;
            end    
        s9: 
            done<=1;
        
        endcase
      end
      
   always@(*) 
    begin
    next_state=s0;
        case(state)
        s_init: next_state=s0;
        
        s0: begin
                    if(j<N*N)
                        next_state = s1;
                    else
                        next_state = s3;
                end 
            
        s1: 
            next_state=s0;
        
        /*s2: 
            next_state=s0;*/
        s3: begin
            if(k<N-M+1)
            begin
                if(l<N-M+1)
                begin
                    if (p<M) 
                        begin
                            if(q<M)
                                next_state = s4;
                            else
                                next_state = s5;
                        end 
                    else 
                        next_state = s6;
                end
                else 
                    next_state=s8;
                end
            else
                next_state=s9;
            end
        s4: 
            next_state=s3;
        s5: 
            next_state=s3;
        s6: 
            next_state=s7;
        s7: 
            next_state=s3;
        s8: 
            next_state=s3;
        s9: 
            next_state=s9;    
        endcase
    end
endmodule
