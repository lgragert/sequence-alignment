# MACOS SOFTWARE INSTALLATION GUIDE
Open MacOS Terminal program.

Copy and paste commands between backticks ``` (or grey boxes on GitHub webpage)


#### Make sure Xcode command line tools are installed

```
xcode-select --install
```



#### Homebrew: The missing package manager for MacOS (https://brew.sh/)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Curl - Downloads files from web / ftp

```
brew install curl
```



#### Install Additional Homebrew Repositories:

```
brew tap brewsci/bio
brew tap buo/cask-upgrade
```



#### Git - Source Control

```
brew install git
```



#### iTerm2 - alternative Mac terminal with more features:

```
brew install iterm2
```



#### Visual Studio Code Text Editor

```
brew install visual-studio-code
```



#### Python 3.14 Install

We install a specific Python version to ensure consistency across all students.

```
brew install python@3.14
```

Verify the installation:

```
python3.14 --version
```



#### uv Package Manager

`uv` is a modern, fast Python package manager (10-100x faster than pip).

```
brew install uv
```

Verify installation:

```
uv --version
```



#### Create a Virtual Environment

A virtual environment isolates Python packages for this project. Navigate to the course directory and create the environment:

```
cd ~/dev/sequence-alignment
python3.14 -m venv .venv
```



#### Activate the Virtual Environment

**You must activate the virtual environment each time you open a new terminal:**

```
source ~/dev/sequence-alignment/.venv/bin/activate
```

Your prompt will show `(.venv)` when activated. To deactivate:

```
deactivate
```

**Tip:** Add a convenience alias to your shell config:

```
echo 'alias bioenv="source ~/dev/sequence-alignment/.venv/bin/activate"' >> ~/.zshrc
source ~/.zshrc
```

Then simply type `bioenv` to activate.



#### Install BioPython and Packages

With the virtual environment activated, install packages using `uv`:

```
uv pip install biopython
```

For optional data analysis tools:

```
uv pip install scipy pandas
```

Or install everything from the project file:

```
uv pip install -e ".[all]"
```



#### Jupyter Notebook (Optional)

```
uv pip install jupyterlab
```

To launch Jupyter:

```
jupyter lab
```



#### PyCharm - IDE for Python (optional)

```
brew install pycharm-ce
```



#### R and RStudio Integrated Development Environment (IDE)

```
brew install java
brew install R
brew install rstudio
```



#### Try to Install Other Software Through Cask:

Lots of software packages can be installed and updated through Cask.

For example, to install Google Chrome:

```
brew install google-chrome
```



#### Clone the sequence-alignment Github repository for the class:

Contains the scripts for the in-class labs on sequence alignment.

```
mkdir ~/dev/
cd ~/dev/
git clone https://github.com/lgragert/sequence-alignment.git
cd sequence-alignment
```



#### Updating packages managed by Homebrew - Run every few weeks

```
brew update && brew upgrade && brew cleanup
brew cu --all
```

To update Python packages in your virtual environment (activate it first):

```
uv pip install --upgrade biopython scipy pandas jupyterlab
```

This command updates all installed R packages:

```
Rscript -e 'update.packages(ask=FALSE,dependencies=c("Suggests"),repos="https://cloud.r-project.org")'
```

