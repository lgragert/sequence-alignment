#!bin/bash

curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.7.1+-x64-macosx.tar.gz

tar xzf ncbi-*.tar.gz
cd ncbi-blast-2.7.1+

cd bin
mkdir /usr/local/ncbi/blast/bin/
chmod 777 /usr/local/ncbi/blast/bin/*
cp * /usr/local/ncbi/blast/bin/
echo 'export PATH="/usr/local/ncbi/blast/bin:$PATH"' >> ~./bash_profile
cd ..

mkdir blastdb
cd blastdb

curl -O ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.protein.faa.gz
gunzip *.gz

makeblastdb -in viral.1.protein.faa -dbtype prot
