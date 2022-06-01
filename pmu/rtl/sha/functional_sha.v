module functional_sha;

    localparam period     = 20;
    localparam halfperiod = 10;

  




    reg clk = 1'b0;
    reg sha_rst = 1'b0;
    reg init    = 1'b0;
    reg next    = 1'b0;
    reg mode    = 1'b0;
    //reg [511:0] block = 512'habcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789;

    reg [255:0] sha_key      =   256'h4c4e49536c6e69734c4e49536c6e69734c4e49536c6e69734c4e49536c6e6973;
    reg [255:0] public_key   =   256'h5448495349535448455055424c49434b4559464f52504d554245434155534521;

    sha256_core uut 
    (
    .clk(clk),
    .reset_n(sha_rst),
    .init(init),
    .next(next),
    .mode(mode),
    .block({public_key, sha_key}),
    .ready(),
    .digest(),
    .digest_valid()
    );


    integer i;

    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    initial begin 
    #period;
    sha_rst = 1;
    #period;
    init = 1;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    //===================

    public_key   =   256'h5448495349535448455055424c49434b4559464f52504d554245434155534520;
                                                                                    //   1

    next = 1;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;

    $stop;
    
    end
    
endmodule
