module cnn_test();
reg clk, rst;
        //reg signed [12:0] a;
        wire [12:0]out31,out32,out33,out34,out35;
       // wire out_en;
        wire done;
        
        // Instantiate the convolution module
        CNN uut (clk,rst,out31,out32,out33,out34,out35,done);
        
        // Clock generation
        always #5 clk = ~clk; // 10ns clock period
        
        initial begin
            // Initialize signals
            clk = 0;
            rst = 1;
            #50;
            
            
            
            rst = 0; // Deassert reset after some time
