#!/usr/bin/env bash

SOURCE=$(find . -type f ! -path './test/*' -name "*.c")
HEADER="-I. -I../libprinthex"
LIBS="-L../libprinthex -lprinthex -lz -lWs2_32 -liconv"
CC=gcc

for c in $SOURCE ;
do    
    echo -e "\e[1;34mCompiling $c …\e[0m"
    ( set -x ; $CC -DxDEBUG -g -Wno-multichar --std=gnu99 $HEADER -O2 -g -c -o "${c%.*}.o" $c )
done


OBJECTS=$(find . -type f ! -path './test/*' -name "*.o")

( set -x ; $CC -o id3edit $OBJECTS $LIBS )

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4

