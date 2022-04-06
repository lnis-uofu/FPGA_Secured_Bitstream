# checksum implementation:

packet_size =  64
byte        =   8


f = open("../modules/pmu/testbench/textfiles/bitstream_128.txt", "rb")
bitstream = f.read()
f.close()

# Sum the n byte sized chucks of packet_size
temp_sum = 0
for i in range(int(packet_size/byte)):
    temp = int(bitstream[i*byte:(i*byte)+byte], 2)
    temp_sum += temp
    print(temp)

# temp_sum int -> bin
bin_temp_sum = bin(temp_sum)[2:].zfill(16)

# split the summ and carry and add
carry = int(bin_temp_sum[:8], 2)
partial_sum = int(bin_temp_sum[8:], 2)
temp_sum = partial_sum + carry

# temp_sum int -> bin
bin_temp_sum = bin(temp_sum)[2:].zfill(8)
print(bin_temp_sum)
# invert to get checksum
checksum = ""
for i in range(byte):
    if(bin_temp_sum[i] == '1'):
        checksum += '0'
    else:
        checksum += '1'

print(checksum)





