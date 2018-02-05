#!bin/bash

# Make sure you are in working directory

#Download HMMER
curl -OL http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-cygwin64.tar.gz

# Install GCC compiler and make
apt-cyg install gcc-core
apt-cyg install make

#unpack
tar xvf hmmer-3.1b2-cygwin64.tar.gz
cd hmmer-3.1b2-cygwin64

# Compile the software with configure and make - Installs in /usr/local/bin/
./configure --prefix /usr/local
make
make install

# go back up to working directory
cd ..
