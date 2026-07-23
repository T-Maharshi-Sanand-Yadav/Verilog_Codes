// Asynchronous FIFO with Gray-coded pointer synchronization - PDF pages 90-98
module async_fifo #(parameter DATA_WIDTH=8,ADDR_WIDTH=3)(input wclk,wrst_n,w_en,input [DATA_WIDTH-1:0] wdata,output wfull,input rclk,rrst_n,r_en,output reg [DATA_WIDTH-1:0] rdata,output rempty);
 localparam DEPTH=(1<<ADDR_WIDTH); reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];
 reg [ADDR_WIDTH:0] wbin,rbin,wgray,rgray; reg [ADDR_WIDTH:0] rgray_w1,rgray_w2,wgray_r1,wgray_r2;
 wire [ADDR_WIDTH:0] wbin_next=wbin+(w_en&~wfull); wire [ADDR_WIDTH:0] rbin_next=rbin+(r_en&~rempty);
 wire [ADDR_WIDTH:0] wgray_next=(wbin_next>>1)^wbin_next; wire [ADDR_WIDTH:0] rgray_next=(rbin_next>>1)^rbin_next;
 assign rempty=(rgray_next==wgray_r2);
 assign wfull=(wgray_next=={~rgray_w2[ADDR_WIDTH:ADDR_WIDTH-1],rgray_w2[ADDR_WIDTH-2:0]});
 always @(posedge wclk or negedge wrst_n) if(!wrst_n) begin wbin<=0;wgray<=0;rgray_w1<=0;rgray_w2<=0;end else begin rgray_w1<=rgray;rgray_w2<=rgray_w1;if(w_en&&!wfull)mem[wbin[ADDR_WIDTH-1:0]]<=wdata;wbin<=wbin_next;wgray<=wgray_next;end
 always @(posedge rclk or negedge rrst_n) if(!rrst_n) begin rbin<=0;rgray<=0;wgray_r1<=0;wgray_r2<=0;rdata<=0;end else begin wgray_r1<=wgray;wgray_r2<=wgray_r1;if(r_en&&!rempty)rdata<=mem[rbin[ADDR_WIDTH-1:0]];rbin<=rbin_next;rgray<=rgray_next;end
endmodule
