def xor_2(str0, str1):
    result = ''
    for i in range(len(str0)):
        temp = int(str0[i]) ^ int(str1[i])
        if(temp):
            result += '1'
        else:
            result += '0'

    return result

def crc_8_encoder(data_in, minpoly):
    padding = '00000000'
    data_in = padding + data_in
    reg = '00000000'
    residual = ''
    for i in range(len(data_in) - 1, -1, -1):
        if(reg[0] == '0'):
            reg = reg[1:8] + data_in[i]
        else:
            reg = reg[1:8] + data_in[i]
            temp = xor_2(minpoly, reg)
            reg = temp
    #feverse the bits
    for i in range(8):
        residual = reg[i] + residual

    return residual
# 64 data bits + 8 zeros to obtain residual





def bitstream_encoder(packet_size, file_input, file_output):

    minpoly = '11101011' # X^8 + X^7 + X^6 + X^5 + X^3 + X + 1
    f = open(file_output, "w")
    # ----------------------------------------------------------------
    # Take the bitstream file and make n array elemets
    # each a string size of 'packet_size'
    count   = 0
    packets = 0
    data    = ''
    for line in open(file_input):
        li=line.strip()
        if not li.startswith("//"):
            data = line.rstrip() + data
            count += 1

    # Write Goldenspec to output file
    f.write(data + '\n')

    data_copy = data
    packets = (count // packet_size) + 1
    fill_amt = (packets * packet_size) - count
    print("fill_amt ", fill_amt)
    for i in range(fill_amt):
        data = '0' + data
    array = [0] * packets
    for i in range(packets):
        array[i] = data[i*packet_size:(i*packet_size) + packet_size]

    for i in range(len(array)):
        print(i, ' ', array[i], ' ', len(array[i]))

    # -----------------------------------------------------------------
    #
    #
    # -----------------------------------------------------------------
    # Form header and append it to array
    print(packets)
    print(fill_amt)
    header = str(bin(packet_size - (fill_amt))[2:].zfill(32)) + str(bin(packets + 2)[2:].zfill(32))

    array.append(header)

    # -----------------------------------------------------------------
    #
    #
    # -----------------------------------------------------------------
    # Evaluate CRC key and append to end of each packet

    array_encoded = [0] * len(array)
    for i in range(len(array)):
        residual = crc_8_encoder(array[i], minpoly) + array[i]
        array_encoded[i] = residual


    # -----------------------------------------------------------------
    #
    #
    # -----------------------------------------------------------------
    # Reconstruct string and write to file
    data_out = ''
    for i in range(len(array_encoded)):
        data_out = data_out + array_encoded[i]


    # Generate tdi signal
    #instruction = '11010'  # without CRC
    instruction = '11011'   # with CRC
    # pad instruction
    instruction = '0' + instruction + '00000'
    tdi_footer = '00000'

    #print(data_out)
    print(' ')
    tdi = tdi_footer + data_out + instruction
    #print(tdi)

    # Generatae tms signal
    tms = ''
    for i in range(len(array_encoded) * 72):
        tms += '0'

    tms_header = '11000000110'
    tms_footer = '11111'

    tms = tms_footer + tms + tms_header


    print(' ')
    print(tdi)


    # + 16 FPR JTAG
    print("bitstream length = ", len(tms))
    f.write(tdi + '\n')
    f.write(tms + '\n')

    #changing one bit from 1 to 0
    temp_tdi = list(tdi)
    temp_tdi[75] = '0'
    tdi = "".join(temp_tdi)

    f.write(tdi + '\n')
    f.write(tms + '\n')


    # Write a new line for a bitstream without
    # CRC

    instruction = '11010'
    instruction = '0' + instruction + '00000'
    tdi = tdi_footer + data_copy + header + instruction

    # Generatae tms signal
    tms = ''
    for i in range(len(data_copy) + 64):
        tms += '0'
    tms_header = '11000000110'

    tms = tms_footer + tms + tms_header

    print(len(tdi))
    print(len(tms))

    f.write(tdi + '\n')
    f.write(tms)
    print(len(tms))







    f.close()

if __name__=="__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    ap.add_argument("packet_size", type=int)
    ap.add_argument("file_input",  type=str)
    ap.add_argument("file_output", type=str)

    args = ap.parse_args()
    bitstream_encoder(args.packet_size, args.file_input, args.file_output)
