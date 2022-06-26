# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

fpath+=~/.zfunc

# beacause oh-my-zsh and tmux don't get along some times
export DISABLE_AUTO_TITLE=true

# Make ansible a little more fun
export ANSIBLE_COW_SELECTION=random

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallifrey"

# lazy making aliases
[ -f '/usr/local/bin/arm-none-eabi-gdb' ] && alias agdb='/usr/local/bin/arm-none-eabi-gdb'
alias vim='TERM=xterm-256color vim'
# alias emacs='TERM=xterm emacs'
alias dc='docker-compose'
alias dcr='docker-compose run --rm'
alias insecure-chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security --user-data-dir=/Users/$USER/Library/Application\\ Support/Google/ChromeInsecure > /dev/null 2>&1 &"

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
plugins=(battery git)

source $ZSH/oh-my-zsh.sh

if type 'go' > /dev/null; then
  export GOPATH=$HOME/src/go
fi

# Customize to your needs...
# Base path including homebrew
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
# X11
export PATH=$PATH:/usr/X11/bin
# TeX
export PATH=$PATH:/usr/texbin
# Git
export PATH=$PATH:/usr/local/git/bin
# Node
export PATH=$HOME/.node/bin:$PATH

if [ $GOPATH ]; then
  PATH=$GOPATH/bin:$PATH
fi

if [[ -n "$(command -v rbenv)" ]];
then
  eval "$(rbenv init -)"
fi

# Make things in my homedir the first to be tried for easy customization
export PATH=~/bin:$PATH

export EDITOR=vim

vaulted_env() {
  [[ -n $VAULTED_ENV ]] || return
  if datetest now --lt $VAULTED_ENV_EXPIRATION; then
    local diff=$(datediff now $VAULTED_ENV_EXPIRATION -f %Hh%Mm)
  else
    local diff="%B%F{black}expired%f%b"
  fi
  echo -n "%U%F{magenta}%Bvaulted{%b%F{cyan}$VAULTED_ENV:l%f%F{black}%B-%b%F{cyan}$diff%F{magenta}%B}%b%f%u"
}

batt='$(battery_indicator)'
vault='$(vaulted_env)'

RPROMPT="${return_code} ${vault}"

if [[ -n "$(command -v rapture)" ]]
then
  eval "$( command rapture shell-init )"
fi

export CDPATH=.:~/src

if [[ -n "$(command -v thefuck)" ]]
then
  eval $(thefuck --alias)
fi

[ -f "~/esp/esp-idf/export.sh" ] && alias get_idf=". ~/esp/esp-idf/export.sh"

# Finally import system local stuff, if present
if [ -f ~/.zshrc-local ]
then
  source ~/.zshrc-local
fi
