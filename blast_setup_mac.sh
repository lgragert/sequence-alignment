#!/bin/bash

# Make sure you've downloaded all scripts from Canvas to a working directory
# before running this script.

# Or Clone the sequence-alignment repository using git
# "git clone https://github.com/lgragert/sequence-alignment.git"

# This script can be run with "bash blast_setup_mac.sh" in terminal

# Can also run this by setting as an executable with the command
# "chmod +x blast_setup_mac.sh" followed by "./blast_setup_mac.sh"

# Permission denied error? - run script with "sudo bash blast_setup_mac.sh"

# Make sure there are no spaces in the directory names for the path

# Downloads BLAST Mac install - compressed using tar and gzip
curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.14.1+-x64-macosx.tar.gz

# Uncompresses BLAST distribution
tar xzf ncbi-blast-2.14.1+-x64-macosx.tar.gz
cd ncbi-blast-2.14.1+

# copies BLAST binaries to /usr/local/ and add directory to PATH
cd bin
mkdir -p /usr/local/ncbi/blast/bin/
cp * /usr/local/ncbi/blast/bin/ # may give error if files there already - ignore
export PATH=/usr/local/ncbi/blast/bin:$PATH # add path for session
echo 'export PATH="/usr/local/ncbi/blast/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
cd ../.. # go back to working directory

# Make a directory to store the BLAST database
mkdir blastdb
cd blastdb

# Downloads and uncompressed viral protein FASTA file - compressed with gzip
curl -O ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.protein.faa.gz
gunzip *.gz

# Creates BLAST database from viral protein FASTA file
# Should make .phr, .pin, and .psq files if successful
# Command will not work if there's a space in a directory name
makeblastdb -in viral.1.protein.faa -dbtype prot
