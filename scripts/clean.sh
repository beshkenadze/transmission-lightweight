#!/bin/sh
apt-get purge -y wget build-essential libssl-dev pkg-config && \
apt-get clean && \
rm -rf build && \
rm -rf libevent-* && \
rm -rf zlib-* && \
rm -rf OpenSSL_* && \
rm -rf transmission-*
rm -rf curl-*
rm -rf /var/lib/apt/lists/*