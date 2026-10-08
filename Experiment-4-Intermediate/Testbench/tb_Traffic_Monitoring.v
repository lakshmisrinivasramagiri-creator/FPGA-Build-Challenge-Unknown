`timescale 1ns/1ps

module tb_Traffic_Monitoring;

    reg [3:0] traffic_sensor;

    wire red_led;
    wire yellow_led;
    wire green_led;
    wire heavy_traffic;

    Traffic_Monitoring uut (
        .traffic_sensor(traffic_sensor),
        .red_led(red_led),
        .yellow_led(yellow_led),
        .green_led(green_led),
        .heavy_traffic(heavy_traffic)
    );

    initial begin

        // No traffic
        traffic_sensor = 4'b0000;
        #10;

        // Light traffic - one sensor active
        traffic_sensor = 4'b0001;
        #10;

        // Light traffic - another sensor
        traffic_sensor = 4'b0010;
        #10;

        // Two sensors active - heavy traffic
        traffic_sensor = 4'b0011;
        #10;

        // Two sensors active
        traffic_sensor = 4'b0101;
        #10;

        // Three sensors active
        traffic_sensor = 4'b0111;
        #10;

        // All sensors active
        traffic_sensor = 4'b1111;
        #10;

        // Back to no traffic
        traffic_sensor = 4'b0000;
        #10;

        $stop;
    end

endmodule