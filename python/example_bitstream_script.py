import numpy as np

KiB = 1024
#MiB = 1048576


def bitstream_generator(size):
    hexi = "0123456789abcdef0123456789abcdef"
    bina = bin(int(hexi, 16))[2:]

    bina = bina.zfill(128)


    bitstream = ""
    temp_size = int(size/128)
    for x in range(temp_size):
        bitstream = bitstream + bina


    #header = "00000400" #HEX header
    header = bin(size)[2:]
    header = header.zfill(28)
    instruction = "0"

    bitstream = bitstream + header + instruction

    f = open("../bitstream.txt", "w")
    f.write(bitstream)
    f.close()


if __name__== "__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    ap.add_argument('bitstream_size', type=int, help="size of the bitstream 128bits - 1048578bits (mod 128)")
    args = ap.parse_args()
    bitstream_generator(args.bitstream_size)
