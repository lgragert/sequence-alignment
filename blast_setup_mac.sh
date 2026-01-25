#!/bin/bash

# BLAST Installation and Database Setup for MacOS
# Downloads BLAST and installs locally (no sudo required)

# NOTE: BLAST can be installed using Homebrew.
# However, brew install causes a collision with the proj:
#   Error: Cannot install blast because conflicting formulae are installed.
#   proj: because both install a `libproj.a` library

# Make sure you've downloaded all scripts from Canvas to a working directory
# before running this script.

# Or Clone the sequence-alignment repository using git
# "git clone https://github.com/lgragert/sequence-alignment.git"

# This script can be run with "bash blast_setup_mac.sh" in terminal

# Detect CPU architecture and download appropriate BLAST version
ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
    BLAST_ARCH="aarch64"
else
    BLAST_ARCH="x64"
fi

# Downloads BLAST Mac install - compressed using tar and gzip
curl -O "https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.17.0+-${BLAST_ARCH}-macosx.tar.gz"

# Uncompresses BLAST distribution to current directory
tar xzf "ncbi-blast-2.17.0+-${BLAST_ARCH}-macosx.tar.gz"

# Add BLAST binaries to PATH (local install - no sudo needed)
export PATH="$PWD/ncbi-blast-2.17.0+/bin:$PATH"

# Add to shell config for future sessions
echo "export PATH=\"$PWD/ncbi-blast-2.17.0+/bin:\$PATH\"" >> ~/.zshrc
echo "export PATH=\"$PWD/ncbi-blast-2.17.0+/bin:\$PATH\"" >> ~/.bash_profile

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
echo ""
echo "BLAST installation complete!"
echo "Run 'source ~/.zshrc' or restart terminal, then 'blastp -version' to verify."
