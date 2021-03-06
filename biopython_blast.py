#!/usr/bin/env python3

import os
import Bio
import Bio.Align.Applications

from Bio.Blast.Applications import NcbiblastpCommandline

file = "ARC_protein_sequence.fasta"
database = "./blastdb/viral.1.protein.faa"

blastp_cline = NcbiblastpCommandline(query=file, db=database, outfmt=5, out="BLAST_ARC_output.xml")
print(blastp_cline)
stdout, stderr = blastp_cline()
