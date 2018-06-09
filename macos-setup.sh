# XCode Command Line Tools
xcode-select --install
read -n1 -r -p "Let XCode finish installing, then press space to continue..." key
# HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# HomeBrew Cask
brew tap caskroom/cask
# Node.js
brew install node
# PHPStorm
brew cask install phpstorm
# Atom as lightweight editor
brew cask install atom
# Visual Studio Code as lightweight editor
brew cask install visual-studio-code
# Acquia Dev Desktop
brew cask install acquia-dev-desktop
# VirtualBox
brew cask install virtualbox
brew cask install virtualbox-extension-pack
# Vagrant
brew cask install vagrant
# Docker
brew cask install docker
# Cyberduck FTP
brew cask install cyberduck
# Firefox
brew cask install firefox
# Chrome
brew cask install google-chrome
# Gimp
brew cask install gimp
# Memcached
brew install memcached
# ESLint
sudo npm install -g eslint
# Yarn for Stylelint
brew install yarn
# Stylelint
sudo npm install -g stylelint
read -n1 -r -p "From DRUPAL_ROOT/core run 'yarn install' then 'yarn run lint:css'" key
# Composer
brew install homebrew/php/composer
# Composer GCR to resolve --global issues
# see https://pantheon.io/blog/fixing-composer-global-command
composer global require consolidation/cgr
# Skitch
brew cask install skitch
# Colloquy IRC Client
brew cask install colloquy
# MacDown
brew cask install macdown
# Pandoc universal document converter
brew install pandoc
brew install pandoc-citeproc
# Basic TeX for PDF output from pandoc
brew cask install basictex
# Additional fonts
tlmgr install collection-fontsrecommended
# Install Drush 6, 7 and 8 with 8 being default
#    remove any existing copy of Drush
brew remove --force drush
cgr drush/drush:8.*
# Drush 9
mkdir ~/drush9
cd ~/drush9
composer require "drush/drush:9.*" 
# Drush 8
mkdir ~/drush8
cd ~/drush8
composer require "drush/drush:8.*"
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
alias drush9='~/drush9/vendor/bin/drush'
export PATH="$PATH:$HOME/.composer/vendor/bin"
EOT
cd ~
source .bash_profile
# Behat
cgr --dev behat/behat
# Mink
cgr behat/mink
# Global installation of Drupal Extension
cd /opt/
sudo mkdir drupalextension
cd drupalextension/
wget -N https://github.com/greggmarshall/drupal_setup/raw/master/composer.json
composer install
ln -s /opt/drupalextension/bin/behat /usr/local/bin/behat
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
