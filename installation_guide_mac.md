# MACOS SOFTWARE INSTALLATION GUIDE
Open MacOS Terminal program.

Copy and paste commands between backticks ```



#### Make sure Xcode command line tools are installed

```
xcode-select --install
```



#### Homebrew: The missing package manager for MacOS (https://brew.sh/)

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```



#### Install Additional Homebrew Repositories:

```
brew tap brewsci/bio
brew tap buo/cask-upgrade
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
```



#### Git - Source Control

```
brew install git
```



#### iTerm2 - alternative Mac terminal with more features:

```
brew cask install iterm2
```



#### Visual Studio Code Text Editor

```
brew cask install visual-studio-code
```



#### Python 3 Install

We're going to install the base Python distribution instead of Anaconda for consistency with the Windows Cygwin environment.

```
brew install python3
```



#### BioPython module install

Pip3 is the package manager for Python modules

```
pip3 install biopython
pip3 install scipy
pip3 install pandas
```

If you already have Anaconda installed, use `conda` instead of `pip3`



#### Jupyter Notebook to run Python code interactively

```
pip3 install jupyterlab
```



#### PyCharm - IDE for Python (optional)

```
brew cask install pycharm-ce
```



#### R and RStudio IDE

```
brew cask install java
brew install R
brew cask install rstudio
```



#### Try to Install Other Software Through Cask:

Lots of software packages can be installed and updated through Cask.

For example, to install Google Chrome:

```
brew cask install google-chrome
```



#### Switch default shell to Bash:

```
chsh -s /bin/bash
```

Default shell for MacOS Catalina is `zsh`, which might cause inconsistencies between MacOS versions that could impact our scripts.



#### Clone the sequence-alignment Github repository for the class:

Contains the scripts for the in-class labs on sequence alignment.

```
mkdir ~/dev/
cd ~/dev/
git clone https://github.com/lgragert/sequence-alignment.git
cd sequence-alignment
```



#### Updating packages managed by HomeBrew - Run every few weeks

```
brew update && brew cleanup && brew cask cleanup
brew cu
```

This command updates all installed Python packages:

```
pip3 list --outdated --format=freeze | awk 'BEGIN { FS = "=" } ; { print $1 }' | xargs -n1 pip3 install -U
```

