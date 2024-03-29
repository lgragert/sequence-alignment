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

# CLUSTALW and Clustal Omega

curl -O http://www.clustal.org/download/current/clustalw-2.1-macosx.dmg
hdiutil attach ./clustalw-2.1-macosx.dmg
cp /Volumes/clustalw-2.1-macosx/clustalw-2.1-macosx/clustalw2 /usr/local/bin/

brew install argtable
curl -O http://www.clustal.org/omega/clustal-omega-1.2.4.tar.gz
tar zxvf clustal-omega-1.2.4.tar.gz
cd clustal-omega-1.2.4
./configure CFLAGS="-I/usr/local/include -I/opt/homebrew/Cellar/argtable/2.13/include" LDFLAGS="-L/usr/local/lib -L/opt/homebrew/Cellar/argtable/2.13/lib" --prefix="/usr/local"
make
sudo make install
cd ..

# MUSCLE - no longer available and binaries don't seem to work

# brew install muscle
# curl -OL https://github.com/rcedgar/muscle/releases/download/5.1.0/muscle5.1.macos_arm64

#############################################################################################################################################################
# T-COFFEE installation on MacOS
#############################################################################################################################################################

# Downloads and run installer
curl -OL https://s3.eu-central-1.amazonaws.com/tcoffee-packages/Stable/Latest/T-COFFEE_distribution_Version_13.46.0.919e8c6b.tar.gz
tar xvfz T-COFFEE_distribution_Version_13.46.0.919e8c6b.tar.gz
cd T-COFFEE_distribution_Version_13.46.0.919e8c6b


./install tcoffee
./install all

# add t_coffee to path and Bash config file

export PATH=~/.t_coffee/bin/macosx:$PATH
export PLUGINS_4_TCOFFEE=~/.t_coffee/plugins/macosx:
echo 'export PATH="~/.t_coffee/bin/macosx:$PATH"' >> ~/.bash_profile
echo 'export PLUGINS_4_TCOFFEE="~/.t_coffee/plugins/macosx:"' >> ~/.bash_profile
source ~/.bash_profile

# go back to working directory and check version
cd ..
t_coffee -version


###############################################################################
# Running CLUSTAL W and MUSCLE and T-COFFEE with BIOPYTHON
###############################################################################

# To run CLUSTAL W and MUSCLE using biopython, run the commands from Bash shell

python3 biopython_clustalw.py
# python3 biopython_muscle.py
python3 biopython_tcoffee.py

