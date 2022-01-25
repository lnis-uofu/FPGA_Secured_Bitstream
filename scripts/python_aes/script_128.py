from AESfunctions import KeyExpansion, AES_Encrypt, AES_Decrypt
import numpy as np

# Nb = 4 columns in state (in this standard)
Nb = 4  # columns


# AES can use 128, 192, or 256 bit cipher keys
#             16,  24,  or 32 byte cipher keys
#             Nk = 4, 6 or 8 [32-bit words] columns in cipher key
#             Nr = max(Nb, Nk)+6 = 10, 12 or 14 round

Nk = 4  # 4 or 6 or 8 [32-bit words] columns in cipher key
rows = 4
stt_lng = Nb * rows  # state length
CipherKeyLenghth = Nk * rows
Nr = max(Nb, Nk) + 6  # = 10, 12 or 14 rounds


# Create a dummy test cipher key
key_hex = [0] * CipherKeyLenghth
inv_key = [0] * CipherKeyLenghth

f = open("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/key_128.txt", "r")
key = str(f.read())
f.close()

for i in range(CipherKeyLenghth):
    temp = key[i*2] + key[i*2+1]
    key_hex[i] = int(temp, 16)

# Expand key
expandedKey = KeyExpansion(key_hex, Nk)

inv_key = expandedKey[len(expandedKey)-CipherKeyLenghth:len(expandedKey)]

inv_key_str = ""
for i in inv_key:
    inv_key_str += hex(i)[2:].zfill(2)

inv_key = ""
inv_key = bin(int(inv_key_str, 16))[2:].zfill(128)

f = open("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/inv_key.txt", "w")
f.write(inv_key)
f.close()

f = open("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/bitstream.txt", "r")
message = str(f.read())
f.close()


byte = 8

temp_message = [0] * int(len(message)/byte)
for index in range(len(temp_message)):
    temp_message[index] = int(message[index*byte:(index*byte)+byte], 2)


encrypted_list =AES_Encrypt(temp_message, expandedKey, Nr)
encrypted_str = ""
for index in range(len(encrypted_list)):
    encrypted_str += bin(encrypted_list[index])[2:].zfill(8)



f = open("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encrypted_bitstream.txt", "w")
f.write(encrypted_str)
f.close()
