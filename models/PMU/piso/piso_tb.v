








module piso_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg rst  = 1'b1;
    reg load = 1'b0;
    reg en   = 1'b0;
    reg [127:0] data_i = 0;

    piso uut
    (
    .clk                 (clk),
    .rst                 (rst),
    .load               (load),
    .en                   (en),
    .data_i           (data_i),
    .data_o                 ()
    );

    integer i;

    initial
    begin
        clk = 0;
        forever
            #halfperiod clk = ~clk;
    end


    initial 
    begin
        data_i = 128'habcdef0123456789abcdef0123456789; 
        #period;
        load = 1'b1;
        #period;
        load = 1'b0;
        #period;
        en   = 1'b1;
        
        for(i = 0; i < 128; i = i + 1)
        begin
            #period;
            if(i == 126)
            begin
                data_i = 128'h9876543210fedcba9876543210fedcba;
                load = 1'b1;
            end
        end
       
        load = 1'b0; 

        for(i = 0; i < 128; i = i + 1)
        begin
            #period;
            if(i == 127)
                en = 1'b0;
        end

        #period;
        #period;
        $stop;
    end




endmodule

