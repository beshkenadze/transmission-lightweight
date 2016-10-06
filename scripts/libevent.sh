#!/bin/sh
SCRIPTPATH='/usr'
wget -c "https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz" && \
tar xvfz libevent-2.0.22-stable.tar.gz  && \
cd libevent-2.0.22-stable  && \
./configure --prefix="$SCRIPTPATH"  && \
make && \
make install && \
# Where are those libevent libraries?
echo /usr/lib > /etc/ld.so.conf.d/libevent-i386.conf && \
echo /usr/lib > /etc/ld.so.conf.d/libevent-x86_64.conf