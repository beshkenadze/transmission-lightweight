#!/bin/sh
SCRIPTPATH='/usr'
wget -c https://curl.haxx.se/download/curl-7.50.3.tar.gz
tar xvfz curl-7.50.3.tar.gz
cd curl-7.50.3
./configure --prefix="$SCRIPTPATH" --with-zlib="$SCRIPTPATH"
make
make install
cd ..