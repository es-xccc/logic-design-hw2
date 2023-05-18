module hw2_1 (
    input [2:0] R, 
    input L,
    input clk,
    output [2:0] Qout); 
    
wire temp1;
sub s1(R[0],Qout[2],L,clk,Qout[0]);
sub s2(R[1],Qout[0],L,clk,Qout[1]);
assign temp1 = Qout[2] ^ Qout[1];
sub s3(R[2],temp1,L,clk,Qout[2]);

endmodule


module sub(r,q,l,clock,Q);

input r,q,l,clock;
output reg Q;
reg d, ini=1;

always@(ini == 1)begin
    Q <= d;
    ini <= 0;
end

always@(l) begin
    if(l==0) begin
        assign d=q;
    end
    else begin
        assign d=r;
    end
end

always@(posedge clock)begin
    Q <= d;
end

endmodule