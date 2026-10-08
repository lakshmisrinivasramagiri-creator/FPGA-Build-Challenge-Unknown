`timescale 1ns/1ps

module tb_Conveyor_Inspection;

    reg [3:0] sensor;

    wire object_detected;
    wire normal_led;
    wire defective_led;
    wire alarm_led;

    Conveyor_Inspection uut (
        .sensor(sensor),
        .object_detected(object_detected),
        .normal_led(normal_led),
        .defective_led(defective_led),
        .alarm_led(alarm_led)
    );

    initial begin

        // No object
        sensor = 4'b0000;
        #10;

        // Object detected - defective
        sensor = 4'b0001;
        #10;

        // Object detected - defective
        sensor = 4'b0011;
        #10;

        // Normal object: sensor = 0111
        sensor = 4'b0111;
        #10;

        // Defective object
        sensor = 4'b0101;
        #10;

        // Defective object
        sensor = 4'b0110;
        #10;

        // Defective object - sensor[3] active
        sensor = 4'b1111;
        #10;

        // No object
        sensor = 4'b0000;
        #10;

        $stop;
    end

endmodule