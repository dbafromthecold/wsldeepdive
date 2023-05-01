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
wsl --shutdown



# jump back into WSL and confirm systemd is running: –
systemctl list-unit-files --type=service



# import the GPG keys: –
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -



# register the repository: –
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-preview.list)"



# update and install SQL Server: –
sudo apt-get update
sudo apt-get install -y mssql-server



# configure SQL Server with mssql-conf: –
sudo /opt/mssql/bin/mssql-conf setup



# confirm SQL Server is running: –
systemctl status mssql-server



# also confirm the processes running by: –
ps aux | grep mssql



# connect to sqlserver
mssql-cli -S 127.0.0.1 -U sa -P Testing1122 -Q "SELECT @@SERVERNAME AS [InstanceName]"