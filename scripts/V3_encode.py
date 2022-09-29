
from aes import *

#AES instructions
# 4:0   instruction
# 14:5  packets
# 22:15 overflow
# 31:23 empty

def data_2_aes(data):
    return f'(0x{hex(int(data[0:32], 2))[2:].zfill(8)}, 0x{hex(int(data[33:64]))[2:].zfill(8)}, 0x{hex(int(data[65:96]))[2:].zfill(8)}, 0x{hex(int(data[97:128]))[2:].zfill(8)})'

def aes_2_data(data):
    return f'{bin(data[0])[2:].zfill(32)}{bin(data[0])[2:].zfill(32)}{bin(data[0])[2:].zfill(32)}{bin(data[0])[2:].zfill(32)}'


def bitstream_encoder():

    nist_aes128_key = (0x2b7e1516, 0x28aed2a6, 0xabf71588, 0x09cf4f3c)
    nist_plaintext0 = (0x6bc1bee2, 0x2e409f96, 0xe93d7e11, 0x7393172a)
    nist_exp128_0   = (0x3ad77bb4, 0x0d7a3660, 0xa89ecaf3, 0x2466ef97)

    my_aes = AES()
    #result = my_aes.aes_encipher_block(nist_aes128_key, nist_plaintext0)
    #block = aes_decipher_block(nist_aes128_key, nist_plaintext0)

    #print(hex(result[0]))

    # ----------------------------------------------------------------
    # Take the bitstream file and make n array elemets
    # each a string size of 'packet_size'
    #count   = 0
    #packets = 0
    #data    = ''
    #for line in open('./fabric_bitstream.bit'):
    #    li=line.strip()
    #    if not li.startswith("//"):
    #        data = line.rstrip() + data
    #        count += 1

    #data = data.zfill(16*128)

    ##print(data, '\n')

    #data_array = [''] * 16

    #for i in range(0, 16):
    #    data_array[i] = str(data[(i*128):((i*128) + 128)])

    #print(data_2_aes(data_array[1]))
    # print(data_array[0])
    # print(data_array[1])



    #tdi_header = '001101100000'
    #tms_header = '011000000110'
    #tdi_footer = '00000'
    #tms_footer = '11111'

    # header = 0x001701ed

    # header_bin = bin(header)[2:].zfill(32)

    # print(header_bin)



    #bitstream = data + header_bin
    #tms_fill  = str(''.zfill(len(bitstream))
    ##print(bitstream)

    #tdi = tdi_footer + bitstream + tdi_header
    #tms = tms_footer + tms_fill  + tms_header

    ## print(tdi
    ## print(tms)


    #f = open('./bitstream/load_bitstream.txt', "w")


    #f.write(tdi + '\n')
    #f.write(tms)

    #f.close()



    ## # Write Goldenspec to output file
    ## f.write(data + '\n')

    #data_copy = data
    #packets = (count // packet_size) + 1
    #fill_amt = (packets * packet_size) - count
    #print("fill_amt ", fill_amt)
    #for i in range(fill_amt):
    #    data = '0' + data
    #array = [0] * packets
    #for i in range(packets):
    #    array[i] = data[i*packet_size:(i*packet_size) + packet_size]

    #for i in range(len(array)):
    #    print(i, ' ', array[i], ' ', len(array[i]))

    ## -----------------------------------------------------------------
    ##
    ##
    ## -----------------------------------------------------------------
    ## Form header and append it to array
    #print(packets)
    #print(fill_amt)
    #header = str(bin(packet_size - (fill_amt))[2:].zfill(32)) + str(bin(packets + 2)[2:].zfill(32))

    #array.append(header)

    ## -----------------------------------------------------------------
    ##
    ##
    ## -----------------------------------------------------------------
    ## Evaluate CRC key and append to end of each packet

    #array_encoded = [0] * len(array)
    #for i in range(len(array)):
    #    residual = crc_8_encoder(array[i], minpoly) + array[i]
    #    array_encoded[i] = residual


class Bitstream(object):

    def __init__(self, instruction, output_file, **kwargs):
        #self.instruction_dictonary = {'00101': 'load_key'}
        self.instruction = instruction
        self.output_file = output_file
        self.bitstream   = ''
        self.bitstream_len = 0
        self.key         = ''
        self.header      = ''
        self.tdi         = ''
        self.tms         = ''
        self.tdi_header  = '001101100000'
        self.tdi_footer  = '00000'
        self.tms_header  = '011000000110'
        self.tms_footer  = '11111'

    # IMPORT ==================================================
    def get_bitstream(self):
        for line in open('./fabric_bitstream.bit'):
            li=line.strip()
            if not li.startswith("//"):
                self.bitstream = line.rstrip() + self.bitstream
        self.bitstream_len = len(self.bitstream)

    def get_key(self):
        for line in open('./key.txt'):
            li = line.strip()
            self.key = line.rstrip()
            self.key = f'(0x{self.key[0:8]}), (0x{self.key[9:17]}), (0x{self.key[18:26]}), (0x{self.key[27:35]})'

    def parse_txt_files(self):
        self.get_bitstream()
        self.get_key()
    # IMPORT ==================================================


    # PREPARE =================================================
    def strip_key_hex_2_bin(self):
        self.key = self.key[3:11] + self.key[17:25] + self.key[31:39] + self.key[45:53]
        self.key = bin(int(self.key, 16))[2:].zfill(128)

    def load_key(self):
        self.header = '00000000000000000000000000000101'
        self.strip_key_hex_2_bin()
        self.tdi = self.tdi_footer + self.key + self.header + self.tdi_header
        self.tms = self.tms_footer + ''.zfill(len(self.key) + 32) + self.tms_header

    def load_bitstream(self):
        self.header = '00000000000000000000000000000111'
        self.tdi = self.tdi_footer + self.bitstream + self.header + self.tdi_header
        self.tms = self.tms_footer + ''.zfill(self.bitstream_len + 32) + self.tms_header

    def push_bitstream(self):
        self.header = '00000000000000000000000000010111'
        self .tdi = self.tdi_footer + ''.zfill(self.bitstream_len) + self.tdi_header
        self .tms = self.tms_footer + ''.zfill(self.bitstream_len) + self.tms_header

    def load_key_sha(self):
        self.header = '00000000000000000000000000000110'
        self.strip_key_hex_2_bin()



    def prepare_bitstream(self):
        if(self.instruction == '00101'):
            self.load_key()
        if(self.instruction == '00111'):
            self.load_bitstream()
        if(self.instruction == '10111'):
            self.push_bitstream()
        if(self.instruction == '00110'):
            self.load_key_sha()
    # PREPARE =================================================

    # EXPORT ==================================================
    def export_bitstream(self):
        f = open(self.output_file, "w")
        f.write(self.tdi + '\n')
        f.write(self.tms)
        f.close()
    # EXPORT ==================================================

if __name__=="__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    ap.add_argument("instruction", type=str)
    ap.add_argument("output_file", type=str)
    args = ap.parse_args()

    B = Bitstream(args.instruction, args.output_file)
    B.parse_txt_files()
    B.prepare_bitstream()
    B.export_bitstream()

