#!/usr/bin/env python3

import os
import Bio

from Bio.Align.Applications import ClustalwCommandline

cwline = ClustalwCommandline("clustalw2", infile="MSA_sequences_file.fasta")
print(cwline)
stdout, stderr = cwline()

from Bio import AlignIO
align = AlignIO.read("MSA_sequences_file.aln", "clustal")
print(align)

# Alignment objects can be manipulated

# slice alignment
align_slice = align[:, 400:420]
print ("Slice of alignment from position 400 to 420\n")
print(align_slice)

# Make Phylogenetic Tree
from Bio import Phylo
tree = Phylo.read("MSA_sequences_file.dnd", "newick")
Phylo.draw_ascii(tree)

# select the 3 sequences in the top branch of phylo tree

align_branch = align_slice[0:3]
print ("Top branch - 3 sequences from position 400 to 420\n")
print(align_branch)
