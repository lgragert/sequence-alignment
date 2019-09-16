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

curl -O http://www.clustal.org/download/current/clustalw-2.1-win.msi
run msiexec /a clustalw-2.1-win.msi /qn TARGETDIR=C:\\
cp '/cygdrive/c/clustalw2.exe' /usr/local/bin

# MUSCLE Installation - Uses regular Win32 version
# Cygwin version does not work with Chocolatey install

curl -OL https://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86win32.exe
chmod +x muscle3.8.31_i86win32.exe
mv muscle3.8.31_i86win32.exe muscle.exe
cp muscle.exe /usr/local/bin

###############################################################################
# Running CLUSTALW and MUSCLE with BioPython
###############################################################################
# To run CLUSTALW and MUSCLE using BioPython, 
# run these commands from Bash shell

python biopython_clustalw.py
python biopython_muscle.py
