#!/usr/bin/env python3

import os, Bio

from Bio.Align.Applications import TCoffeeCommandline

# Run BioPython wrapper for T-Coffee
tcoffee_cline = TCoffeeCommandline(infile="MSA_sequences_file.fasta", output="clustalw", outfile="tcoffee_MSA_output.aln")
print(tcoffee_cline)
stdout, stderr = tcoffee_cline()
