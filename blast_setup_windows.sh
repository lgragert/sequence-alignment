#!/bin/bash

# Make sure you've downloaded all scripts from Canvas to a working directory
# before running this script.
# This script can be run with "bash blast_setup_windows.sh" in Cygwin
# Can also run this by setting as an executable with the command
# "chmod +x blast_setup_windows.sh" followed by "./blast_setup_windows.sh"



# Install apt-cyg and curl using Cygwin Terminal (apt-cyg is package manager for Cygwin)
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin
apt-cyg install curl

# Downloads BLAST Windows install - compressed using tar and gzip
curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.10.1+-x64-win64.tar.gz

# Uncompresses BLAST distribution
tar xzf ncbi-*.tar.gz
cd ncbi-blast-2.10.1+

# copies BLAST binaries to /usr/local/ and add directory to PATH
cd bin
mkdir -p /usr/local/ncbi/blast/bin/
chmod 777 /usr/local/ncbi/blast/bin/* # make give error if no file there already
cp * /usr/local/ncbi/blast/bin/
PATH=/usr/local/ncbi/blast/bin:$PATH # add path for session
echo 'export PATH="/usr/local/ncbi/blast/bin:$PATH"' >> ~/.bash_profile
cd ../.. # go back to working directory

# Make a directory to store the BLAST database
mkdir blastdb
cd blastdb

# Downloads and uncompressed viral protein FASTA file - compressed with gzip
curl -O ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.protein.faa.gz
gunzip *.gz

# Creates BLAST database from viral protein FASTA file
# Should make .phr, .pin, and .psq files if successful
makeblastdb -in viral.1.protein.faa -dbtype prot

# Make aliases for Python3 for Python /usr/bin/env python3 header to work
PATH=/cygdrive/c/Python38:$PATH # add path for session
echo 'export PATH="/cygdrive/c/Python38:$PATH"' >> ~/.bash_profile
cp /cygdrive/c/Python38/python.exe /cygdrive/c/Python38/python3.exe

# install BioPython module using pip3
# Pip is the package manager for Python modules
# Conda is the package manager for Anaconda - Already have biopython with Anaconda
pip3 install biopython
