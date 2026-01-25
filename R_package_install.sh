# Command for installing R Packages from Command Line

# Replace tidyverse with name of packages

Rscript -e 'install.packages("tidyverse", dependencies=c("Suggests"),repos="https://cloud.r-project.org")'