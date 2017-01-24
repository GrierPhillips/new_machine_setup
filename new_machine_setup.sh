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

# Install some useful packages to python
conda install --yes statsmodels
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

# Install r
brew install homebrew/science r
brew install rstudio

# Vowpal wabbit
brew install automake
brew install libtool
brew install boost
brew install boost-build
brew install vowpal-wabbit

# Set desired colors for bash prompt
echo -e "GREEN='\[$(tput setaf 47)\]'\nBLUE='\[$(tput setaf 33)\]'\nORANGE='\[$(tput setaf 214)'RESET='\[$(tput sgr0)\]'\nfunction parse_git_branch {\ngit branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'}" > ~/.bash_theme
echo -e "source ~/.bash_theme" >> ~/.bash_profile
