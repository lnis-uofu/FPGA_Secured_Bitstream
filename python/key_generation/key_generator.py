import random
import os

def key_generator(size):

    key = ""

    for x in range(size):
        key += str(random.randint(0,1))

    if(size == 128):
        f = open("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/key_128.txt", "w")
        #f = open("~/SecuredBitstream/modules/pmu/testbench/textfiles/key_128.txt", "w")
        f.write(key)
        f.close()
    elif(size == 256):
        f = open("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/key_256.txt", "w")
        f.write(key)
        f.close()

if __name__== "__main__":
    import argparse
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    ap.add_argument("size" , type=int, help="AES key size")
    args = ap.parse_args()
    key_generator(args.size)

