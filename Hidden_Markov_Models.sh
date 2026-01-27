#!/bin/zsh

###############################################################################
# Hidden Markov Models
# Loren Gragert, PhD
# Assistant Professor
# Department of Pathology and Laboratory Medicine
# Tulane School of Medicine
###############################################################################
###############################################################################
# INSTRUCTIONS FOR RUNNING HMMER WEB TOOL
###############################################################################

# 	1) Open HMMER homepage at https://www.ebi.ac.uk/Tools/hmmer/search/phmmer
#	2) Copy and paste the fasta ARC protein sequences from 
#        ARC_protein_sequence.fasta (file provided) 
#	3) Choose database of choice like References Proteomes or UniProtKB
#	4) Click submit
#	5) PHMMER results show alignments starting with proteins with most 
#        significant E-value
#	6) Click on the domains tab and you can find the similarity with 
#        retrotransposons of several species
#	7) You can download PHMMER results in desired format from "Download" tab 
#	8) You can change default settings from "Alternative search options" 

#	hmmscan: searches a protein sequence against a protein sequence database

#	9) Select "HMMSCAN" from the tab and paste ARC_portein_sequence.fasta
#	10) Select Pfam from the protein families and submit
#	11) Retrotransposon_gag protein shows up as the top hit
#	12) Similarly you can try hmmsearch and jackhmmer tools

###############################################################################
# INSTRUCTIONS FOR HMMER COMMANDLINE
###############################################################################
# INSTALL HMMER IN YOUR SYSTEM USING either
# HMMER_installation_mac.sh for MACOSX or
# HMMER_installation_windows.sh for Windows
# bash HMMER_installation_mac.sh
###############################################################################

# Use virtual environment Python
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VENV_PYTHON="$SCRIPT_DIR/.venv/bin/python"

if [ ! -f "$VENV_PYTHON" ]; then
    echo "=============================================="
    echo "ERROR: Virtual environment not found!"
    echo "=============================================="
    echo ""
    echo "Please set up the environment first:"
    echo "  cd $SCRIPT_DIR"
    echo "  python3.14 -m venv .venv"
    echo "  source .venv/bin/activate"
    echo "  uv pip install biopython"
    echo ""
    exit 1
fi

# Create profile hidden markov models and align new sequence to models

$VENV_PYTHON biopython_clustalw.py
$VENV_PYTHON biopython_clustalw_hiv.py

# Run HMMSCAN
zsh hmm.sh

$VENV_PYTHON hmm_scan_parser.py