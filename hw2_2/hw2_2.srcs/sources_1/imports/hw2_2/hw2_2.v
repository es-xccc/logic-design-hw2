`timescale 1 ns/1 ns

module hw2_2(clk, reset, data_in, c, data_out);
input clk, reset;
input[7:0] data_in;
input[8:0] c;
output [7:0] data_out;
reg [7:0] r[0:3];
reg [7:0] src_a;
reg [7:0] src_b;
reg [7:0] dest;
assign data_out=r[3];

always@(negedge reset)begin
    r[0]=8'h00;
    r[1]=8'h00;
    r[2]=8'h00;
    r[3]=8'h00;
end

always@(posedge clk)begin

case(c[4:3])
    2'b00:
        src_a=r[0];
    2'b01:
        src_a=r[1];
    2'b10:
        src_a=r[2];
    2'b11:
        src_a=data_in;
endcase

case(c[6:5])
    2'b00:
        src_b=r[0];
    2'b01:
        src_b=r[1];
    2'b10:
        src_b=r[2];
    2'b11:
        src_b=data_in;
endcase

case(c[2:0])
    3'b000:
        dest=src_a;
    3'b001:
        dest=src_a+src_b;
    3'b010:
        dest=src_a-src_b;
    3'b011:
        dest=src_a&src_b;
    3'b100:
        dest=src_a|src_b;
    3'b101:
        dest=src_a^src_b;
endcase

case(c[8:7])
    2'b00:
        r[0]=dest;
    2'b01:
        r[1]=dest;
    2'b10:
        r[2]=dest;
    2'b11:
        r[3]=dest;
endcase
end
endmodule