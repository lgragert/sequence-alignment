#!/usr/bin/env python3

import os
import Bio

from Bio.Align.Applications import ClustalwCommandline

# Call CLUSTALW using BioPython wrapper to align HIV proteome sequences
cwline = ClustalwCommandline("clustalw2", infile="hiv-proteome.fasta")
print(cwline)
stdout, stderr = cwline()
