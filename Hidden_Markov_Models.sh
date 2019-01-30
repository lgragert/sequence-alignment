#!/bin/bash

#################################################################################################################################################################
# 
# Lecture 6: Hidden Markov Models
# Instructor: Dr Loren Gragert, Assistant Professor, Department of Pathology and Laboratory Medicine, Tulane School of Medicine.
# 
###############################################################################################################################################################

###############################################################################################################################################################
# 
# INSTRUCTIONS FOR RUNNING HMMER WEB TOOL
# 
###############################################################################################################################################################

# 	1) Open the HMMER homepage at https://www.ebi.ac.uk/Tools/hmmer/search/phmmer
#	2) Copy and paste the fasta ARC protein sequences from ARC_protein_sequence.fasta (file provided) 
#	3) Choose database of choice like References Proteomes or UniProtKB
#	4) Click submit
#	5) PHMMER results show alignments starting with proteins with most significant E-value
#	6) Click on the domains tab and you can find the similarity with retrotransposons of several species
#	7) You can download the PHMMER results in desired format from "Download" tab 
#	8) You can change default settings from "Alternative search options" 


#	hmmscan: searches a protein sequence against a protein sequence database

#	9) Select "HMMSCAN" from the tab and paste ARC_portein_sequence.fasta
#	10) Select Pfam from the protein families and submit
#	11) Retrotransposon_gag protein shows up as the top hit
#	12) Similarly you can try hmmsearch and jackhmmer tools


############################################################################################################################
# INSTRUCTIONS FOR HMMER COMMANDLINE
############################################################################################################################
# INSTALL HMMER IN YOUR SYSTEM USING HMMER_installation_mac.sh for MACOSX and HMMER_installation_windows.sh for Windows
bash HMMER_installation_mac.sh
############################################################################################################################

# Create profile hidden markov models and align new sequence to models

python3 biopython_clustalw.py
python3 biopython_clustalw_hiv.py

# Run HMMSCAN
bash hmm.sh

# Parses the HMMSCAN output with Python

python3 hmm_scan_parser.py