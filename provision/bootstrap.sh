#!/bin/bash

# This script is called directly from the Vagrantfile
su vagrant
## general config ##

#vagrant config?
export DEBIAN_FRONTEND=noninteractive
set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

#update package manager resources
sudo apt-get update -y

#set time zone
area="America"
zone="Los_Angeles"
sudo echo "$area/$zone" > /tmp/timezone
sudo cp -f /tmp/timezone /etc/timezone
sudo cp -f /usr/share/zoneinfo/$area/$zone /etc/localtime

## end general config ##

## main server installs ##

#basics (bjd- needed?)
sudo apt-get install -y build-essential
sudo apt-get install -y libc6-dev libreadline-dev libz-dev libncursesw5-dev libssl-dev libgdbm-dev libsqlite3-dev libbz2-dev liblzma-dev tk-dev

sudo apt-get install -y git-core mercurial vim screen wget curl raptor-utils unzip ack-grep
sudo apt-get install -y tree vim-gnome

#apache
sudo apt-get install -y apache2

#postgres
sudo apt-get update -y
sudo apt-get install -y postgresql postgresql-contrib

sudo apt-get purge python-pip
sudo apt-get install -y python-pip
sudo pip install virtualenv virtualenvwrapper
sudo apt-get update -y

## end main server installs ##

## virtualenv work ##

sudo echo """ 
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/dev
export DJANGO_SETTINGS_MODULE=settings
source /usr/local/bin/virtualenvwrapper.sh
""" >> ~/.bashrc
source ~/.bashrc

#Install Python 3.4 for to run in a virtual environment
cd ~ 
sudo wget https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tar.xz
sudo tar xvf Python-3.4.1.tar.xz
cd Python-3.4.1
sudo ./configure
sudo make

#Create a virtualenv and ACTIVATE it
./python -m venv ~/.virtualenvs/py341
workon py341

#install necessary python packages
sudo pip install -r requirements.pip

sudo echo """
looks like everything worked. you now have a virtual environment named
py341 running python 3.4.1 with django 1.7 installed and all of the support for
a postgresql database configured. type quickrun to runserver on 'dev:8000'. 
so get to work.
""" >> /vagrant/it_worked.txt
## end virtualenv work ##

echo "---"
echo "---"
echo "Box provisioned! SSH in to workon a project!"
echo "---"
echo "---"

exit

