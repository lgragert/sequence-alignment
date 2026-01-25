
#### Windows Subsystem for Linux (WSL2) Installation Guide

WSL2 provides a full Linux environment on Windows 10/11, which is the recommended way to run the bioinformatics tools in this course.

**Requirements:** Windows 10 version 2004+ or Windows 11

**Installation:**

Open PowerShell as Administrator and run:

```
wsl --install
```

This single command enables WSL, installs Ubuntu (default), and sets WSL2 as the default version.

Restart your computer when prompted.

**First Launch:**

After restart, Ubuntu will launch automatically (or search for "Ubuntu" in the Start menu). Set your Linux username and password when prompted.

**Installing a Different Ubuntu Version (Optional):**

To see available distributions:
```
wsl --list --online
```

To install a specific version (e.g., Ubuntu 24.04 LTS):
```
wsl --install -d Ubuntu-24.04
```

**Installing Packages:**

Linux packages can be installed with `apt`, which is the package manager for Ubuntu:

```bash
sudo apt update
sudo apt install python3 python3-pip
```

**Running Course Scripts:**

Navigate to your Windows files from WSL using `/mnt/c/` (for C: drive):
```bash
cd /mnt/c/Users/YourUsername/path/to/sequence-alignment
bash MSA_setup_windows.sh
```

**Documentation:**

https://learn.microsoft.com/en-us/windows/wsl/install
