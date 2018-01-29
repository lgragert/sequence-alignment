# sequence-alignment
Sequence Alignment Scripts for Bioinformatics Course



1 	Open terminal and change working directory to current

2 	chmod 775 *.sh

3 	bash blast_setup_mac.sh (for MAC) or bash blast_setup_windows.sh (for Windows)

4 	move ARC_protein_sequence.fasta, biopython_blast.py, blast_local_run.sh, blast_output_parser.py to ncbi-blast-2.7.1+/blastdb directory

5 	Change current directory to blastdb to run the commands on terminal

6 	bash blast_local_run.sh (Runs NCBI local blast of ARC protein sequence and Viral proteome to give blast output as out.txt)

7 	python3 biopython_blast.py (Runs NCBI BLAST use BioPython querying ARC protein sequence against viral proteome database to give blast output as blast_output.xml)

8 	python3 blast_output_parser.py (parses the XML file and gets the output in BLAST_results.csv)

