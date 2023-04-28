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

<pre><code>wsl --list</pre></code>

Jump into a distro: -

<pre><code>wsl -d Ubuntu-22.04</pre></code>

---

## Running Docker in WSL

---

# Demos
<!-- .slide: style="text-align: left;"> -->

---

## Resources


