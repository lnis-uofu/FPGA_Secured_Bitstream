from AESfunctions import KeyExpansion, AES_Encrypt, AES_Decrypt

# Nb = 4 columns in state (in this standard)
Nb = 4  # columns


# AES can use 128, 192, or 256 bit cipher keys
#             16,  24,  or 32 byte cipher keys
#             Nk = 4, 6 or 8 [32-bit words] columns in cipher key
#             Nr = max(Nb, Nk)+6 = 10, 12 or 14 rounds
Nk = 4  # 4 or 6 or 8 [32-bit words] columns in cipher key
rows = 4
stt_lng = Nb * rows  # state length
CipherKeyLenghth = Nk * rows
Nr = max(Nb, Nk) + 6  # = 10, 12 or 14 rounds
#print("AES with Nb =", Nb, "columns, Nk =", Nk, "(32-bit) words i.e. CipherKeyLenghth =",
#      CipherKeyLenghth, "bytes (or", CipherKeyLenghth * 8, "bits), Nr =", Nr, "rounds \n")


# Create a dummy test cipher key
key = [0] * CipherKeyLenghth
for i in range(CipherKeyLenghth):
    key[i] = i

print("key: ", len(key), key)


# I added this part
# ---------------------------------------
print("\n")
key0 = ""
for items in key:
    key0 = key0 + "{0:02x}".format(items)
print("key:  0x", key0, "\n")
print(key0)
#----------------------------------------

# Expand key
expandedKey = KeyExpansion(key, Nk)
#print("expkey: ", len(expandedKey), expandedKey, "\n")
expandedKey_hex = [0] * len(expandedKey)
index = 0
for v in expandedKey:
    expandedKey_hex[index] = hex(v)
    index = index + 1
print("expkey HEX: ", len(expandedKey_hex), expandedKey_hex, "\n")



# Create a test input data (plaintext)
#message = "Hello, World! This text is an expensive, important secret."
message = "FPGA bitstream"
#print("message: ", len(message), message, "\n")
print("message: ", message, "\n")

# Pad message with spaces to be integer chunks of stt_lng bytes
if len(message) % stt_lng:
    message = message.ljust(len(message) + stt_lng - len(message) % stt_lng, chr(0))
#print("padded: ", len(message), message, "\n")


# Use ord to convert to number values, Unicode, ASCII-like
ord_message = [0] * len(message)
for i in range(len(message)):
    ord_message[i] = ord(message[i])
message = ord_message
#print("unicode: ", len(message), message, "\n")

# I added this part
# ------------------------------------------
message0 = ""
for items in message:
    message0 = message0 + "{0:02x}".format(items)
print("unicode :", message0, "\n")
#-------------------------------------------
# Ciphertext
encrypted_message = [0] * len(message)
index = 0
while(message):
    encrypted_message[index:index + stt_lng] = AES_Encrypt(message[:stt_lng], expandedKey, Nr)
    message = message[stt_lng:]
    index = index + stt_lng
#print("encrypted: ", len(encrypted_message), encrypted_message, "\n")
#encrypted_message_chr = "".join(chr(i) for i in encrypted_message)
#print("ecr chars: ", len(encrypted_message_chr), "\n")
#print(encrypted_message_chr, "\n")



encrypted0 = ""
for items in encrypted_message:
    encrypted0 = encrypted0 + "{0:02x}".format(items)

print("encrypted: ", encrypted0)
print(len(encrypted0))



encrypted_message_hex = [0] * len(encrypted_message)
index = 0
for v in encrypted_message:
    encrypted_message_hex[index] = hex(v)
    index = index + 1
#print("encrp HEX: ", len(encrypted_message_hex), encrypted_message_hex, "\n")


# Plaintext
decrypted_message = [0] * len(encrypted_message)
index = 0
while(encrypted_message):
    decrypted_message[index:index +
                      stt_lng] = AES_Decrypt(encrypted_message[:stt_lng], expandedKey, Nr)
    encrypted_message = encrypted_message[stt_lng:]
    index = index + stt_lng
print("decrypted: ", len(decrypted_message), decrypted_message)

decrypted_message_hex = [0] * len(decrypted_message)
index = 0
for v in decrypted_message:
    decrypted_message_hex[index] = hex(v)
    index = index + 1

print(decrypted_message_hex)

#rec_message = "".join(chr(i) for i in decrypted_message)
#print("dcr chars: ", len(rec_message), rec_message)




