# Install Script for T-Coffee for Windows

# Install Cygwin compilers and devel tools
apt-cyg install fort77
apt-cyg install libcrypt-devel
apt-cyg install gcc-g++
apt-cyg install openssl-devel
apt-cyg install libexpat-devel
apt-cyg install httpd-devel

# Install XML::Simple and SOAP::Lite CPAN Modules for Perl (this takes a while)
# Force installs currently required for several of these modules
cpan install mod_perl2
cpan -fi Module::Build
cpan -fi XML::SemanticDiff
cpan -fi SOAP::Transport::TCP
cpan -fi XMLRPC::Lite
cpan -fi XML::Parser::Lite
cpan install XML::Simple
cpan install SOAP::Lite
cpan -fi SOAP::Lite

# Download T-Coffee Source Distribution using curl
curl -OL http://www.tcoffee.org/Packages/Stable/Latest/T-COFFEE_distribution_Version_11.00.8cbe486.tar.gz

# Extract T-Coffee source code archive
tar xvf T-COFFEE_distribution_Version_11.00.8cbe486.tar.gz

# Compile and Install T-Coffee (this will take a while - even longer!)
cd T-COFFEE_distribution_Version_11.00.8cbe486/
./install all
cd ..
