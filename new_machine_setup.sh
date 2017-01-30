# This script was adapted from Miles Erickson's setup.sh

# Change permissions on /usr/local to User
sudo chown -R $LOGNAME /usr/local

# Install Homebrew and update
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
brew update

# Install Anaconda
curl -L https://repo.continuum.io/archive/Anaconda3-4.2.0-MacOSX-x86_64.pkg > anaconda_script.sh
bash anaconda_script.sh
conda update conda
conda update anaconda
rm anaconda_script.sh
source ~/.bash_profile

# Install useful Mac Apps
brew tap caskroom/cask
brew cask install mou # no osx Sierra support yet
brew cask install iterm2
brew cask install xquartz
brew cask install virtualbox
brew cask install vagrant
brew cask install postgres
brew cask install pgadmin4
brew cask install gephi
brew cask install java
# To Do: Consider changing editors! VSCode, Sublime, or just VIM

echo 'export PATH="~/Applications/Postgres.app/Contents/Versions/latest/bin/:$PATH"' >> ~/.bash_profile

## Mac Packages
brew install wget
brew install mongodb
brew install graphviz
brew install imagemagick
brew install terminal-notifier
brew install gcc

# Install some useful packages to python
conda install --yes statsmodels
conda install --yes networkx
conda install --yes pymc
pip install pymongo
conda install -c https://conda.binstar.org/trent psycopg2
pip install unittest2
pip install pytest
pip install seaborn
pip install plotly
pip install flask
pip install mrjob
pip install mechanize
brew install pig
brew install hive
brew install git
brew install --HEAD hub

# Alias hub with git in bash_profile
echo  "alias git=hub >> ~/.bash_profile"

# Install r
brew tap homebrew/science
brew install r
brew install Caskroom/cask/rstudio

# Vowpal wabbit
brew install automake
brew install libtool
brew install boost
brew install boost-build
brew install vowpal-wabbit

# Set desired colors for bash prompt
echo 'GREEN="\[$(tput setaf 47)\]"\nBLUE="\[$(tput setaf 33)\]"\nORANGE="\[$(tput setaf 214)\]"RESET="\[$(tput sgr0)\]"\nfunction parse_git_branch {\ngit branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'}\nexport PS1="${BLUE}\h: ${GREEN}\u ${ORANGE}\W ${RED}\$(parse_git_branch)${RESET}$ "' > ~/.bash_theme
echo -e "source ~/.bash_theme" >> ~/.bash_profile

# Install Atom
wget https://github.com/atom/atom/releases/download/v1.13.1/atom-mac.zip
unzip atom-mac.zip -d /Applications/
rm atom-mac.zip

# Install Flux
wget https://justgetflux.com/mac/Flux.zip
unzip Flux.zip -d /Applications/
rm Flux.zip
