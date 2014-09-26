python-3.4.1-vagrant-bootstrap
==============================

a repo of my bootstrap setup for python 3.4.1 projects within a vagrant box

## REQUIREMENTS
you **must** have Vagrant and VirtualBox installed on your machine.

## INSTALL
to install simply clone this repo into your working directory like so :
```git clone https://github.com/andrewyoung1991/python-3.4.1-vagrant-bootstrap.git .```

### VAGRANT UP
to provision the virtual machine, and install the correct Ubuntu distro run:
```$ vagrant up```
this step will take some time so make some coffee, pick up a book, etc ...

### VAGRANT SSH
if all wen't well and there were no stupid errors, ssh into the virtual machine :
```$ vagrant ssh```
first things first, start the virtual environment by running : 
```$ workon py341```
and just like that you are fully loaded with an ubuntu box running python 3.4.1!
you will be greated by the machines home directory. to move to the shared
folder just run :
```$ cd /vagrant/```

### POSTGRESQL
the box comes with a postgres server all ready to go, to create a user (so you
don't have to log in as the default postgres user) run :
```sudo su postgres``` followed by ```createuser -P``` to create a user with a
password. create a user named "vagrant" and enter whatever password you want.
be sure to ```$ exit``` after creating the user.
#### CREATE DATABASE
simply run ```$ createdb <...databasename...>```

### THE SERVER
the box is provisioned with a static url for added security so you must add
'192.168.234.131 dev' to your hostsfile.
#### RUNNING THE DEV SERVER
running the python server might be differnt then you are used to. we need the
box to be available on all ports so we will append '0.0.0.0:8000' to the normal
runserver message. the __ will be available through your host machine at
```http://dev:8000/```
