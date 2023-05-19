module hw2_3(
    input clk,
    input areset, 
    input turn_left,
    input turn_right,
    input ground,
    output reg walk_left,
    output reg walk_right,
    output reg aaah );
    reg [1:0]state,next;
    
always @(posedge clk, posedge areset)begin

end

endmodule