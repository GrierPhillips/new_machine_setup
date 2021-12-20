# This script was adapted from Miles Erickson's setup.sh

# Change permissions on /usr/local to User
sudo chown -R $LOGNAME /usr/local

# Install Homebrew and update
if brew --version; then
  echo 'Brew is already installed!'
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
fi

# Install Anaconda
if conda -V; then
  echo 'Anaconda is already installed!'
else
  curl -L https://repo.continuum.io/archive/Anaconda3-2020.02-MacOSX-x86_64.sh > anaconda_script.sh
  bash anaconda_script.sh -b
  rm anaconda_script.sh
fi
conda update --yes conda
conda update --yes anaconda
source ~/.bash_profile

# Install useful Mac Apps
brew tap homebrew/cask
brew cask install iterm2
brew cask install xquartz
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
brew install terminal-notifier
brew install gcc
brew install pandoc

# Install some useful packages to python
conda install --yes ipykernel
pip install pymongo
conda install --yes -c https://conda.binstar.org/trent psycopg2
conda install --yes graphviz
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
brew install apache-spark
npm -g install coffee-script

# Setup spark kernels for jupyter
pip install sparkmagic
jupyter nbextension enable --py --sys-prefix widgetsnbextension
sm_loc=`pip show sparkmagic | sed -n -e 's/Location: //p'`'/sparkmagic/kernels/'
kernels=(sparkkernel pysparkkernel pyspark3kernel sparkrkernel)
for ((i=0; i<${#kernels[@]}; i++));do
  echo $sm_loc${kernels[i]}
  jupyter-kernelspec install $sm_loc${kernels[i]} --InstallKernelSpec.prefix='~/anaconda'
done

# Alias hub with git in bash_profile
echo  "alias git=hub >>" ~/.bashrc

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
echo -e 'GREEN="$(tput setaf 47)"\nBLUE="$(tput setaf 33)"\nORANGE="$(tput setaf 214)"\nRED="$(tput setaf 196)"\nRESET="$(tput sgr0)"' > ~/.bash_theme
echo -e "function parse_git_branch {\ngit branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'\n}" >> ~/.bash_theme
echo -e 'export PS1="%{${BLUE}%}%m%\: %{${GREEN}%}%n%\ %{${ORANGE}%}%1~%{${RED}%} $(parse_git_branch)%{${RESET}%} $ "' >> ~/.bash_theme
echo -e "source ~/.bash_theme" >> ~/.bashrc

# Install Atom
bash install_atom.sh

# Install Flux
if find /Applications/ -iname flux.app; then
  echo 'Flux is already installed!'
else
  wget https://justgetflux.com/mac/Flux.zip
  unzip Flux.zip -d /Applications/
  rm Flux.zip
fi

source ~./bashrc

echo -e '[[ -s ~/.bashrc ]] && source ~/.bashrc' >> ~/.bash_profile
echo -e 'source ~/.bash_profile' >> ~/.zshrc
