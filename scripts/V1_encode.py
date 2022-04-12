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
    packets = (count // packet_size) + 1
    fill_amt = (packets * packet_size) - count
    for i in range(fill_amt + 1):
        data = '0' + data
    array = [0] * packets
    for i in range(packets):
        array[i] = data[i*packet_size:i*packet_size + packet_size]

    # -----------------------------------------------------------------
    #
    #
    # -----------------------------------------------------------------
    # Form header and append it to array
    header = str(bin(packet_size)[2:].zfill(32)) + str(bin(packets + 1)[2:].zfill(32))

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
    f = open(file_output, "w")
    f.write(data_out)
    f.close()

if __name__=="__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    ap.add_argument("packet_size", type=int)
    ap.add_argument("file_input",  type=str)
    ap.add_argument("file_output", type=str)

    args = ap.parse_args()
    bitstream_encoder(args.packet_size, args.file_input, args.file_output)
