
import os, Bio

from Bio.Align.Applications import TCoffeeCommandline

tcoffee_cline = TCoffeeCommandline(infile="MSA_sequences_file.fasta", output="clustalw", outfile="tcofee_MSA_output.aln")
print(tcoffee_cline)
stdout, stderr = tcoffee_cline()