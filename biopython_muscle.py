#!/usr/bin/env python3

import os
import Bio

from Bio.Align.Applications import MuscleCommandline

mus = "muscle"

in_file = "MSA_sequences_file.fasta"

out_file = "MSA_muscle_output.txt"

cline = MuscleCommandline(mus, input=in_file, out=out_file)
print(cline)
stdout, stderr = cline()
