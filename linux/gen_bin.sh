#!/bin/bash

gen_fileName=test.bin
# Whether to specify a file name
if [ $# -eq 1 ]; then
    gen_fileName=$1
else
    echo usage: $0 $gen_fileName
fi

# generate bin
echo -ne '\x55\x8B\xEC\x83\xEC\x64\x53\x56' >  $gen_fileName
echo -ne '\x57\x8D\x7D\x9C\xB9\x19\x00\x00' >> $gen_fileName
echo -ne '\x00\xB8\xCC\xCC\xCC\xCC\xF3\xAB' >> $gen_fileName
echo -ne '\xC6\x45\xFC\x0A\x66\xC7\x45\xF8' >> $gen_fileName

echo check: xxd -a -u -g 1 -l 128 $gen_fileName
