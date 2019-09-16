#!/bin/bash

###############################################################################
# Multiple Sequence Alignment - In-Class Lab - Windows Install Guide

# Instructor: Dr Loren Gragert
# Assistant Professor
# Department of Pathology and Laboratory Medicine
# Tulane School of Medicine.
###############################################################################

###############################################################################
# INSTRUCTIONS FOR RUNNING CLUSTAL W WEB TOOL
###############################################################################
#	1) Open the CLUSTAL W homepage at http://www.genome.jp/tools-bin/clustalw
# 	2) Copy and paste the fasta sequences from MSA_sequences_file.fasta 
# 		(provided) or upload the file
# 	3) Output format can remain as default
# 	4) For pairwise alignment select SLOW/ACCURATE
# 	5) Execute Multiple Alignment
#	6) From the tree menu try executing with Neighbor-joining/UPGMA formats

################################################################################
# INSTRUCTIONS FOR MULTIPLE SEQUENCE ALIGNMENTS WITH BIOPYTHON
################################################################################
# Download CLUSTAL W and MUSCLE and T-COFFEE on your system
################################################################################

#  CLUSTALW
#  From Cygwin terminal, change directory to the current directory where you have 
#  all the files

curl -O http://www.clustal.org/download/current/clustalw-2.1-win.msi
run msiexec //a clustalw-2.1-win.msi /qn TARGETDIR=C:\\
cp '/cygdrive/c/clustalw2.exe' /usr/local/bin

# MUSCLE Installation - Cygwin version does not work with Chocolatey install

curl -OL https://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86win32.exe
chmod +x muscle3.8.31_i86win32.exe
mv muscle3.8.31_i86win32.exe muscle.exe
cp muscle.exe /usr/local/bin

# T-Coffee for Windows - not supported - this is a work in progress

# Install Cygwin compilers and devel tools
apt-cyg install fort77
apt-cyg install libcrypt-devel
apt-cyg install gcc-g++
apt-cyg install openssl-devel
apt-cyg install libexpat-devel
apt-cyg install httpd-devel
apt-cyg install libgdbm-devel
apt-cyg install gdbm
apt-cyg install apache
apt-cyg install make

# Download T-Coffee Source Distribution using curl
curl -OL http://www.tcoffee.org/Packages/Stable/Latest/T-COFFEE_distribution_Version_13.39.0.d675aed.tar.gz

# Extract T-Coffee source code archive
tar xvf T-COFFEE_distribution_Version_13.39.0.d675aed.tar.gz

# Compile and Install T-Coffee and select plugins
cd T-COFFEE_distribution_Version_13.39.0.d675aed
./install tcoffee
./install all
./install mafft
./install clustalo
./install hmmtop
./install msa

# Plugins we are not installing
# ./install clustalw
# ./install upp
# ./install dcacd
# ./install probconsRNA
# ./install mus4
# ./install amap
# ./install proda
# ./install prank
# ./install fsa
# ./install sfold
# ./install fugueali
# ./install mustang
# ./install TMalign
# ./install poa
# ./install RNAplfold
# ./install gorIV
# ./install legacy_blast.pl

# Plugins that fail install
# ./install dialign-tx
# ./install dialign-t

cd ..
export PATH=~/.t_coffee/bin/windows:$PATH
export PLUGINS_4_TCOFFEE=~/.t_coffee/plugins/windows:
echo 'export PATH="~/.t_coffee/bin/windows:$PATH"' >> ~/.bash_profile
echo 'export PLUGINS_4_TCOFFEE="~/.t_coffee/plugins/windows:"' >> ~/.bash_profile
source ~./bash_profile
cp ~/.t_coffee/bin/windows/t_coffee.exe /usr/local/bin/

# T-Coffee no longer seems to require these Perl modules
# Install XML::Simple and SOAP::Lite CPAN Modules for Perl
# Force installs currently required for several of these modules
# Installs took hours
# mod_perl2 is apache

# choco install strawberryperl

# cpan -fi YAML
# cpan -fi inc::latest
# cpan -fi PAR
# cpan -fi Inline
# cpan -fi Module::Build::Tiny
# cpan -fi Dist::Zilla
# cpan -fi Dist::Milla
# cpan -fi Minilla
# cpan -fi App::ModuleBuildTiny
# cpan -fi Software::License
# cpan -fi PL_files
# cpan -fi File::ShareDir
# cpan -fi Module::Signature
# cpan -fi CPANPLUS
# cpan -fi Devel::AssertOS::Unix
# cpan -fi Module::Build
# cpan -fi mod_perl2
# cpan -fi XML::SemanticDiff
# cpan -fi SOAP::Transport::TCP
# cpan -fi XMLRPC::Lite
# cpan -fi XML::Parser::Lite
# cpan -fi XML::Simple
# cpan -fi SOAP::Lite


###############################################################################
# Running CLUSTAL W and MUSCLE with BioPython
###############################################################################
# To run CLUSTAL W and MUSCLE using BioPython, 
# run these commands from Bash shell

python biopython_clustalw.py
python biopython_muscle.py
python biopython_tcoffee.py