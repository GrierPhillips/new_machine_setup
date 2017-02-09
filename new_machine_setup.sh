# This script was adapted from Miles Erickson's setup.sh

# Change permissions on /usr/local to User
sudo chown -R $LOGNAME /usr/local

# Install Homebrew and update
if brew --version; then
  echo 'Brew is already installed!'
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
  brew update
fi

# Install Anaconda
if conda -V; then
  echo 'Anaconda is already installed!'
else
  curl -L https://repo.continuum.io/archive/Anaconda3-4.2.0-MacOSX-x86_64.sh > anaconda_script.sh
  bash anaconda_script.sh -b
  rm anaconda_script.sh
fi
conda update conda
conda update anaconda
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
pip install pycodestyle
brew install pig
brew install hive
brew install git
brew install --HEAD hub
brew install node
npm -g install coffee-script

# Alias hub with git in bash_profile
echo  "alias git=hub >>" ~/.bash_profile

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
echo -e 'GREEN="\[$(tput setaf 47)\]"\nBLUE="\[$(tput setaf 33)\]"\nORANGE="\[$(tput setaf 214)\]"\nRED="\[$(tput setaf 196)\]"\nRESET="\[$(tput sgr0)\]"' > ~/.bash_theme
echo -e "function parse_git_branch {\ngit branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'\n}" >> ~/.bash_theme
echo -e 'export PS1="${BLUE}\h: ${GREEN}\u ${ORANGE}\W ${RED}\$(parse_git_branch)${RESET}$ "' >> ~/.bash_theme
echo -e "source ~/.bash_theme" >> ~/.bash_profile

# Install Atom
if atom --version; then
  echo 'Atom is already installed!'
else
  wget https://github.com/atom/atom/releases/download/v1.13.1/atom-mac.zip
  unzip atom-mac.zip -d /Applications/
  rm atom-mac.zip
fi
ln -s /Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm /usr/local/bin/apm
ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom

# Modify Atom settings for PEP8 and other options
declare config='atom.config.set("editor.preferredLineLength", 80)\n
               atom.config.set("editor.showIndentGuide", "true")\n
               atom.config.set("editor.showInvisibles", "true")\n
               atom.config.set("core.themes", ["seti-ui", "monokai-seti"])'
echo -e $config >> ~/.atom/init.coffee

# Use Atom Package Manager (apm) to install useful packages
declare -a packages=(autocomplete-python kite linter linter-pylint \
                     linter-pycodestyle platform-ide-terminal \
                     tree-view-git-status symbols-tree-view merge-conflicts \
                     seti-ui monokai-seti minimap python-tools imdone-atom \
                     code-peek)

declare installed="$(apm list --installed --bare | cut -d @ -f 1)"
for ((i=0; i<${#packages[@]}; i++)); do
 if echo "${installed[@]}" | grep -q -w ${packages[i]}; then
   echo ${packages[i]} "in installed"
   continue
 else
   apm install ${packages[i]};
 fi
done

# Install Flux
if find /Applications/ -iname flux.app; then
  echo 'Flux is already installed!'
else
  wget https://justgetflux.com/mac/Flux.zip
  unzip Flux.zip -d /Applications/
  rm Flux.zip
fi
