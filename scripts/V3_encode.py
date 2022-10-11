
from aes import *
import random
from sha256 import *
import os

INPUT_DIR  = os.environ.get("ENCODE_INPUTS")


class Bitstream(object):

    def __init__(self, instruction, **kwargs):
        self.instruction = instruction
        self.output_file = os.environ.get("ENCODE_OUTPUT")
        self.bitstream   = ''
        self.bitstream_len = 0
        self.aes_key     = []
        self.sha_public_key = ''
        self.sha_digest  = ''
        self.sha_private_key = []
        self.header      = ''
        self.tdi         = ''
        self.tms         = ''
        self.tdi_header  = '001101100000'
        self.tdi_footer  = '00000'
        self.tms_header  = '011000000110'
        self.tms_footer  = '11111'

    # IMPORT ==================================================
    def get_bitstream(self):
        for line in open(f'{INPUT_DIR}/fabric_bitstream.bit'):
            li=line.strip()
            if not li.startswith("//"):
                self.bitstream = line.rstrip() + self.bitstream
        self.bitstream_len = len(self.bitstream)

    def get_aes_key(self):
        for line in open(f'{INPUT_DIR}/aes_key.txt'):
            temp = ''
            temp = line.rstrip()
        for i in range(4):
            self.aes_key.append(int(temp[(i*8):(i*8)+8], 16))

    def get_sha_private_key(self):
        for line in open(f'{INPUT_DIR}/sha_key.txt'):
            temp = ''
            temp = line.rstrip()
        for i in range(8):
            self.sha_private_key.append(int(temp[(i*8):(i*8)+8], 16))


    def parse_txt_files(self):
        self.get_bitstream()
        self.get_aes_key()
        self.get_sha_private_key()
    # IMPORT ==================================================


    # PREPARE =================================================
    def strip_key_hex_2_bin(self):
        self.aes_key = bin(self.aes_key[0])[2:].zfill(32) + bin(self.aes_key[1])[2:].zfill(32) + bin(self.aes_key[2])[2:].zfill(32) + bin(self.aes_key[3])[2:].zfill(32)

    def strip_digest(self, digest):
        strip_digest = ''
        for i in range(8):
            strip_digest += bin(digest[i])[2:].zfill(32)
        return strip_digest


    def load_key(self):
        self.header = '00000000000000000000000000000101'
        self.strip_key_hex_2_bin()
        self.tdi = self.tdi_footer + self.aes_key + self.header + self.tdi_header
        self.tms = self.tms_footer + ''.zfill(len(self.aes_key) + 32) + self.tms_header

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
        for i in range(96):
            self.sha_public_key += str(random.randint(0, 1))
        self.sha_public_key = self.sha_public_key + self.aes_key + self.header
        # Calculate digest
        for i in range(8):
            self.sha_private_key.append(int(self.sha_public_key[(i*8):(i*8)+8], 16))
        my_sha = SHA256(verbose=0)
        my_sha.init()
        my_sha.next(self.sha_private_key)
        my_digest = my_sha.get_digest()
        self.sha_digest = self.strip_digest(my_digest)
        self.tdi = self.tdi_footer + self.sha_digest + self.sha_public_key + self.tdi_header
        self.tms = self.tms_footer + ''.zfill(len(self.sha_digest + self.sha_public_key)) + self.tms_header

    def load_bitstream_sha(self):
        self.header = '0000000000' + bin(self.bitstream_len%128)[2:].zfill(7) + bin(self.bitstream_len//128)[2:].zfill(10) + '11001'
        for i in range(224):
            self.sha_public_key += str(random.randint(0, 1))
        self.sha_public_key = self.sha_public_key + self.header
        bitstream = [0] * ((self.bitstream_len//256) + 1)
        digest    = [0] * ((self.bitstream_len//256) + 2)
        self.bitstream = self.bitstream.zfill(256*((self.bitstream_len//256)+1))
        for i in range((self.bitstream_len//256) + 1):
            bitstream[i] = self.bitstream[(i*256):(i*256)+256]
        bitstream.append(self.sha_public_key)
        my_sha = SHA256(verbose=0)
        for i in range(len(bitstream)):
            my_sha.init()
            temp = []
            for j in range(8):
                temp.append(int(bitstream[i][(j*8):(j*8)+8], 2))
            my_sha.next(self.sha_private_key + temp)
            digest[i] = self.strip_digest(my_sha.get_digest())
        for i in range(len(bitstream)):
            self.tdi += digest[i] + bitstream[i]
        self.tms = ''.zfill(512*((self.bitstream_len//256)+2))
        self.tdi = self.tdi_footer + self.tdi + self.tdi_header
        self.tms = self.tms_footer + self.tms + self.tms_header

    def load_bitstream_aes(self):
        self.header = '0000000000' + bin(self.bitstream_len%128)[2:].zfill(7) + bin(self.bitstream_len//128)[2:].zfill(10) + '01101'
        bitstream = [0] * ((self.bitstream_len//128) + 1)
        result    = [0] * ((self.bitstream_len//128) + 1)
        self.bitstream = self.bitstream.zfill(128*((self.bitstream_len//128+1)))
        for i in range((self.bitstream_len//128)+1):
            bitstream[i] = self.bitstream[(i*128):((i*128)+128)]
        my_aes = AES()
        for i in range((self.bitstream_len//128)+1):
            bitstream[i] = (int(bitstream[i][0:32], 2), int(bitstream[i][32:64], 2), int(bitstream[i][64:96], 2), int(bitstream[i][96:128], 2))
            result[i] = my_aes.aes_encipher_block(self.aes_key, bitstream[i])
            result[i] = bin((result[i][0]))[2:].zfill(32) + bin((result[i][1]))[2:].zfill(32) + bin((result[i][2]))[2:].zfill(32) + bin((result[i][3]))[2:].zfill(32)
        for i in range((self.bitstream_len//128)+1):
            self.tdi += result[i]
        self.tdi += self.header
        self.tms = ''.zfill((128*((self.bitstream_len//128)+1)) + 32)
        self.tdi = self.tdi_footer + self.tdi + self.tdi_header
        self.tms = self.tms_footer + self.tms + self.tms_header

    def load_bitstream_sha_aes(self):
        self.header = '0000000000' + bin(self.bitstream_len%128)[2:].zfill(7) + bin(self.bitstream_len//128)[2:].zfill(10) + '11010'
        for i in range(224):
            self.sha_public_key += str(random.randint(0, 1))
        self.sha_public_key = self.sha_public_key + self.header
        sha_len = (self.bitstream_len//256) + 1
        self.bitstream = self.bitstream.zfill(sha_len*256)
        bitstream = [0] * (sha_len * 2)
        aes_result    = [0] * (sha_len * 2)
        my_aes = AES()
        for i in range(sha_len*2):
            bitstream[i] = self.bitstream[(i*128):((i*128)+128)]
        for i in range(sha_len*2):
            bitstream[i] = (int(bitstream[i][0:32], 2), int(bitstream[i][32:64], 2), int(bitstream[i][64:96], 2), int(bitstream[i][96:128], 2))
            aes_result[i] = my_aes.aes_encipher_block(self.aes_key, bitstream[i])
            aes_result[i] = bin((aes_result[i][0]))[2:].zfill(32) + bin((aes_result[i][1]))[2:].zfill(32) + bin((aes_result[i][2]))[2:].zfill(32) + bin((aes_result[i][3]))[2:].zfill(32)
        bitstream = [0] * sha_len
        for i in range(0, sha_len):
            bitstream[i] = aes_result[i*2] + aes_result[(i*2)+1]
        bitstream.append(self.sha_public_key)
        digest = [0] * len(bitstream)
        my_sha = SHA256()
        for i in range(len(bitstream)):
            my_sha.init()
            temp =[]
            for j in range(8):
                temp.append(int(bitstream[i][(j*32):(j*32)+32], 2))
            my_sha.next(self.sha_private_key + temp)
            digest[i] = self.strip_digest(my_sha.get_digest())
        for i in range(len(bitstream)):
            self.tdi += digest[i] + bitstream[i]
        self.tms = ''.zfill(512*len(bitstream))
        self.tdi = self.tdi_footer + self.tdi + self.tdi_header
        self.tms = self.tms_footer + self.tms + self.tms_header


    def prepare_bitstream(self):
        if(self.instruction == 'functional_load_key'):
            self.load_key()
        if(self.instruction == 'functional_load_bitstream'):
            self.load_bitstream()
        if(self.instruction == 'functional_push_bitstream'):
            self.push_bitstream()
        if(self.instruction == 'functional_load_key_sha'):
            self.load_key_sha()
        if(self.instruction == 'functional_load_bitstream_sha'):
            self.load_bitstream_sha()
        if(self.instruction == 'functional_load_bitstream_aes'):
            self.load_bitstream_aes()
        if(self.instruction == 'functional_load_bitstream_sha_aes'):
            self.load_bitstream_sha_aes()
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
    args = ap.parse_args()

    B = Bitstream(args.instruction)
    B.parse_txt_files()
    B.prepare_bitstream()
    B.export_bitstream()
    print("Bitstream JTAG encoded")

