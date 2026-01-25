#!/usr/bin/env python3

import os
import subprocess

# MUSCLE 5 has a different command line interface than MUSCLE 3.8
# MUSCLE 5 uses: muscle -align input.fasta -output output.fasta
# BioPython's MuscleCommandline wrapper is designed for MUSCLE 3.8

in_file = "MSA_sequences_file.fasta"
out_file = "MSA_muscle_output.txt"

# Run MUSCLE 5 using subprocess
cmd = ["muscle", "-align", in_file, "-output", out_file]
print(" ".join(cmd))
result = subprocess.run(cmd, capture_output=True, text=True)
if result.returncode != 0:
    print(f"Error: {result.stderr}")
else:
    print(f"Alignment saved to {out_file}")
