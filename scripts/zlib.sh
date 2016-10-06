#!/bin/sh
SCRIPTPATH='/usr'
wget -c "http://zlib.net/zlib-1.2.8.tar.gz" && \
tar xvfz zlib-1.2.8.tar.gz && \
cd zlib-1.2.8 && \
./configure --prefix="$SCRIPTPATH" && \
make  && \
make install