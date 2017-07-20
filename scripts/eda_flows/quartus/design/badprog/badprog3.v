module badprog3 (enable, clock, counter);

    input enable;
    input clock;
    output reg [7:0] counter;
    

    always @(posedge clock) begin
        if (enable) begin
            counter = counter + 1'b1;
        end
        else begin
            counter = 0;
        end
    end
    
endmodule
