############################################################################
############################################################################
#
# Deep dive into WSL - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/wsldeepdive
# Installing SQL Server in WSL
#
############################################################################
############################################################################



# jump into WSL
wsl



# view wsl.conf
cat /etc/wsl.conf


# create wsl.conf file and add in: -
[boot]
systemd=true



# exit out of WSL and then run: –
exit
wsl --shutdown



# jump back into WSL and confirm systemd is running: –
wsl
systemctl list-unit-files --type=service



# import the GPG keys: –
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -



# register the repository: –
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"



# update and install SQL Server: –
sudo apt-get update
sudo apt-get install -y mssql-server



# enable sql server service (this is for demo purposes and is not needed on a normal install)
sudo systemctl enable mssql-server



# configure SQL Server with mssql-conf: –
sudo /opt/mssql/bin/mssql-conf setup



# confirm SQL Server is running: –
systemctl status mssql-server



# also confirm the processes running by: –
ps aux | grep mssql



# connect to sqlserver
exit
mssql-cli -S 127.0.0.1 -U sa -P Testing1122 -Q "SELECT @@SERVERNAME AS [InstanceName]"



# shutdown and disable SQL Server (for this demo only)
wsl -d Ubuntu-20.04 sudo systemctl stop mssql-server
wsl -d Ubuntu-20.04 sudo systemctl disable mssql-server