module hw2_3_tb();
    reg clk = 0;
    reg areset = 0;
    reg turn_left = 0;
    reg turn_right = 0;
    reg ground = 0;
    wire walk_left, walk_right, aaah;
    
    hw2_3 test(.clk(clk), .areset(areset), .turn_left(turn_left), .turn_right(turn_right), 
                   .ground(ground), .walk_left(walk_left), .walk_right(walk_right), .aaah(aaah));
    
    always #5 clk = ~clk;
    
    initial begin
        areset = 1;
        ground = 1;
        #20 areset = 0;       
        turn_left = 0;
        turn_right = 0;
        #20;
        turn_right = 1;
        #20;
        turn_right = 0;
        #30;
        turn_left = 1;
        turn_right = 0;
        #50;
        turn_left = 0;
        #50;
        turn_right = 1;
        #20
        turn_left = 1;
        #10;
        turn_right = 0;
        #50;
        ground = 0;
        #30;
        
        $finish;
    end
endmodule
