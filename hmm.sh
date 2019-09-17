#!/bin/bash

### Build Profile hidden markov models with CLUSTAL 2.1 multiple sequence alignment files 
hmmbuild MSA.hmm MSA_sequences_file.aln
hmmbuild hiv.hmm hiv-proteome.aln

### create a HMM database flatfile
cat hiv.hmm MSA.hmm >minifam

###hmmscan uses binary compression and indexing of flatfiles.
### compress HMM database
hmmpress minifam

### Locally aligns 2 proteins to multiple sequence alignment model built with related proteins of retrotransposons
hmmalign MSA.hmm human_herpes_virus_proteins.fasta >hmm_align.out

### HMMSCAN HMM database for a sequence
hmmscan minifam ARC_protein_sequence.fasta >hmmscan.hmmer3-text
