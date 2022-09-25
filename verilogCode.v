`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    FIFO_counter_synchronous 
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
module FIFO_counter_synchronous(clk,rst,buf_in,buf_out,wr_en,rd_en,buf_empty,buf_full,fifo_counter
    );
input clk,rst,buf_in,wr_en,rd_en;
 reg [5:0] wr_ptr;
 reg [5:0] rd_ptr;
output reg buf_out,buf_empty,buf_full;
output reg [6:0] fifo_counter;
reg [5:0] buf_mem[63:0];  // it means we have total 64 memory vectors Each of 6 bits


always @(fifo_counter)
begin
if(fifo_counter==0) begin
buf_empty <=1; buf_full <=0; end

else if (fifo_counter==64) begin 
buf_full <=1; buf_empty <=0;  end

else 
begin
buf_full <=0; buf_empty <=0;  end
end

//////////////////////////////////
always @(posedge clk or posedge rst)
begin
    if(rst)
           fifo_counter<=0;
    else if((!buf_full && wr_en) && (!buf_empty && rd_en))
           fifo_counter<=fifo_counter;
    else if(!buf_full && wr_en)
           fifo_counter<=fifo_counter+1;
    else if	(!buf_empty && rd_en)		  
	        fifo_counter<=fifo_counter-1;
    else 
	     fifo_counter<=fifo_counter;
end
////////////////////////////////////
always @(posedge clk or posedge rst)
begin
  if(rst)
  buf_out<=0;
  else if (rd_en && !buf_empty)
   buf_out<=buf_mem[rd_ptr];
  else 
   buf_out<=buf_out;
end
///////////////////////////////////
always @(posedge clk)
begin
   if(wr_en && !buf_full)
	   buf_mem[wr_ptr]<=buf_in;
	else
	   buf_mem[wr_ptr]<=buf_mem[wr_ptr];
end
////////////////////////////////////
always @(posedge clk or posedge rst)
begin
    if(rst)
	   begin
		  wr_ptr<=0;
		  rd_ptr<=0;
		end
	 else
	   begin
	   if(!buf_full && wr_en)
		    wr_ptr<=wr_ptr+1;
		else 
		    wr_ptr<=wr_ptr;
		if(!buf_empty && rd_en)
		    rd_ptr<=rd_ptr+1;
	   else
		    rd_ptr<=rd_ptr;
		  
	   end
end
endmodule
