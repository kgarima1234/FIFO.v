`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:  
// Design Name:   FIFO_counter_synchronous
// Module Name:   /home/ise/FIFO_counter_synchronous/Fifo_counter_test.v
// Project Name:  FIFO_counter_synchronous
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FIFO_counter_synchronous
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fifo_counter_test;

	// Inputs
	reg clk;
	reg rst;
	reg buf_in;
	reg wr_en;
	reg rd_en;

	// Outputs
	wire buf_out;
	wire buf_empty;
	wire buf_full;
	wire [6:0] fifo_counter;

	// Instantiate the Unit Under Test (UUT)
	FIFO_counter_synchronous uut (
		.clk(clk), 
		.rst(rst), 
		.buf_in(buf_in), 
		.buf_out(buf_out), 
		.wr_en(wr_en), 
		.rd_en(rd_en), 
		.buf_empty(buf_empty), 
		.buf_full(buf_full), 
		.fifo_counter(fifo_counter)
	);
initial
begin
clk=0;
repeat(50)
 begin
 #10 clk=~clk;
 end
 end
 
 
	initial begin
		// Initialize Inputs
		
      rst = 1;
		buf_in = 0;
		wr_en = 0;
		rd_en = 0;
		#10;
		
		rst = 0;
		buf_in = 1;
		wr_en = 1;
		rd_en = 0;
		#20;
		
		rst = 0;
		buf_in = 1;
		wr_en = 1;
		rd_en = 0;
		#20;
		
		rst = 0;
		buf_in = 1;
		wr_en = 0;
		rd_en = 1;
		#20;
		
		rst = 0;
		buf_in = 1;
		wr_en = 1;
		rd_en = 0;
		#20;
		
		rst = 0;
		buf_in = 1;
		wr_en = 1;
		rd_en = 0;
		#20;
		rst = 0;
		buf_in = 1;
		wr_en = 0;
		rd_en = 1;
		#20;
		rst = 0;
		buf_in = 1;
		wr_en = 0;
		rd_en = 1;
		#20;
		rst = 0;
		buf_in = 1;
		wr_en = 1;
		rd_en = 0;
		#20;
        
		// Add stimulus here

	end
      
		initial 
		$monitor($time , "fifo counter = %d",fifo_counter );
		
		
endmodule

