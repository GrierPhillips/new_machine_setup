# New Machine Setup

This repo contains some useful items for setting of new machines of various flavors.

### new_machine_setup.sh
This script will install Anaconda, R, Spark, Homebrew, and Atom along with a bunch of useful python packages. As a perk it will change your terminal prompt to look like this.

![Super Cool Bash Prompt!](terminal_prompt.png)

This arrangement is easily modified. [This](http://misc.flogisoft.com/bash/tip_colors_and_formatting) is a great source for colors, and [this](https://wiki.archlinux.org/index.php/Bash/Prompt_customization) is an incredibly extensive resource for all things bash customization.

### install_atom.sh
This script is called by new_machine_setup.sh to install and configure atom.

Currently Atom is set to change the preferred line length to 80, enable visible spacing and indentations, set the ui theme to [seti](https://atom.io/packages/seti-ui), and the syntax theme to [monokai-seti](https://atom.io/packages/monokai-seti). It will also install the following packages:

  - [autocomplete-python](https://atom.io/packages/autocomplete-python)
  - [flask-snippets](https://atom.io/packages/flask-snippets)
  - [imdone-atom](https://atom.io/packages/imdone-atom)
  - [linter](https://atom.io/packages/linter)
  - [linter-flake8](https://atom.io/packages/linter-flake8)
  - [linter-pycodestyle](https://atom.io/packages/linter-pycodestyle)
  - [linter-pylint](https://atom.io/packages/linter-pylint)
  - [markdown-preview-plus](https://atom.io/packages/markdown-preview-plus)
  - [merge-conflicts](https://atom.io/packages/merge-conflicts)
  - [minimap](https://atom.io/packages/minimap)
  - [monokai-seti](https://atom.io/packages/monokai-seti)
  - [platformio-ide-terminal](https://atom.io/packages/platformio-ide-terminal)
  - [python-tools](https://atom.io/packages/python-tools)
  - [tree-view-git-status](https://atom.io/packages/tree-view-git-status)
  - [seti-ui](https://atom.io/packages/seti-ui)
  - [symbols-tree-view](https://atom.io/packages/symbols-tree-view)

### spark_windows_setup.md
This file is a set of instructions for installing spark on a windows machine.
