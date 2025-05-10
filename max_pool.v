`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2025 10:56:20
// Design Name: 
// Module Name: max_pool
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

module max_pool(
    input clk,
    input signed[12:0] input1,
    input signed[12:0] input2,
    input signed[12:0] input3,
    input signed[12:0] input4,
    input enable,
    output reg signed [12:0] output1,
    output reg maxPoolingDone
);
    
    always @ (posedge clk) begin
        if(enable) begin
            if($signed(input1) >= $signed(input2) && $signed(input1) >= $signed(input3) && $signed(input1) >= $signed(input4)) begin
                output1 <= input1;
            end
            else if($signed(input2) >= $signed(input3) && $signed(input2) >= $signed(input4)) begin
                output1 <= input2;
            end
            else if($signed(input3) >= $signed(input4)) begin
                output1 <= input3;
            end
            else begin
                output1 <= input4;
            end
            maxPoolingDone <= 1;
        end
        else begin
            output1 <= 0;
            maxPoolingDone <= 0;
        end
    end
    
endmodule
/*module max_pool(
    input clk,
	input [21:0] input1,
	input [21:0] input2,
	input [21:0] input3,
	input [21:0] input4,
	input enable,
    output reg signed [21:0] output1,
	output reg maxPoolingDone
    );
	
	reg [21:0] initialMax = 22'b1000000000000000000000;
	reg [21:0] tempOutput;
	
	always @ (posedge clk) begin
		if(enable) begin
			if($signed(initialMax) < $signed(input1)) begin
				if($signed(input2) < $signed(input1)) begin
					if($signed(input3) < $signed(input1)) begin
						if($signed(input4) < $signed(input1)) begin
							output1 <= input1;
							maxPoolingDone <= 1;
						end
						else begin
							output1 <= input4;
							maxPoolingDone <= 1;
						end
					end
					else begin
						if($signed(input3) < $signed(input4)) begin
							output1 <= input4;
							maxPoolingDone <= 1;
						end
						else begin
							output1 <= input3;
							maxPoolingDone <= 1;
						end
					end
				end
				else begin
					if($signed(input3) < $signed(input2)) begin
						if($signed(input4) < $signed(input2)) begin
							output1 <= input2;
							maxPoolingDone <= 1;
						end
						else begin
							output1 <= input4;
							maxPoolingDone <= 1;
						end
					end
					else begin
						if($signed(input3) < $signed(input4)) begin
							output1 <= input4;
							maxPoolingDone <= 1;
						end
						else begin
							output1 <= input3;
							maxPoolingDone <= 1;
						end
					end
				end
			end
			else begin
				output1 <= initialMax;
				maxPoolingDone <= 1;
			end
		end
		else begin
			output1 <= 0;
			maxPoolingDone <= 0;
		end
	end


endmodule*/
