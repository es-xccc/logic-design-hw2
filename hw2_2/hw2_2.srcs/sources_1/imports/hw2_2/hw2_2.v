`timescale 1 ns/1 ns

module hw2_2(clk, reset, data_in, c, data_out);
input clk, reset;
input[7:0] data_in;
input[8:0] c;
output[7:0] data_out;
reg r0[7:0],r1[7:0],r2[7:0],r_out[7:0],i,dest[7:0];
always@(negedge reset)begin
for(i=0;i<8;i=i+1)begin
r0[i]<=0;
r1[i]<=0;
r2[i]<=0;
r_out[i]<=0;
end
end
always@(posedge clk)begin
end
endmodule


module mux(c1,c2,r0,r1,r2,din,src);
input c1,c2,r0,r1,r2,din;
output reg src;
always@(c1 || c2)begin
if(c1==0)begin
    if(c2==0)begin
        assign src=r0;
    end
    else begin
        assign src=r1;
    end
end
else begin
    if(c2==0)begin
        assign src=r0;
    end
    else begin
        assign src=din;
    end
end
end
endmodule


module demux(dest,c1,c2,r0,r1,r2,r_out);
input dest,c1,c2;
output reg r0,r1,r2,r_out;
always@(c1 || c2)begin
assign r0=0;
assign r1=0;
assign r2=0;
assign r_out=0;
if(c1==0)begin
    if(c2==0)begin
        assign r0=dest;
    end
    else begin
        assign r1=dest;
    end
end
else begin
    if(c2==0)begin
        assign r2=dest;
    end
    else begin
        assign r_out=dest;
    end
end
end
endmodule


module alu(src_a,src_b,c0,c1,c2,dest);
input src_a,src_b,c0,c1,c2;
output reg dest;
always@(c0||c1||c2)begin
if(c0==0)begin
    if(c1==0)begin
        if(c2==0)begin
            assign dest=src_a;
        end
        else begin
            assign dest=src_a+src_b;
        end
    end
    else begin
        if(c2==0)begin
            assign dest=src_a-src_b;
        end
        else begin
            assign dest=src_a&src_b;
        end
    end
end
else begin
    if(c1==0)begin
        if(c2==0)begin
            assign dest=src_a|src_b;
        end
        else begin
            assign dest=src_a^src_b;
        end
    end
    else begin
        if(c2==0)begin
            assign dest=0;
        end
        else begin
            assign dest=0;
        end
    end
end
end
endmodule