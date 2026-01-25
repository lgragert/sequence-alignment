#!/usr/bin/env python3

import os
import Bio

from Bio.Align.Applications import ClustalwCommandline

# Call CLUSTALW using BioPython wrapper to align HIV proteome sequences
cwline = ClustalwCommandline("clustalw2", infile="hiv-proteome.fasta")
print(cwline)
stdout, stderr = cwline()

# Read and display the alignment results
from Bio import AlignIO
align = AlignIO.read("hiv-proteome.aln", "clustal")
print(align)

# Make Phylogenetic Tree
from Bio import Phylo
tree = Phylo.read("hiv-proteome.dnd", "newick")
Phylo.draw_ascii(tree)
