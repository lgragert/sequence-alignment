# Install Script for T-Coffee for Windows

# Install fort77 compiler
apt-cyg install fort77

# Install XML::Simple CPAN Module for Perl (this will take a while)
cpan install XML::Simple

# Download T-Coffee Source Distribution using curl
curl -OL http://www.tcoffee.org/Packages/Stable/Latest/T-COFFEE_distribution_Version_11.00.8cbe486.tar.gz

# Extract T-Coffee source code archive
tar xvf T-COFFEE_distribution_Version_11.00.8cbe486.tar.gz

# Compile and Install T-Coffee (this will take a while - even longer!)
cd T-COFFEE_distribution_Version_11.00.8cbe486/
./install all
cd ..
