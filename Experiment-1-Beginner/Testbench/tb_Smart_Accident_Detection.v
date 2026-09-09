`timescale 1ns/1ps

module tb_Smart_Accident_Detection;

    reg motion;
    reg impact;
    reg tilt;

    wire motion_led;
    wire impact_led;
    wire accident_led;

    Smart_Accident_Detection uut (
        .motion(motion),
        .impact(impact),
        .tilt(tilt),
        .motion_led(motion_led),
        .impact_led(impact_led),
        .accident_led(accident_led)
    );

    initial begin

        // Test 1: No motion, no impact, no tilt
        motion = 0;
        impact = 0;
        tilt = 0;
        #10;

        // Test 2: Motion detected
        motion = 1;
        impact = 0;
        tilt = 0;
        #10;

        // Test 3: Impact detected
        motion = 0;
        impact = 1;
        tilt = 0;
        #10;

        // Test 4: Impact + tilt = accident
        motion = 0;
        impact = 1;
        tilt = 1;
        #10;

        // Test 5: Motion + impact + tilt
        motion = 1;
        impact = 1;
        tilt = 1;
        #10;

        // Test 6: Impact + no tilt
        motion = 1;
        impact = 1;
        tilt = 0;
        #10;

        $stop;

    end

endmodule
