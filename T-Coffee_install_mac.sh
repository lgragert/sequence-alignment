#!/bin/bash

# T-Coffee installation on Mac OSX

# Download and run installer
curl -OL http://www.tcoffee.org/Packages/Beta/Latest/T-COFFEE_distribution_Version_12.00.451ed9b.tar.gz

tar -xvfz T-COFFEE_distribution_Version_12.00.451ed9b.tar.gz

cd T-COFFEE_distribution_Version_12.00.451ed9b

# you may have to enter passwords and answer questions

./install tcoffee
./install rcoffee


# install new clang compiler does not work

# brew install llvm 

# fails due to clang: error: the clang compiler does not support '-traditional'
# ./install expresso 
# ./install 3dcoffee

# add t_coffee to path and Bash config file

export PATH=/Users/lgragert/.t_coffee/plugins/macosx:$PATH
echo 'export PATH="/usr/local/ncbi/blast/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

# go back to working directory and check version
cd ..
t_coffee -version
