# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# beacause oh-my-zsh and tmux don't get along some times
export DISABLE_AUTO_TITLE=true

# Make ansible a little more fun
export ANSIBLE_COW_SELECTION=random

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# lazy making aliases
alias bi='bundle install --binstubs'
alias vim='TERM=xterm-256color vim'
alias emacs='TERM=xterm emacs'

# remove ALL THE GEMS!
# http://geekystuff.net/2009/01/14/remove-all-ruby-gems/
alias clean-gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

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

if type 'go' > /dev/null; then
  export GOPATH=$HOME/src/go
fi

# Customize to your needs...
# Base path including homebrew
export PATH=/usr/local/bin:$PATH
# Android SDK
export PATH=$PATH:/Users/tylerpickett/android-sdk/platform-tools:/Users/tylerpickett/android-sdk/tools
# mysql
export PATH=$PATH:/usr/local/mysql/bin
# X11
export PATH=$PATH:/usr/X11/bin
# TeX
export PATH=$PATH:/usr/texbin
# Git
export PATH=$PATH:/usr/local/git/bin
# Node
export PATH=$HOME/.node/bin:$PATH

# Add CUDA
if [ -d /usr/local/cuda ]; then
  CUDA_HOME=/usr/local/cuda
  export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$CUDA_HOME/lib
  PATH=$PATH:$CUDA_HOME/bin
fi

if [ $GOPATH ]; then
  PATH=$GOPATH/bin:$PATH
fi

# Make things in my homedir the first to be tried for easy customization
export PATH=~/bin:$PATH

# if the heroku gem is installed for any version of ruby it fucks
# the toolbelt so the toolbelt has to be before rbenv on the path
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR=vim

# goodies for dinghy
export DOCKER_HOST=tcp://127.0.0.1:2376
export DOCKER_CERT_PATH=/Users/tpickett/.dinghy/certs
export DOCKER_TLS_VERIFY=1#
