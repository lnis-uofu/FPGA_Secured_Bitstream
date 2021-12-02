module sipo_tb;

    reg clk = 1'b0;
    reg rst = 1'b1;
    reg en  = 1'b0;
    reg send= 1'b0;
    reg [3:0] instruction = 4'b00;
    reg data_i = 1'b0;
    reg [31:0] mem_data_i = 32'b0;
   
    reg [127:0] data = 128'h0123456789abcdef0123456789abcdef;
    
    localparam period      = 20;
    localparam halfperiod  = 10;


    sipo uut
    (
    .clk                     (clk),
    .rst                     (rst),
    .en                       (en),
    .send                   (send),
    .instruction     (instruction),
    .data_i               (data_i),
    .mem_data_i       (mem_data_i),
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

    integer i;
    
    initial 
    begin

    // PC to scanchain
    rst = 1'b0;
    #period;
    rst = 1'b1;    
    instruction = 2'b00;
    #period;
    en = 1'b1;
    for(i = 0; i < 130; i = i + 1)
    begin
        if(i < 127) 
        begin
            data_i = data[i];
            #period; 
        end
    end       
    send = 1'b1;
    #period;
    send = 1'b0;
    #period;
    instruction = 2'b01;
    #period;


    // PC to Mem
    for(i = 0; i < 130; i = i + 1)
    begin
        if(i < 127)
        begin
            data_i = data[i];
            #period;
        end
    end

    send = 1'b1;
    #period;
    send = 1'b0;
    #period;
    instruction = 2'b10;
    #period;    
        
    // Memory to aes
    for(i = 0; i < 130; i = i + 1)
    begin
        if(i < 127)
        begin
            data_i = data[i];
            #period;
        end
    end

    send = 1'b1;
    #period;
    send = 1'b0;
    #period;
    instruction = 2'b11;
    #period;
        
    // Memory to AES
    for(i = 0; i < 130; i = i + 1)
    begin
        if(i < 127)
        begin
            data_i = data[i];
            #period;
        end
    end

    send = 1'b1;
    #period;
    send = 1'b0;
    #period;
    #period;
    #period;

    $stop;
    end

endmodule
