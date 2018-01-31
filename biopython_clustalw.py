import os 
import Bio

from Bio.Align.Applications import ClustalwCommandline

cwline = ClustalwCommandline("/Users/navchetankaur/Documents/bioinfo_course/sequence-alignment/clustalw2", infile="MSA_sequences_file.fasta")
print(cwline)
stdout, stderr = cwline()



from Bio import AlignIO
align = AlignIO.read("MSA_sequences_file.aln", "clustal")
print(align)


from Bio import Phylo
tree = Phylo.read("MSA_sequences_file.dnd", "newick")
Phylo.draw_ascii(tree)