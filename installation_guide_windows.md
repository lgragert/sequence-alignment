# WINDOWS SOFTWARE INSTALLATION GUIDE



#### Chocolatey package manager (https://chocolatey.org/)

Package managers allow users to install and update software from the command line

Open an admin Powershell Window - right-click Run As Administrator 

Powershell can be "Run As Administrator" by default by doing the following:

1) Search Powershell from Windows Explorer (or Cortana if using Windows 10 and pin to taskbar)

2) After pinning to taskbar, right-click the Powershell icon on the taskbar

3) Right-click again on the "Windows Powershell" option from the drop down menu and left-click "Properties"

4) Under "Shortcut tab" left-click "Advanced..." button"

5) Make sure the box next to "Run As Administrator" is checked and then click "Apply"

Copy the following commands inside backticks ``` and paste in Powershell (and later Cygwin terminal)

Use WordPad to open this text file to start - until you have Visual Studio Code installed.

```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
```



#### Cygwin - Unix Terminal / Bash Shell Functionality

```
choco install cygwin
```

Install Curl - Unix Command line tool for transferring data

Install Lynx and other tools using Powershell

```
cd C:\tools\cygwin\
./cygwinsetup.exe -q -P wget,tar,qawk,bzip2,vim,lynx,make,apache,curl
```

Close MS PowerShell and Use Cygwin from here

Search for Cygwin and right-click Cygwin64 Terminal to Run As Administrator

Right-Click Cygwin64 Terminal Icon on taskbar and Pin to Taskbar

To always run Cygwin as Administrator: Right-click Cygwin -> Properties -> Advanced -> Run as Admin

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
```



#### Python3 Installation

Anaconda does not work with Cygwin and Chocolatey

https://stackoverflow.com/questions/36969824/using-anaconda-environments-with-cygwin-on-windows/45291648

```
choco install python3 --version==3.8.5
cp /cygdrive/c/Python38/bin/python.exe /usr/local/bin/python3.exe
```



#### BioPython and SciPy module install

May need to close and reopen Cygwin

pip3 is the package manager for Python modules

```
python3 -m pip3 install --upgrade pip
pip3 install biopython
pip3 install scipy
pip3 install pandas
```



#### Install Jupyter Notebook to run Python code interactively

```
pip3 install jupyterlab
```



#### PuTTY - SSH - Needed to connect to Cypress

```
choco install putty
```



#### R and RStudio

```
choco install r.project
choco install r.studio
```



#### PyCharm CE IDE for Python - Integrated development environment with debugger

```
choco install pycharm-community
```



#### Download all scripts and files from Canvas to working directory

On your Windows filesystem, you should have a `C:\tools\cygwin\home\<username>` folder.

In Cygwin, the same directory is `/home/<username>/`.

This home directory is good place to put all your files.

You can create a `/dev/sequence-alignment` subdirectory in your home directory.

From Cygwin, you can access other directories on your hard drive.

The `/cygdrive/c/` folder on Cygwin is the same as `C:\` in Windows filesystem.



#### Set Visual Studio Code to be the default editor for .txt, .sh, and .py files in Windows.

Right-click on file in Explorer to select which program to use to open a file.

You can also type `code <filename>` in Cygwin to open a file.



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



#### Windows Subsystem for Linux (WSL2) Install - Alternative to Cygwin that installs Linux distribution on your PC:

https://docs.microsoft.com/en-us/windows/wsl/install-win10

Install Windows Subsystem for Linux using Powershell :

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

Install Ubuntu 20.04 LTS using Microsoft Store - https://www.microsoft.com/store/apps/9n6svws3rx71

Launch Ubuntu and set username and password.

Now you have a Linux development environment that might work better than Cygwin.