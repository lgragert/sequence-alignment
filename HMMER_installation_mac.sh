#!bin/bash


# Make sure you are in working directory 


#Downloads HMMER
curl -OL http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-macosx-intel.tar.gz

#unpack 
tar xvf hmmer-3.1b2-macosx-intel.tar.gz

cd hmmer-3.1b2-macosx-intel
# Compile the software with configure and make
./configure

make

### runs a test suite
make check

### installs the program in /usr/local/bin
make install