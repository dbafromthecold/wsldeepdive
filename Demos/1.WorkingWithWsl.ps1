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



# view wsl version
wsl --version



# view WSL status
wsl --status



# list available WSL distros
wsl --list --online



# list available wsl distros with winget
winget search wsl



# list installed WSL distros
wsl --list



# get more info
wsl --list --verbose



# jump into default distro
wsl



# confirm distro
cat /etc/os-release



# view wsl.conf
cat /etc/wsl.conf



# open file explorer in current location
explorer.exe .



# exit distro
exit



# run a command in WSL from powershell
wsl -d Ubuntu-20.04 -- cat /etc/hosts



# clip from WSL
wsl -d Ubuntu-20.04 -- tail ~/.bashrc | clip.exe



# view ipconfig in powershell
ipconfig /all



# view ip info in WSL
wsl -d Ubuntu-20.04 ip a



# view ip route in WSL
wsl -d Ubuntu-20.04 ip route


