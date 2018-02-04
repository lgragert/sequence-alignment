#!bin/bash

### Build Profile hidden markov models with CLUSTAL 2.1 multiple sequence alignment file 

hmmbuild MSA.hmm MSA_sequences_file.aln


### Locally aligns 2 proteins to multiple sequence alignment model built with related proteins of retrotransposons
hmmalign MSA.hmm human_herpes_virus_proteins.fasta >hmm_align.out