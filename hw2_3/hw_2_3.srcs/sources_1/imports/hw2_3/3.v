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
    
always @(posedge areset)begin
    aaah<=0;
    walk_left<=1;
    walk_right<=0;
end

always @(areset, turn_left, turn_right)begin
    state[1]=walk_left;
    state[0]=walk_right;
end

always @(posedge clk)begin
    if(areset==0)begin
        if(ground==0)begin
            aaah<=1;
            walk_left<=0;
            walk_right<=0;
        end
        else if(turn_left==1 && turn_right==1)begin
            if(walk_left==1)begin
                aaah<=0;
                walk_left<=0;
                walk_right<=1;
            end
            else if(walk_right==1)begin
                aaah<=0;
                walk_left<=1;
                walk_right<=0;
            end
        end
        else if(turn_left==1)begin
            aaah<=0;
            walk_left<=1;
            walk_right<=0;
        end
        else if(turn_right==1)begin
            aaah<=0;
            walk_left<=0;
            walk_right<=1;
        end
        else begin
            aaah<=0;
            walk_left<=state[1];
            walk_right<=state[0];
        end
    end
end
endmodule