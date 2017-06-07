#!/bin/bash 

echo ""
echo "==============================================="
echo "=========== Installing Ruby v.2.4.0 ==========="
echo "==============================================="
echo ""

sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.4.0
rvm use 2.4.0 --default

gem install bundler

echo ""
echo "Ruby v.2.4.0 is now installed"
echo ""

echo ""
echo "==============================================="
echo "========== Installing Rails v.5.0.1 ==========="
echo "==============================================="
echo ""

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

gem install rails -v 5.0.1

echo ""
echo "Rails v.5.0.1 is now installed" 
echo ""

echo ""
echo "==============================================="
echo "========= Setting Up PostgreSQL v.9.5 ========="
echo "==============================================="
echo ""
 
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.5 libpq-dev

echo ""
read -p "Enter username for postgres > " postname
sudo -u postgres createuser $postname -s

echo ""
echo "PostgreSQL v9.5 is now installed"
echo ""
echo "Script completed successfully" 
