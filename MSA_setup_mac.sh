#!/bin/zsh

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

# Verify Homebrew installations
echo "Verifying installations..."
clustalw2 -help | head -5
clustalo --version
muscle -version

###############################################################################
# T-COFFEE installation on MacOS (manual install - not available in Homebrew)
###############################################################################

# Download and run installer
curl -OL https://s3.eu-central-1.amazonaws.com/tcoffee-packages/Stable/Latest/T-COFFEE_distribution_Version_13.46.0.919e8c6b.tar.gz
tar xvfz T-COFFEE_distribution_Version_13.46.0.919e8c6b.tar.gz
cd T-COFFEE_distribution_Version_13.46.0.919e8c6b

./install tcoffee
./install all

# Add t_coffee to PATH and zsh config file
export PATH=~/.t_coffee/bin/macosx:$PATH
export PLUGINS_4_TCOFFEE=~/.t_coffee/plugins/macosx:
echo 'export PATH="~/.t_coffee/bin/macosx:$PATH"' >> ~/.zshrc
echo 'export PLUGINS_4_TCOFFEE="~/.t_coffee/plugins/macosx:"' >> ~/.zshrc
source ~/.zshrc

# Go back to working directory and check version
cd ..
t_coffee -version


###############################################################################
# Running CLUSTAL W and MUSCLE and T-COFFEE with BIOPYTHON
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

echo "Using Python from virtual environment: $VENV_PYTHON"

$VENV_PYTHON biopython_clustalw.py
# $VENV_PYTHON biopython_muscle.py
$VENV_PYTHON biopython_tcoffee.py

