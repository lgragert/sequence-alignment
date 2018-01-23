# sequence-alignment
Sequence Alignment Scripts for Bioinformatics Course



1 Open terminal and change working directory to current

2 chmod 775 *sh

3 bash blast_setup.sh

4 move ARC_sequence.fasta, biopython_blast.py, blast_run.sh, blast_output_parser.py to ncbi-blast-2.7.1+/blastdb directory

5 bash blast_run.sh (Runs NCBI local blast of ARC protein sequence and Viral proteome to give blast output as out.txt)

6 python3 biopython_blast.py (Runs NCBI BLAST by bipython of ARC protein sequence and Viral proteome to give blast output as blast_output.xml)

7 python3 blast_output_parser.py (parses the XML file and gets the output in BLAST_results.csv)

