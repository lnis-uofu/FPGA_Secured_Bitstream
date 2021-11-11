
module scan_chain(pmu_tck_in, sc_data_in, sc_en, clear, sc_data_out );

input  pmu_tck_in, sc_data_in, sc_en, clear;
output sc_data_out;

//parameter SC_LENGTH = 10;

reg [9:0] data = 0;
    
always @ (posedge pmu_tck_in or posedge clear)
    begin
        if(clear)
            data = 10'b0000000000;
        else if (sc_en)
            begin
                data = {sc_data_in, data[9:1]};
            end
    end


    assign sc_data_out = data[0];
    
endmodule
