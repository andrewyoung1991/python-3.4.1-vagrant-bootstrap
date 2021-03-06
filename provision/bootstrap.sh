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

#basics
sudo apt-get install -y build-essential
sudo apt-get install -y libc6-dev libreadline-dev libz-dev libncursesw5-dev libssl-dev libgdbm-dev libsqlite3-dev libbz2-dev liblzma-dev tk-dev

sudo apt-get install -y git-core mercurial vim screen wget curl raptor-utils unzip ack-grep
sudo apt-get install -y tree vim-gnome

#apache, xvfb and firefox for selenium functional testing
sudo apt-get install -y apache2 xvfb firefox 

#postgres
sudo apt-get update -y
sudo apt-get install -y libpq-dev postgresql postgresql-contrib

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
export SOME_SECRET_KEY=d0nt-t0uch-my-1ce-cr34m
source /usr/local/bin/virtualenvwrapper.sh
""" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

#Install Python 3.4 for to run in a virtual environment
cd /home/vagrant/
sudo wget https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tar.xz
sudo tar -xvf Python-3.4.1.tar.xz
cd Python-3.4.1
sudo ./configure
make && sudo make install

#Create a virtualenv and ACTIVATE it
sudo pyvenv-3.4 /home/vagrant/.virtualenvs/py341 

#finished with virtualenv work

#set up vim stuff :)
mkdir /home/vagrant/.vim && mkdir /home/vagrant/.vim/{autoload,bundle}
mkdir -p /home/vagrant/.vim/colors && cd /home/vagrant/.vim/colors

#installing color theme
sudo wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
#install pathogen
sudo curl -so /home/vagrant/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#installing python ide stuffs
cd /home/vagrant/.vim/bundle
sudo git clone git://github.com/Lokaltog/vim-powerline.git
sudo git clone https://github.com/kien/ctrlp.vim.git
sudo git clone git://github.com/davidhalter/jedi-vim.git
mkdir -p /home/vagrant/.vim/ftplugin
sudo wget -O /home/vagrant/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492

#install jedi submodule
cd /home/vagrant/.vim/bundle/jedi-vim  
sudo git submodule update --init

#move packaged .vimrc into place
sudo mv /vagrant/.vimrc /home/vagrant/.vimrc

echo "---"
echo "---"
echo "Box provisioned! SSH in to workon a project!"
echo "---"
echo "---"

exit

