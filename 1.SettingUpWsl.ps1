############################################################################
############################################################################
#
# Deep dive into WSL - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/wsldeepdive
# Converting a Docker image into a WSL distribution
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



# list installed WSL distros
wsl --list



# jump into default distro
wsl



# confirm distro
cat /etc/os-release



# exit distro
exit



# view vscode config
notepad C:\Users\dbafromthecold\AppData\Roaming\Code\User\settings.json



# view terminal config
notepad C:\Users\dbafromthecold\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json