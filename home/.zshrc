# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# lazy making aliases
alias bcuke="bundle exec cucumber"
alias bguard="bundle exec guard"
alias brails="bundle exec rails"
alias brake="bundle exec rake"
alias bspec="bundle exec rspec"
alias bforeman='bundle exec foreman'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# Base path including homebrew
PATH=/usr/local/bin:$PATH
# Android SDK
PATH=$PATH:/Users/tylerpickett/android-sdk/platform-tools:/Users/tylerpickett/android-sdk/tools
# mysql
PATH=$PATH:/usr/local/mysql/bin
# X11
PATH=$PATH:/usr/X11/bin
# TeX
PATH=$PATH:/usr/texbin
# Git
PATH=$PATH:/usr/local/git/bin
# Add CUDA
CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$CUDA_HOME/lib
PATH=$PATH:$CUDA_HOME/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Make things in my homedir the first to be tried for easy customization
PATH=~/bin:$PATH
# Finally export our path
export PATH

# because we hombrewed rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# additional rbenv stuff
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

