#!/bin/bash

# BLAST Installation and Database Setup for MacOS
# Uses Homebrew for installation (no sudo required)

# Make sure you've downloaded all scripts from Canvas to a working directory
# before running this script.

# Or Clone the sequence-alignment repository using git
# "git clone https://github.com/lgragert/sequence-alignment.git"

# This script can be run with "bash blast_setup_mac.sh" in terminal

# Install BLAST using Homebrew
brew install blast

# Make a directory to store the BLAST database
mkdir -p blastdb
cd blastdb

# Downloads viral protein FASTA file
curl -O https://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.protein.faa.gz
gunzip -f viral.1.protein.faa.gz

# Creates BLAST database from viral protein FASTA file
# Should make .phr, .pin, and .psq files if successful
makeblastdb -in viral.1.protein.faa -dbtype prot

cd ..
echo "BLAST installation complete. Run 'blastp -version' to verify."
