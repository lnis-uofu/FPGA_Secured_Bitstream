




module sipo_tb;

    reg clk = 1'b0;

    localparam period      = 20;
    localparam halfperiod  = 10;


    sipo uut
    (
    .clk                     (clk),
    .rst                        (),
    .en                         (),
    .send                       (),
    .instruction                (),
    .data_i                     (),
    .mem_data_i                 (),
    .aes_data_o                 (),
    .key_data_o                 (),
    .mem_data_o                 ()
    );


    initial
    begin
        clk = 0;
        forever
            #halfperiod clk = ~clk;
    end


    initial 
    begin

    







        $stop;
    end

endmodule
