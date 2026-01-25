#!/bin/bash

##############################################################################
# Multiple Sequence Alignment - In-Class Lab
# 
# Instructor: Dr Loren Gragert
# Assistant Professor
# Department of Pathology and Laboratory Medicine
# Tulane School of Medicine

###############################################################################
# INSTRUCTIONS FOR RUNNING CLUSTALW WEB TOOL
###############################################################################
# 1) Open the CLUSTAL W homepage at http://www.genome.jp/tools-bin/clustalw
# 2) Copy and paste the FASTA sequences from MSA_sequences_file.fasta (provided) 
#       or upload the file
# 3) Output format can remain as default
# 4) For pairwise alignment select SLOW/ACCURATE
# 5) Execute Multiple Alignment
# 6) From the tree menu try executing with Neighbor-joining/UPGMA formats


###############################################################################
# INSTRUCTIONS FOR MULTIPLE SEQUENCE ALIGNMENTS WITH BIOPYTHON
###############################################################################
# Download and Install CLUSTAL and MUSCLE on your system
###############################################################################

# From Unix terminal change directory to the current directory where you have
# all the files

# Add the bioinformatics tap
brew tap brewsci/bio

# CLUSTALW and Clustal Omega
# NOTE: CLUSTALW 2.1 is from 2009 and is superseded by Clustal Omega.
# Consider using Clustal Omega for new projects.
brew install clustal-w
brew install clustal-omega

# MUSCLE
brew install muscle

# T-COFFEE
brew install t-coffee

# Verify installations
echo "Verifying installations..."
clustalw2 -help | head -5
clustalo --version
muscle -version
t_coffee -version


###############################################################################
# Running CLUSTAL W and MUSCLE and T-COFFEE with BIOPYTHON
###############################################################################

# To run CLUSTAL W and MUSCLE using biopython, run the commands from Bash shell

python3 biopython_clustalw.py
# python3 biopython_muscle.py
python3 biopython_tcoffee.py

