:: Manually install Babun from babun.github.io
pause "Manually install Babun from babun.github.io"
:: Or manually install cmdr from http://cmder.net/
:: Manually install Dev Desktop from https://dev.acquia.com/downloads, programs to c:\DevDesktop\programs, sites to c:\DevDesktop\drupalsites
pause "Manually install Dev Desktop from https://dev.acquia.com/downloads, programs to 
c:\DevDesktop\programs, sites to c:\DevDesktop\drupalsites"
:: Manually install Chocolately using @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
pause  "@powershell -NoProfile -ExecutionPolicy Bypass -Command \"iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))\""
:: Install Node.js and NPM
cinst nodejs.install -y
:: Instal 7zip
cinst 7zip -y
:: Install wget
cinst wget -y
:: Install PHPStorm
cinst phpstorm -y
:: Install Atom as on editor option
cinst Atom -y
:: Install Notepad++ as lightweight editor
cinst notepadplusplus -y
:: Install nano for sysadmin
cinst nano -y
:: Install Google Chrome and Firefox
cinst GoogleChrome -y
cinst Firefox -y
:: Install VirtualBox and Extensions
cinst virtualbox -y
cinst VirtualBox.ExtensionPack -y
:: Install vagrant
cinst vagrant -y
:: Install docker, there are two options:  Docker for Windows which uses Hyper V and disables VirtualBox or Docker Toolbox
:: cinst docker-for-windows -y
cinst docker-toolbox -y
:: Install Filezilla for FTP
cinst filezilla -y
:: Install WinSCP as alternative to Filezilla
cinst winscp -y
:: Install Gimp
cinst gimp -y
:: Manually install memcached, using instructions at https://commaster.net/content/installing-memcached-windows, copy files into c:\cmdr\bin
:: Install ESLint
npm install -g eslint
:: Install Yarn for StyleLint
cinst yarn -y
:: Install StyleLint
npm install -g stylelint
:: To run styleline on all core css files >D8.4. Run the following command from DRUPAL_ROOT/ "yarn run lint:css"
:: Edit the composer.bat and drush.bat batch files in C:\DevDesktop\Programs\tools to use fully qualified path to php programs
pause "Edit the composer.bat and drush.bat batch files in C:\DevDesktop\Programs\tools to use fully qualified path to php programs"
::    php.exe C:\DevDesktop\Programs\tools\composer.phar %*
::    @php.exe "C:\DevDesktop\Programs\tools\vendor\drush\drush\drush.php" --php="php.exe" %*
:: Install Composer GCR to resolve --global issues
:: see https://pantheon.io/blog/fixing-composer-global-command
composer global require consolidation/cgr
:: Create a file C:\DevDesktop\Programs\tools\cgr.bat containing
:: C:\DevDesktop\Programs\php5_5\php.exe %HOME%\AppData\Roaming\Composer\vendor\consolidation\cgr\bin\cgr %*
:: Install Behat
cgr --dev behat/behat
:: Install Mink
cgr behat/mink
# Global installation of Drupal Extension
cd %HOME%\.composer\global\behat
mkdir drupalextension
cd drupalextension/
wget -N https://github.com/greggmarshall/drupal_setup/raw/master/composer.json
composer install
ln -s /opt/drupalextension/bin/behat /usr/local/bin/behat
cd ~
:: Create a file C:\DevDesktop\Programs\tools\behat.bat containing
:: setlocal DISABLEDELAYEDEXPANSION
:: C:\DevDesktop\Programs\php5_5\php.exe %HOME%\.composer\global\behat\drupalextension\vendor\behat\behat\bin\behat %*
:: Install Copy and Paste Detector
cgr "sebastian/phpcpd=*"
:: Create a file C:\DevDesktop\Programs\tools\phpcpd.bat containing
:: C:\DevDesktop\Programs\php5_5\php.exe %HOME%\.composer\global\sebastian\phpcpd\vendor\sebastian\phpcpd\composer\bin\phpcpd %*
:: Install Coder and PHPCS
cgr "squizlabs/php_codesniffer=*"
cgr "drupal/coder"
:: Create a file C:\DevDesktop\Programs\tools\phpcs.bat containing
:: C:\DevDesktop\Programs\php5_5\php.exe %HOME%\.composer\global\drupal\coder\vendor\squizlabs\php_codesniffer\scripts\phpcs %*
phpcs --config-set installed_paths %HOME%/.composer/vendor/drupal/coder/coder_sniffer
:: Install Drupal Code Review (may not be compatible with Windows)
cgr alexdesignworks/dcr
:: Create a file C:\DevDesktop\Programs\tools\dcr.bat containing
:: C:\DevDesktop\Programs\php5_5\php.exe %HOME%\.composer\global\drupal\coder\vendor\squizlabs\php_codesniffer\scripts\phpcs %*
:: Install Drupal Console for Drupal 8
cinst SQlite -y
cgr drupal/console:@stable
:: Create a file C:\DevDesktop\Programs\tools\drupal.bat containing
:: C:\DevDesktop\Programs\php5_5\php.exe %HOME%\.composer\global\drupal\console\vendor\drupal\console\bin\console %*
:: Texts is a good markdown editor,  download at http://www.texts.io/
