#!/bin/bash

# Install Atom
if atom --version; then
  echo 'Atom is already installed!'
else
  wget https://github.com/atom/atom/releases/download/v1.13.1/atom-mac.zip
  unzip atom-mac.zip -d /Applications/
  rm atom-mac.zip
fi
apm=/usr/local/bin/apm
atom=/usr/local/bin/atom
if ! [ -L $apm ];then
  ln -s /Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm $apm
fi
if ! [ -L $atom ];then
  ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh $atom
fi

# Modify Atom settings for PEP8 and other options
declare config='atom.config.set("editor.preferredLineLength", 80)\n
               atom.config.set("editor.showIndentGuide", "true")\n
               atom.config.set("editor.showInvisibles", "true")\n
               atom.config.set("core.themes", ["seti-ui", "monokai-seti"])'
echo -e $config >> ~/.atom/init.coffee

# Use Atom Package Manager (apm) to install useful packages
declare -a packages=(autocomplete-python linter linter-pylint linter-flake8\
                     flask-snippets linter-pycodestyle platformio-ide-terminal \
                     tree-view-git-status symbols-tree-view merge-conflicts \
                     seti-ui monokai-seti minimap python-tools imdone-atom \
                     code-peek markdown-preview-plus)

declare installed="$(apm list --installed --bare | cut -d @ -f 1)"
for ((i=0; i<${#packages[@]}; i++)); do
 if echo "${installed[@]}" | grep -q -w ${packages[i]}; then
   echo ${packages[i]} "is already installed."
   continue
 else
   apm install ${packages[i]};
 fi
done
