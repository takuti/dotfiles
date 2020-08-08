# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my_theme"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=/usr/local/Cellar:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# embulk, digdag
export PATH="$HOME/.embulk/bin:$HOME/bin:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
alias vim='nvim'
alias vi='vim'
export XDG_CONFIG_HOME=~/.config

alias ls='ls -GF'

export LESS='-M -R -S -W -z-4 -x4'

autoload -Uz zmv
alias zmv='noglob zmv -W'

setopt no_beep
unsetopt nomatch

# do `ls` when change directory
function chpwd() { ls }

case ${OSTYPE} in
  darwin*)
    # Mac specific (mainly for homebrew)
    export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
    eval "$(direnv hook zsh)"
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    # for Octave (not aqua)
    export GNUTERM=x11

    # link each Julia version to `julia-xxx` command
    for julia_appname in $(ls /Applications | sed -n -E 's/(Julia-[0-9.]+)\.app.*/\1/p'); do
      alias $(echo $julia_appname | tr '[:upper:]' '[:lower:]')=/Applications/${julia_appname}.app/Contents/Resources/julia/bin/julia
    done
    # Use the latest version for `julia` command
    alias julia=/Applications/${julia_appname}.app/Contents/Resources/julia/bin/julia

    ;;
esac

# to enable shims and autocompletion add to your profile
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# no need to rehash
function gem(){
    $HOME/.rbenv/shims/gem $*
    if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
    then
        rbenv rehash
        rehash
    fi
}

# python
export PYTHONSTARTUP=$HOME/.pythonrc

export PATH=$HOME/.pyenv/sims:$PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
