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
    reg [1:0]temp;

always @(posedge clk, posedge areset)begin
    if(areset==1)begin
        walk_left<=1;
        walk_right<=0;
        aaah=0;
        temp[1]<=walk_left;
        temp[0]<=walk_right;
    end
    else if(ground==0)begin
        walk_left<=0;
        walk_right<=0;
        aaah=1;
    end
    else if(turn_left==1 && turn_right==1)begin
        temp[1]<=walk_right;
        temp[0]<=walk_left;
        walk_left<=walk_right;
        walk_right<=walk_left;
        aaah<=0;
    end
    else if(turn_left==1)begin
        walk_left<=1;
        walk_right<=0;
        aaah<=0;
        temp[1]<=walk_left;
        temp[0]<=walk_right;
    end
    else if(turn_right==1)begin
        walk_left<=0;
        walk_right<=1;
        aaah<=0;
        temp[1]<=walk_left;
        temp[0]<=walk_right;
    end
    else begin
        walk_left<=temp[1];
        walk_right<=temp[0];
        aaah<=0;
    end
end
endmodule