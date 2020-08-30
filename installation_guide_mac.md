# MACOS SOFTWARE INSTALLATION GUIDE
Copy and paste commands between backticks ``` in MacOS Terminal



#### Make sure Xcode command line tools are installed

```
xcode-select --install
```



#### Homebrew: The missing package manager for MacOS (https://brew.sh/)

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

Should install this base distribution instead of Anaconda

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
brew tap brewsci/bio
brew install R
brew cask install rstudio
```



#### Install Other Software Through Cask:

Lots of software packages can be installed and updated through Cask.

For example, to install Google Chrome

```
brew cask install google-chrome
```



#### Updating packages managed by HomeBrew - Run every few weeks

```
brew update && brew cleanup && brew cask cleanup
```

This command updates all installed Python packages:

```
pip3 list --outdated --format=freeze | awk 'BEGIN { FS = "=" } ; { print $1 }' | xargs -n1 pip3 install -U
```

