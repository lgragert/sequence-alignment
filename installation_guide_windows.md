# WINDOWS SOFTWARE INSTALLATION GUIDE



#### Chocolatey package manager (https://chocolatey.org/)

Package managers allow users to install and update software from the command line

Open an admin Powershell window - right-click Run As Administrator 

Powershell can be "Run As Administrator" by default by doing the following:

1) Right-Click the Desktop -> New -> Shortcut

2) Type "Powershell" in the box in the popup window and name it Powershell and click Finish.

3) Right-click on the shortcut on the Desktop

4) Under "Shortcut tab" left-click "Advanced..." button"

5) Click the box next to "Run As Administrator" then click "OK"

6) Right-click Powershell in the taskbar and Click "Pin to Taskbar"

7) When you open Powershell from now on it should say "Adminstrator: Powershell" at the top.

Copy the following commands inside backticks ``` and paste in Powershell (and later Cygwin terminal)

Use WordPad to open this Markdown text file to start - until you have Visual Studio Code installed.


```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
```

If McAfee is blocking PowerShell from connecting to Internet
try these instructions.

https://www.mcafee.com/support/?locale=en-US&articleId=TS100813&page=shell&shell=article-view




#### Cygwin - Unix Terminal / Bash Shell Functionality

```
choco install cygwin
```

Install Curl - Unix Command line tool for transferring data

Install Lynx and other tools using Powershell

```
cd C:\cygwin64\
./cygwinsetup.exe -q -P wget,tar,gawk,bzip2,vim,lynx,make,httpd,curl,mintty,unzip
```

On some systems Cygwin is installing to a different directory C:\tools\cygwin\. If so, try this set of commands as an alternative.

```
cd C:\tools\cygwin\
./cygwinsetup.exe -q -P wget,tar,gawk,bzip2,vim,lynx,make,httpd,curl,mintty,unzip
```

Close MS PowerShell and Use Cygwin from here

Search for Cygwin and right-click Cygwin64 Terminal to Run As Administrator

Right-Click Cygwin64 Terminal Icon on taskbar and Pin to Taskbar

To always run Cygwin as Administrator: Right-click Cygwin Icon in Taskbar -> Right-click Cygwin64 Terminal -> Properties -> Advanced -> Run as Admininstrator


If the Lynx install fails due to McAfee antivirus, here's an alternative install method for Curl:

1) Find the cygwin `setup.exe` file from http://cygwin.com/ and run it.

2) Click/enter preferences until you reach the "Select Packages" window. (See image)

3) Click (+) for Net

4) Click the entry for curl. (Make sure you select the checkbox for the Binary)

5) Install.

6) Open a Cygwin window and type curl.exe (should be available now).



#### Visual Studio Code Installation - Text Editor

```
choco install vscode
```

Try to reopen this markdown file in Visual Studio Code - Looks better!

In Explorer - Right-click file -> Open With -> Visual Studio Code

-> Always open .txt and .md files 



#### Git Source Control Installation



```
choco install git
export PATH=$PATH:"/cygdrive/C/Program\ Files/Git/bin/"
```

Restart Cygwin and apply this command:

```
git config --global core.autocrlf false
```



#### Python3 Installation

Anaconda does not work with Cygwin and Chocolatey

https://stackoverflow.com/questions/36969824/using-anaconda-environments-with-cygwin-on-windows/45291648

```
choco install python3 --version=3.11.5
cp /cygdrive/c/Python311/python.exe /usr/local/bin/python3.exe
```



#### BioPython and SciPy module install

Close and reopen Cygwin window so that the python3 command will be recognized.

pip3 is the package manager for Python modules

```
python3 -m pip install --upgrade pip
pip3 install biopython
pip3 install scipy
pip3 install pandas
```



#### Install Jupyter Notebook to run Python code interactively

```
pip3 install jupyterlab
```


#### R and RStudio Integrated Development Environment (IDE)

```
choco install r.project
choco install r.studio
```

# 7zip - Compression tools

```
choco install 7zip
```

#### IDE for Python - Integrated development environment with debugger

PyCharm community

```
choco install pycharm-community
```

Spyder is another option that popular in science

```
pip3 install spyder
```


#### Download all scripts and files from Canvas to working directory

On your Windows filesystem, you should have a `C:\tools\cygwin\home\<username>` folder (or `C:\cygwin64\home\<username>`).

In Cygwin, the same directory maps to `/home/<username>/`.

This home directory is good place to put all your bioinformatics project files.

You can create a `/dev/sequence-alignment` subdirectory in your home directory.

From Cygwin, you can access other directories on your hard drive.

The `/cygdrive/c/` folder on Cygwin is the same as `C:\` in Windows filesystem.



#### Set Visual Studio Code to be the default editor for .txt, .sh, and .py files in Windows.

Right-click on file in Explorer to select which program to use to open a file.

You can also type `code <filename>` in Cygwin to open a file.



#### Clone the sequence-alignment Github repository for the class:

Contains the scripts for the in-class labs on sequence alignment.

```
mkdir ~/dev/
cd ~/dev/
git clone https://github.com/lgragert/sequence-alignment.git
cd sequence-alignment
```



#### Command to update all packages managed by Chocolatey

Run every few weeks or so to keep software up to date.

Won't do anything until updated packages are available.

```
choco upgrade all
```

Can also choose a specific package to update - See all commands here

https://github.com/chocolatey/choco/wiki/CommandsUpgrade

This command updates all installed Python packages:

```
pip3 list --outdated --format=freeze | awk 'BEGIN { FS = "=" } ; { print $1 }' | xargs -n1 pip3 install -U
```