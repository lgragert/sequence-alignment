#!/bin/bash

###############################################################################
# Multiple Sequence Alignment - In-Class Lab - Windows Install Guide

# Instructor: Dr Loren Gragert
# Assistant Professor
# Department of Pathology and Laboratory Medicine
# Tulane School of Medicine.
###############################################################################

###############################################################################
# INSTRUCTIONS FOR RUNNING CLUSTALW WEB TOOL
###############################################################################
#	1) Open the CLUSTALW homepage at http://www.genome.jp/tools-bin/clustalw
# 	2) Copy and paste the fasta sequences from MSA_sequences_file.fasta 
# 		(provided) or upload the file
# 	3) Output format can remain as default
# 	4) For pairwise alignment select SLOW/ACCURATE
# 	5) Execute Multiple Alignment
#	6) From the tree menu try executing with Neighbor-joining/UPGMA formats

################################################################################
# INSTRUCTIONS FOR MULTIPLE SEQUENCE ALIGNMENTS WITH BIOPYTHON
################################################################################
# Download CLUSTALW and MUSCLE on your system
################################################################################

# CLUSTALW installation
# NOTE: CLUSTALW 2.1 is from 2009 and is superseded by Clustal Omega.
# Consider using Clustal Omega (below) for new projects.

curl -O https://www.clustal.org/download/current/clustalw-2.1-win.msi
run msiexec /a clustalw-2.1-win.msi /qn TARGETDIR=C:\\
cp '/cygdrive/c/clustalw2.exe' /usr/local/bin

# CLUSTAL Omega installation (recommended over CLUSTALW)
curl -O https://www.clustal.org/omega/clustal-omega-1.2.4-win64.zip
unzip clustal-omega-1.2.4-win64.zip
cp ./clustal-omega-1.2.4-win64/clustalo.exe /usr/local/bin
chmod +x /usr/local/bin/clustalo.exe

# MUSCLE 5 Installation
# Download MUSCLE 5.1 from GitHub releases
curl -OL https://github.com/rcedgar/muscle/releases/download/5.1.0/muscle5.1.win64.exe
chmod +x muscle5.1.win64.exe
mv muscle5.1.win64.exe muscle.exe
cp muscle.exe /usr/local/bin

###############################################################################
# Running CLUSTALW and MUSCLE with BioPython
###############################################################################
# To run CLUSTALW and MUSCLE using BioPython, 
# run these commands from Bash shell

python3 biopython_clustalw.py
python3 biopython_muscle.py
