
#creates an instruction header for bitstreams

def header_generator(file_in, size, instruction, file_out):
    f = open(file_in, "r")
    bitstream = str(f.read())
    f.close()
    bitstream = bitstream.strip()

    header = ""
    bin_size = bin(size)[2:].zfill(28)
    header = str(bin_size) + instruction


    bitstream += header

    f = open(file_out, 'w')
    f.write(bitstream)
    f.close()

if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser(description=__doc__,formatter_class=argparse.RawTextHelpFormatter)
    ap.add_argument("file_in"          , type=str , help="file that the header will be appended to")
    ap.add_argument("bitstream_size", type=int , help="size of the bitstream 128bits - 1048578bits")
    ap.add_argument("instruction"   , type=str , help="type of bitstream data")
    ap.add_argument("file_out"      , type=str , help="file to write data + header to")
    args = ap.parse_args()
    header_generator(args.file_in, args.bitstream_size, args.instruction, args.file_out)
