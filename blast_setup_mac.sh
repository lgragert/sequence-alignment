
# If you have not installed blast through brew, then remove the "#" from first three commands 



#curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.7.1+-x64-macosx.tar.gz

#tar xzf ncbi-*.tar.gz
#cd ncbi-blast-2.7.1+

mkdir blastdb
cd blastdb

curl -O ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.protein.faa.gz
gunzip *.gz

makeblastdb -in viral.1.protein.faa -dbtype prot

