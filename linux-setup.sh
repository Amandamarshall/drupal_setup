#!/bin/bash
# Update OS and installed packages to start
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get-y  dist-upgrade
# use Firefox to download and install Chrome from google.com/chrome
sudo apt install git
# Node.js
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
# Replace open Java with Oracle Java
sudo apt-get remove -y openjdk*
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update-y 
sudo apt-get install -y java-common oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default
source /etc/profile
# PHPStorm
# wget http://download-cf.jetbrains.com/webide/PHPStorm-2016.3.3.tar.gx
read -p "Download PHPStorm to /Apps, then press [Enter] key to continue..."
cd ~/Apps
tar xfz PhpStorm-2016.3.3.tar.gz
sudo mv PhpStorm-163.13906.21/ /opt/phpstorm/
sudo ln -s /opt/phpstorm/bin/phpstorm.sh /usr/local/bin/phpstorm
rm PhpStorm-2016.3.3.tar.gz
cd ~
# Atom as lightweight editor
cd ~/Apps
wget https://atom.io/download/deb -O atom-amd64.deb
sudo dpkg -i atom-amd64.deb
sudo apt-get -f install -y 
rm atom-amd64.deb
cd ~
# Virtualbox
echo 'deb http://download.virtualbox.org/virtualbox/debian xenial contrib' | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install virtualbox-5.1
version=$(vboxmanage -v)
echo $version
var1=$(echo $version | cut -d 'r' -f 1)
echo $var1
var2=$(echo $version | cut -d 'r' -f 2)
echo $var2
file="Oracle_VM_VirtualBox_Extension_Pack-$var1-$var2.vbox-extpack"
echo $file
wget http://download.virtualbox.org/virtualbox/$var1/$file -O /tmp/$file
sudo VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
sudo VBoxManage extpack install /tmp/$file --replace
# Vagrant
sudo apt-get install vagrant
# Docker
sudo apt-get-y remove docker docker-engine
sudo apt-get-y install apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce
# Filezilla for FTP
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt -y update
sudo apt -y install filezilla
# Gimp
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt-get -y update
sudo apt-get -y install gimp
# Apache
sudo apt-get -y update
sudo apt-get -y install apache2 apache2-utils
sudo sh -c 'echo "<IfModule mod_dir.c>" > /etc/apache2/mods-enabled/dir.conf'
sudo sh -c 'echo "    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm" >> /etc/apache2/mods-enabled/dir.conf'
sudo sh -c 'echo "</IfModule>" >> /etc/apache2/mods-enabled/dir.conf'
sudo systemctl restart apache2
# MySQL
sudo apt-get -y install mysql-server
# sudo mysql_secure_installation # removed for local installation
# PHP 5.6 and 7.1
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get -y update
sudo apt-get -y install php5.6 php7.1
sudo apt-get -y install php-pear php-gd php-curl libapache2-mod-php php-mcrypt php-mysql php-cli
php -v
sudo sh -c 'echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php'
read -p "use nano to edit /etc/php/7.1/apache2/php.ini, change allow_url_fopen = Off, then press [Enter] key to continue"
sudo a2enmod rewrite
sudo systemctl restart apache2
# memcached
sudo apt-get update -y
sudo apt-get install memcached -y 
sudo apt-get install php-memcached php5.6-memcached -y
sudo systemctl restart apache2
# ESLint
sudo npm install -g eslint
# may need to set up a configuration file with "eslint --init"
# Composer
sudo apt-get update -y
sudo apt-get install php-mbstring git unzip -y
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
cd ~/.composer
sudo chown -R gregg:gregg cache
sudo chmod -R 0777 cache
# Composer GCR to resolve --global issues
# see https://pantheon.io/blog/fixing-composer-global-command
composer global require consolidation/cgr
# Install Drush 6, 7 and 8 with 8 being default
# Drush 8
mkdir ~/drush8
cd ~/drush8
composer require drush/drush:dev-master
# Drush 7
mkdir ~/drush7
cd ~/drush7
composer require "drush/drush:7.*"
# Drush 6
mkdir ~/drush6
cd ~/drush6
composer require "drush/drush:6.*"
# add Drush aliases (and make Composer globals available in path)
sudo cat << EOT >> ~/.bash_profile
alias drush6='~/drush6/vendor/bin/drush'
alias drush7='~/drush7/vendor/bin/drush'
alias drush8='~/drush8/vendor/bin/drush'
export PATH="$PATH:$HOME/.composer/vendor/bin"
EOT
cd ~
source .bash_profile
# Drupal 8 for global use
cgr drush/drush:8.*
# Behat
cgr --dev behat/behat
# Mink
cgr behat/mink
# Global installation of Drupal Extension
cd /opt/
sudo mkdir drupalextension
sudo chown gregg:gregg drupalextension
cd drupalextension/
sudo wget -N https://github.com/greggmarshall/drupal_setup/raw/master/composer.json
composer install
sudo ln -s /opt/drupalextension/bin/behat /usr/local/bin/behat
cd ~
# Copy and Paste Detector
cgr "sebastian/phpcpd=*"
# Coder and PHPCS
cgr "drupal/coder"
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
# Drupal Code Review
cgr alexdesignworks/dcr
# Drupal Console
cgr drupal/console:@stable
# Shutter as an alternative to Skitch
cd ~
sudo add-apt-repository -y ppa:shutter/ppa
sudo apt-get update -y
sudo apt-get install shutter -y
# Pidgin for IRC client
sudo add-apt-repository ppa:jonathonf/backports -y
sudo apt-get update -y
sudo apt-get install pidgin -y
# Remarkable for markdown editing
wget https://remarkableapp.github.io/files/remarkable_1.87_all.deb
sudo apt-get install gdebi-core -y
# Pandoc universal document converter
sudo apt-get install pandoc -y
# TeX Live for PDF output for pandoc
sudo apt-get install texlive -y
sudo apt-get install xzdec
tlmgr init-usertree
# Additional fonts
tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final
tlmgr install collection-fontsrecommended


