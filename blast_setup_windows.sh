

curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.7.1+-x64-win64.tar.gz

tar xzf ncbi-*.tar.gz
cd ncbi-blast-2.7.1+
mkdir blastdb
cd blastdb

curl -O ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.protein.faa.gz
gunzip *.gz

# Add BLAST binaries to path
echo 'export PATH="/cygdrive/c/tools/cygwin/ncbi-blast-2.7.1+/bin:$PATH"' >> ~/.profile

makeblastdb -in viral.1.protein.faa -dbtype prot
