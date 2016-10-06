#!/bin/sh
SCRIPTPATH='/usr'
wget -c https://github.com/transmission/transmission-releases/raw/master/transmission-2.92.tar.xz && \
tar xvfJ transmission-2.92.tar.xz && \
cd transmission-2.92 && \
./configure --prefix="$SCRIPTPATH" --without-gtk  --disable-cli --disable-mac --enable-utp --disable-nls --enable-lightweight --enable-daemon && \
make && \
make install