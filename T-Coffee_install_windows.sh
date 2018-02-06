# Install Script for T-Coffee for Windows

# Install fort77 compiler
apt-cyg install fort77

# Download T-Coffee Source Distribution using curl
curl -OL http://www.tcoffee.org/Packages/Stable/Latest/T-COFFEE_distribution_Version_11.00.8cbe486.tar.gz

# Extract T-Coffee source code archive
tar xvf T-COFFEE_distribution_Version_11.00.8cbe486.tar.gz

# Compile Install T-Coffee (this will take a while)
cd T-COFFEE_distribution_Version_11.00.8cbe486/
./install all
cd ..
