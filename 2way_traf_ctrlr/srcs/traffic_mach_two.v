module traffic_mach_two(

    output reg [2:0] lane_one_lights, lane_two_lights,
    input clk, rst_a
);
//    wire reset;
    wire[25:0] newclk;
    freqdiv f1(clk,rst_a,newclk);
    
    reg [2:0] state;
    reg [2:0] count_off, count_lane_one_green, count_lane_one_yellow, count_lane_two_green, count_lane_two_yellow;

    // Define states using parameters
    parameter [2:0] off=3'b100, lane_one_green=3'b000, lane_one_yellow=3'b001, lane_two_green=3'b010, lane_two_yellow=3'b011;

    // State transition and counting logic
    always @(posedge newclk[25] or posedge rst_a) begin
        if (rst_a) begin
            state <= off;
            count_off <= 3'b000;
            count_lane_one_green <= 3'b001;
            count_lane_one_yellow <= 3'b001;
            count_lane_two_green <= 3'b001;
            count_lane_two_yellow <= 3'b001;
        end else begin
            case (state)
                off: begin
                        state <= (count_off == 3'b001) ? lane_one_green : off;
                        count_off <= count_off + 3'b001;
                     end
                lane_one_green: begin
                                    state <= (count_lane_one_green == 3'b111) ? lane_one_yellow : lane_one_green;
                                    count_lane_one_green <= count_lane_one_green + 3'b001;
                                 end
                lane_one_yellow: begin
                                    state <= (count_lane_one_yellow == 3'b011) ? lane_two_green : lane_one_yellow;
                                    count_lane_one_yellow <= count_lane_one_yellow + 3'b001;
                                 end
                lane_two_green: begin
                                    state <= (count_lane_two_green == 3'b111) ? lane_two_yellow : lane_two_green;
                                    count_lane_two_green <= count_lane_two_green + 3'b001;
                                 end
                lane_two_yellow: begin
                                    state <= (count_lane_two_yellow == 3'b011) ? lane_one_green : lane_two_yellow;
                                    count_lane_two_yellow <= count_lane_two_yellow + 3'b001;
                                 end
            endcase
        end
    end

    // Output logic
    always @* begin
        case (state)
            off:
                begin
                    lane_one_lights = 3'b100;
                    lane_two_lights = 3'b100;
                end
            lane_one_green:
                begin
                    lane_one_lights = 3'b001;
                    lane_two_lights = 3'b100;
                end
            lane_one_yellow:
                begin
                    lane_one_lights = 3'b010;
                    lane_two_lights = 3'b100;
                end
            lane_two_green:
                begin
                    lane_one_lights = 3'b100;
                    lane_two_lights = 3'b001;
                end
            lane_two_yellow:
                begin
                    lane_one_lights = 3'b100;
                    lane_two_lights = 3'b010;
                end
        endcase
    end

endmodule
