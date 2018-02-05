#!/usr/bin/env python3

import os
import Bio

from Bio.Align.Applications import ClustalwCommandline

#cwline = ClustalwCommandline("/Users/navchetankaur/Documents/bioinfo_course/sequence-alignment/clustalw2", infile="MSA_sequences_file.fasta")
cwline = ClustalwCommandline("clustalw2", infile="hiv-proteome.fasta")
print(cwline)
stdout, stderr = cwline()



