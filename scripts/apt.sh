#!/bin/sh
export DEBIAN_FRONTEND='noninteractive' && \
apt-get update -qq && \
apt-get install -y wget build-essential libssl-dev pkg-config