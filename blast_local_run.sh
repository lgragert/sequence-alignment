#!/bin/bash

blastp -query ARC_protein_sequence.fasta -db ./blastdb/viral.1.protein.faa  >./BLAST_ARC_output.txt
