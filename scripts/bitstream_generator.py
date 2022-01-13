import random


def bitstream_generator(size, data_type):
    bitstream = ""
    packet    = ""
    temp_size = int(size/128)

    if(data_type == "zeros"):
        packet = "00000000000000000000000000000000"
        binary = bin(int(packet, 16))[2:]
        binary = binary.zfill(128)
        for x in range(temp_size):
            bitstream += binary

    elif(data_type == "ones"):
        packet = "ffffffffffffffffffffffffffffffff"
        binary = bin(int(packet, 16))[2:]
        binary = binary.zfill(128)
        for x in range(temp_size):
            bitstream += binary

    elif(data_type == "hex"):
        packet = "0123456789abcdef0123456789abcdef"
        binary = bin(int(packet, 16))[2:]
        binary = binary.zfill(128)
        for x in range(temp_size):
            bitstream += binary


    elif(data_type == "random"):
        for x in range(temp_size):
            packet = ""
            for i in range(128):
                packet += str(random.randint(0, 1))
            bitstream += packet



    f = open("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/bitstream.txt", "w")
    f.write(bitstream)
    f.close()


if __name__== "__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    ap.add_argument("bitstream_size", type=int, help="size of the bitstream 128bits - 1048578bits")
    ap.add_argument("data_type"     , type=str, help="type of bitstream data")
    args = ap.parse_args()
    bitstream_generator(args.bitstream_size, args.data_type)
