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



# dockerfile for the custom SQL Docker image: –
FROM ubuntu:20.04
 
RUN apt-get update && apt-get install -y wget software-properties-common apt-transport-https
 
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
 
RUN add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
 
RUN apt-get update && apt-get install -y mssql-server
 
CMD /opt/mssql/bin/sqlservr



# navigate to dockerfile
cd C:\git\dbafromthecold\wsldeepdive\dockerfile



# build the image: –
docker build -t sqlserver2019 .



# view the image
docker image ls



# run a container from the new custom image: –
docker container run -d `
--publish 1433:1433 `
--env ACCEPT_EULA=Y `
--env MSSQL_SA_PASSWORD=Testing1122 `
--name sqlcontainer1 `
sqlserver2019



# confirm that the container is running: –
docker container ls -a



# rename the instance in the container: –
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT @@SERVERNAME AS [InstanceName];"
 
mssql-cli -S localhost -U sa -P Testing1122 -Q "sp_dropserver [e69928d64f0e];"
 
mssql-cli -S localhost -U sa -P Testing1122 -Q "sp_addserver [sqlserver2019], local;"



# confirm the rename has been successful: –
docker stop sqlcontainer1
 
docker start sqlcontainer1

mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT @@SERVERNAME AS [InstanceName];"



# stop the container again: –
docker stop sqlcontainer1



# export the container to a tar file: –
docker export sqlcontainer1 -o C:\temp\sqlcontainer1.tar



# import it into WSL2: –
wsl --import sqlserver2019 C:\wsl-distros\sqlserver2019 C:\temp\sqlcontainer1.tar --version 2

# what the code above is doing…
#    sqlserver2019 – the name of the new WSL distro
#    C:\wsl-distros\sqlserver2019 – The path where the new distro will be stored on disk
#    C:\temp\sqlcontainer1.tar – The location of the tar file we are importing
#    version 2 – WSL version of the new distro



# confirm that the new distro is in WSL2: –
wsl --list --verbose



# remove container
docker container rm sqlcontainer1



# we’re going to use the setsid command to start up SQL here, 
# if we didn’t…the SQL log would write to our current session and we’d have to open up another powershell window
# start the distro: -
wsl -d sqlserver2019 bash -c "setsid /opt/mssql/bin/sqlservr"



# verify the distro is running: –	
wsl --list --verbose



# confirm SQL Server is running: -
wsl -d sqlserver2019 ps aux



# try viewing systemd process
wsl -d sqlserver2019 systemctl status mssql-server



# connect to SQL running in the distro: -
mssql-cli -S 127.0.0.1 -U sa -P Testing1122 -Q "SELECT @@SERVERNAME AS [InstanceName]"



# close down the distro with: –
wsl -t sqlserver2019



# confirm: -
wsl --list --verbose



# remove the new distro completely: –
wsl --unregister sqlserver2019



# confirm: -
wsl --list --verbose