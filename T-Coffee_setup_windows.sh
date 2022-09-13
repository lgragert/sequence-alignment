# T-Coffee for Windows - not officially supported

# Install Cygwin compilers and devel tools
choco install strawberryperl
apt-cyg install fort77
apt-cyg install libcrypt-devel
apt-cyg install gcc-g++
apt-cyg install make
apt-cyg install openssl-devel
apt-cyg install libexpat-devel
apt-cyg install apache2
apt-cyg install apache2-devel
apt-cyg install httpd-devel
apt-cyg install httpd-tools
apt-cyg install httpd-mod_ldap
apt-cyg install httpd-mod_lua
apt-cyg install httpd-mod_proxy_html
apt-cyg install libgdbm-devel
apt-cyg install gdbm
apt-cyg install libncurses-devel
apt-cyg install libreadline-devel
apt-cyg install libnsl-devel

# Install Perl modules needed for T-Coffee compile
# This will take a while
cpan -fi YAML
cpan -fi inc::latest
cpan -fi PAR
cpan -fi Inline
cpan -fi Module::Build::Tiny
cpan -fi Dist::Zilla
cpan -fi Dist::Milla
cpan -fi Minilla
cpan -fi App::ModuleBuildTiny
cpan -fi Software::License
cpan -fi PL_files
cpan -fi File::ShareDir
cpan -fi Module::Signature
cpan -fi CPANPLUS
cpan -fi Devel::AssertOS::Unix
cpan -fi Module::Build
cpan -fi XML::SemanticDiff
cpan -fi SOAP::Transport::TCP
cpan -fi XMLRPC::Lite
cpan -fi XML::Parser
cpan -fi XML::Parser::Lite
cpan -fi XML::Simple

# These installs seem to require some Apache configuration - Hit Ctrl-C to stop
cpan -fi mod_perl2
cpan -fi Bundle::Apache
cpan -fi SOAP::Lite

# Download T-Coffee Source Distribution using curl
curl -OL https://s3.eu-central-1.amazonaws.com/tcoffee-packages/Beta/Latest/T-COFFEE_distribution_Version_13.45.60.cd84d2a.tar.gz

# Extract T-Coffee source code archive
tar xvf T-COFFEE_distribution_Version_13.45.60.cd84d2a.tar.gz

# Compile and Install T-Coffee and select plugins
cd T-COFFEE_distribution_Version_13.45.60.cd84d2a
./install tcoffee
./install all

cd ..
export PATH=~/.t_coffee/bin/windows:$PATH
export PLUGINS_4_TCOFFEE=~/.t_coffee/plugins/windows:
echo 'export PATH="~/.t_coffee/bin/windows:$PATH"' >> ~/.bash_profile
echo 'export PLUGINS_4_TCOFFEE="~/.t_coffee/plugins/windows:"' >> ~/.bash_profile
source ~/.bash_profile
cp ~/.t_coffee/bin/windows/t_coffee.exe /usr/local/bin/

python3 biopython_tcoffee.py