module functional_sha;

    localparam period     = 20;
    localparam halfperiod = 10;

  




    reg clk     = 1'b0;
    reg rst     = 1'b0;
    reg cs      = 1'b0;
    reg we      = 1'b0;
    reg wc      = 1'b1;

    reg [02:0] address    = 0;
    reg [31:0] write_data = 0;

    
    //reg [255:0] digest       =   256'he42c30a65a37f031fe920210a999325f84dc75c7ee90d4d2543cef1936d3fb36; //keep this
    //reg [255:0] public_key   =   256'h5448495349535448455055424c49434b4559464f52504d554245434155534521; //keep this
    //
    reg [255:0] digest       = 256'h4c4e49536c6e69734c4e49536c6e69734c4e49536c6e69734c4e49536c6e6973;


    reg [255:0] public_key   = 256'hff484953ff484953495354480123456789abcdef0123456789abcdef00000006;


    sha256 uut 
    (
    .clk(clk),
    .reset_n(rst),
        
    .cs(cs),
    .we(we),
    .wc(wc),

    .address(address),
    .write_data(write_data),
    .digest_valid()
    );


    integer i;

    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    //==================
    initial begin
    #period;
    rst = 1;
    #period;

    #(period * 32);
    write_data = public_key[031:000];
    address    = 3'b000;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = public_key[063:032];
    address    = 3'b001;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = public_key[095:064];
    address    = 3'b010;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = public_key[127:096];
    address    = 3'b011;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = public_key[159:128];
    address    = 3'b100;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = public_key[191:160];
    address    = 3'b101;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = public_key[223:192];
    address    = 3'b110;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = public_key[255:224];
    address    = 3'b111;
    #period;
    we = 1;
    #period;
    we = 0;
    cs = 1;
    #period;
    cs = 0;
    wc = 0;





    #(period * 30);
    write_data = digest[031:000];
    address    = 3'b000;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = digest[063:032];
    address    = 3'b001;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = digest[095:064];
    address    = 3'b010;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = digest[127:096];
    address    = 3'b011;
    #period;
    we = 1;
    #period;
    we = 0;
    $display("======================");
    $display("%h", uut.core.digest);
    #(period * 30);
    write_data = digest[159:128];
    address    = 3'b100;
    #period;
    we = 1;
    #period;
    we = 0;
   
    #(period * 30);
    write_data = digest[191:160];
    address    = 3'b101;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = digest[223:192];
    address    = 3'b110;
    #period;
    we = 1;
    #period;
    we = 0;

    #(period * 30);
    write_data = digest[255:224];
    address    = 3'b111;
    #period;
    we = 1;
    #period;
    we = 0;
    #(period * 30);
        //===================
    $stop;
    
    end
    
endmodule
