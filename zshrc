# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles/oh-my-zsh
DISABLE_AUTO_UPDATE=true

# no autocorrect
unsetopt correct_all

# zmv function
autoload -U zmv

# Keychain
# Re-use ssh-agent/gpg-agent between logins
# /usr/bin/keychain $HOME/.ssh/id_rsa > /dev/null 2>&1
# source $HOME/.keychain/$HOST-sh

export EDITOR=vim

alias g=git
alias l="ls -ahl | sort -k 9"
alias v=vim
alias c=clear
alias tm='TERM=screen-256color exec tmux'
# alias kon='sudo su root -c "echo 1 >> /sys/class/leds/asus\:\:kbd_backlight/brightness"'
# alias koff='sudo su root -c "echo 0 >> /sys/class/leds/asus\:\:kbd_backlight/brightness"'
# alias bu="xbacklight +20"
# alias bd="xbacklight -20"
# alias xclip="xclip -selection c"

# go stuff
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin

# android
export PATH=$PATH:$HOME/Library/Android/Sdk/tools:$HOME/Library/Android/Sdk/platform-tools
alias astudio=~/android-studio/bin/studio.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dracula"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/sbin:/usr/sbin
source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/funcs.sh

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
