import random


def xor_2(str0, str1):
    result = ''
    for i in range(8):
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
    for i in range(71, -1, -1):
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




# --- OpenFPGA.txt parser ---
# returns bitstream length, legth after encoding and array of data
def parse_txt():
    count = 0
    data = ''
    packets = 0
    for line in open("fabric_bitstream.txt"):
        li=line.strip()
        if not li.startswith("//"):
            #print(line.rstrip())
            data = line.rstrip() + data
            count += 1
        # fill the extra at the end to make even packets
    packets = (count // 64) + 1
    fill_amt = (packets * 64) - count
    for i in range(fill_amt + 1):
        data = str(random.randint(0,1)) + data

    array = [0] * packets
    for i in range(packets):
        array[i] = data[i*64:i*64 + 64]


    return count, packets, array
# --------------------------
#

count, array_len, array = parse_txt()
minpoly  = '11101011'

array_encoded = [0] * array_len


for i in range(len(array)):
    residual = crc_8_encoder(array[i], minpoly) + array[i]
    array_encoded[i] = residual


data_out = ''

bin_count    = format(count, "b").zfill(19)
en_bin_count = format(array_len*64, "b").zfill(19)

for i in range(len(array_encoded)):
    data_out = data_out + array_encoded[i]


data_out = data_out + (bin_count + en_bin_count)



print("length        ", count, " ", bin_count)
print("encoded length", array_len * 64, " ", en_bin_count)




f = open("bitstream.txt", "w")
f.write(data_out)
f.close()
