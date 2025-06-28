# OMG i use stow to manage my dotfiles OMG OMG... stfu 

# <esc> to go to vi mode. can move around history with vim motions.
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PATH=$PATH:~/go/bin
export PATH=$PATH:/home/par/clone/yazi/target/release
# export EDITOR="nvim"
# export VISUAL="nvim"

# sys maintainence alias
alias sdn="sudo shutdown now"

# other aliases
alias z="zathura"
alias ls="ls --color"
alias y="yazi"
alias v="vim"
alias c="clear"
alias q="exit"
alias e="exit"
alias sv="sudo vim"
alias sa="sudo apt"
alias sag="sudo apt-get"
alias wlist="nmcli device wifi list"
alias wcon="nmcli device wifi connect"
alias ..="cd .."
alias ll="ls -laF"
alias la="ls -A"
alias cc="cd ~/code/"
alias inv='vim $(fzf -m --preview="cat {}")'
alias nvim='vim'

# vi mode
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode # this shit is amazing

ZVM_VI_INSERT_ESCAPE_BINDKEY=kj


# load completions
autoload -U compinit && compinit

# keybinding for auto suggestion plugin
# also <kj> + l 
bindkey '^f' autosuggest-accept 

# adding history 
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
