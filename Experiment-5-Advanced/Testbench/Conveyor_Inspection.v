module Conveyor_Inspection (
    input wire [3:0] sensor,
    output wire object_detected,
    output wire normal_led,
    output wire defective_led,
    output wire alarm_led
);

    assign object_detected = sensor[0];

    assign normal_led =
        sensor[0] &
        sensor[1] &
        sensor[2] &
        ~sensor[3];

    assign defective_led =
        sensor[0] &
        (~sensor[1] | ~sensor[2] | sensor[3]);

    assign alarm_led = defective_led;

endmodule