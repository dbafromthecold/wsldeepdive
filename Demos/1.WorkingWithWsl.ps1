############################################################################
############################################################################
#
# Deep dive into WSL - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/wsldeepdive
# Working with Windows Subsystem for Linux
#
############################################################################
############################################################################



# list all available WSL commands
wsl --help > help.txt
notepad help.txt
rm help.txt



# view WSL status
wsl --status



# list available WSL distros
wsl --list --online



# list available wsl distros with winget
winget search wsl



# list installed WSL distros
wsl --list --verbose



# jump into default distro
wsl



# confirm distro
cat /etc/os-release



# open file explorer in current location
explorer.exe .



# exit distro
exit



# view vscode config
notepad C:\Users\dbafromthecold\AppData\Roaming\Code\User\settings.json



# view terminal config
notepad C:\Users\dbafromthecold\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json;



# run a command in WSL from powershell
wsl -d Ubuntu-20.04 -- cat /etc/hosts



# clip from WSL
wsl -d Ubuntu-20.04 tail ~/.bashrc | clip.exe



# view ipconfig in powershell
ipconfig /all


wsl -d Ubuntu-20.04 ip a
# view ip a in WSL
wsl -d Ubuntu-20.04 ip route



