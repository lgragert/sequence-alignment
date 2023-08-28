#!/bin/bash

# Make sure you are in working directory with scripts

#Download HMMER
curl -OL http://eddylab.org/software/hmmer/hmmer-3.3.2.tar.gz

# Install GCC compiler and make
apt-cyg install gcc-core
apt-cyg install make

# unpack
tar zvf hmmer-3.3.2.tar.gz
cd hmmer-3.3.2

# Compile the software with configure and make - Installs in /usr/local/bin/
./configure --prefix /usr/local
make
make install

# go back up to working directory
cd ..
