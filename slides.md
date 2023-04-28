# A deep dive into Windows Subsystem for Linux

---

## Andrew Pruski

<img src="images/apruski.jpg" style="float: right"/>

### Field Solutions Architect
### Microsoft Data Platform MVP 
### Certified Kubernetes Administrator

<!-- .slide: style="text-align: left;"> -->
<i class="fab fa-twitter"></i><a href="https://twitter.com/dbafromthecold">  @dbafromthecold</a><br>
<i class="fas fa-envelope"></i>  dbafromthecold@gmail.com<br>
<i class="fab fa-wordpress"></i>  www.dbafromthecold.com<br>
<i class="fab fa-github"></i><a href="https://github.com/dbafromthecold">  github.com/dbafromthecold</a>

---

## Session Aim
<!-- .slide: style="text-align: left;"> -->
To dive into Windows Subsystem for Linux

---

<p align="center">
  <img src="images/ytho.png" />
</p>

---

## Why WSL?
<!-- .slide: style="text-align: left;"> -->
- Take advantage of linux commands on Windows<br>
- Run linux applications on Windows<br>
- Build your own custom distros<br>
- Lighter than running a Linux VM locally<br>
- Install SQL Server on Linux<br>
- Docker Desktop back-end

---

## History of WSL
<!-- .slide: style="text-align: left;"> -->
TBD

---

## WSL v1 vs WSL v2
<!-- .slide: style="text-align: left;"> -->

<p align="center">
  <img src="images/wsl1_vs_wsl2.png" />
</p>

https://learn.microsoft.com/en-us/windows/wsl/compare-versions

---

## WSL v1 architecture
<!-- .slide: style="text-align: left;"> -->
<p align="center">
  <img src="images/wsl1_architecture_diagram.png" />
</p>

---

## WSL v2 architecture
<!-- .slide: style="text-align: left;"> -->
<p align="center">
  <img src="images/wsl2_architecture_diagram.png" />
</p>

---

## WSL Pre-requisites
<!-- .slide: style="text-align: left;"> -->
Windows 10 version 2004 and higher (Build 19041 and higher) or Windows 11 <br>
<br>
Earlier versions: - <br>
https://learn.microsoft.com/en-us/windows/wsl/install-manual


---

## Installing WSL
<!-- .slide: style="text-align: left;"> -->
<pre><code>wsl --list --online</pre></code>

<p align="center">
  <img src="images/wsl_available_distros.png" />
</p>

<pre><code>wsl --install -d Ubuntu-22.04</pre></code>

Note - Ubuntu is installed by default if no distro specified

---

## Running WSL
<!-- .slide: style="text-align: left;"> -->
List available local distros: -

<pre><code>wsl --list --verbose</pre></code>

Convert distro to WSL 2: -

<pre><code>wsl --set-version Ubuntu-20.04 2</pre></code>

Jump into a distro: -

<pre><code>wsl -d Ubuntu-22.04</pre></code>

---

## Configuring WSL
<!-- .slide: style="text-align: left;"> -->
wsl.conf - per-distro configuration

.wslconfig - system wide configuration


---

## Example .wslconfig
<!-- .slide: style="text-align: left;"> -->
<pre><code>[wsl2]
memory=4GB
processors=2
swap=6GB
swapfile=C:\\Temp\wslswap.vhdx</pre><code>

---

## Example wsl.conf
<!-- .slide: style="text-align: left;"> -->
<pre><code>[boot]
systemd=true #enable systemd

[automount]
enabled=true #control host drive mounting (/mnt/c)
mountFsTab=true #process /etc/fstab for more mounts
root=/mnt/ #where drives are mounted

[interop]
enabled=true #WSL can launch windows processes
appendWindowsPath=true #add windows $PATH to WSL $PATH</pre><code>

---

## Working with WSL
<!-- .slide: style="text-align: left;"> -->

---

## Running Docker in WSL
<!-- .slide: style="text-align: left;"> -->

---

# Demo
<!-- .slide: style="text-align: left;"> -->

---

## Converting a Docker Image to WSL
<!-- .slide: style="text-align: left;"> -->
<pre><code>FROM ubuntu:20.04
 
RUN apt-get update && apt-get install -y wget software-properties-common apt-transport-https
 
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
 
RUN add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
 
RUN apt-get update &amp;&amp; apt-get install -y mssql-server
 
CMD /opt/mssql/bin/sqlservr</pre></code>

---

## Converting a Docker Image to WSL
<!-- .slide: style="text-align: left;"> -->
<pre><code>docker build -t sqlserver2019 .

docker container run -d `
--publish 1433:1433 `
--env ACCEPT_EULA=Y `
--env MSSQL_SA_PASSWORD=Testing1122 `
--name sqlcontainer1 `
sqlserver2019</pre></code>

---

## Converting a Docker Image to WSL
<!-- .slide: style="text-align: left;"> -->
<pre><code>docker stop sqlcontainer1

docker export sqlcontainer1 -o C:\temp\sqlcontainer1.tar

wsl --import sqlserver2019 C:\wsl-distros\sqlserver2019 C:\temp\sqlcontainer1.tar --version 2</pre></code>

---

## Converting a Docker Image to WSL
<!-- .slide: style="text-align: left;"> -->
<pre><code>docker stop sqlcontainer1

docker export sqlcontainer1 -o C:\temp\sqlcontainer1.tar

wsl --import sqlserver2019 C:\wsl-distros\sqlserver2019 C:\temp\sqlcontainer1.tar --version 2</pre></code>

---

## Converting a Docker Image to WSL
<!-- .slide: style="text-align: left;"> -->

<pre><code>wsl --list --verbose</pre></code>

<p align="center">
  <img src="images/create_wsl_distro.png" />
</p>

---

## Converting a Docker Image to WSL
<!-- .slide: style="text-align: left;"> -->

<pre><code>wsl -d sqlserver2019 bash -c "setsid /opt/mssql/bin/sqlservr"

wsl --list --verbose</pre></code>

<p align="center">
  <img src="images/run_wsl_distro.png" />
</p>

---

## Converting a Docker Image to WSL
<!-- .slide: style="text-align: left;"> -->

<pre><code>wsl -d sqlserver2019 ps aux</pre></code>

<p align="center">
  <img src="images/sqlserver_running_in_custom_distro.png" />
</p>

---

## Converting a Docker Image to WSL
<!-- .slide: style="text-align: left;"> -->

<pre><code>wsl -t sqlserver2019

wsl --unregister sqlserver2019</pre></code>

<p align="center">
  <img src="images/shutdown_wsl_distro.png" />
</p>

---

# Demo

---

## Running SQL Server in WSL
<!-- .slide: style="text-align: left;"> -->

<p align="center">
  <img src="images/sqlserver_error_wsl.png" />
</p>

---

## Running SQL Server in WSL
<!-- .slide: style="text-align: left;"> -->

<p align="center">
  <img src="images/systemd_in_wsl.png" />
</p>
https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/

---

## Running SQL Server in WSL
<!-- .slide: style="text-align: left;"> -->

Create /etc/wsl.conf and add: -
<pre><code>[boot]
systemd=true</pre></code>

Restart WSL: -
<pre><code>wsl --shutdown</pre></code>

Confirm: -
<pre><code>systemctl list-unit-files --type=service</pre></code>

<p align="center">
  <img src="images/systemd_running_in_wsl.png" />
</p>

---

## Running SQL Server in WSL
<!-- .slide: style="text-align: left;"> -->

<pre><code>sudo apt update && sudo apt upgrade
	
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-preview.list)"

sudo apt-get update

sudo apt-get install -y mssql-server</pre></code>

---

## Running SQL Server in WSL
<!-- .slide: style="text-align: left;"> -->

<pre><code>sudo /opt/mssql/bin/mssql-conf setup</pre></code>

<p align="center">
  <img src="images/mssqlconf_in_wsl.png" />
</p>

---

## Running SQL Server in WSL
<!-- .slide: style="text-align: left;"> -->

<pre><code>systemctl status mssql-server</pre></code>

<p align="center">
  <img src="images/sqlserver_running_in_wsl.png" />
</p>

---

# Demo

---

## Resources


