#############################
### Environment variables ###
#############################

export MAIN_EDITOR="nvim"
export EDITOR=$MAIN_EDITOR
export VISUAL=$EDITOR
export LSCOLORS='exfxcxdxbxegedabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
# export PROMPT='%~$(git-prompt-info)$ '
export PROMPT='$(git-prompt-info) '
export WORDCHARS='*?_[]~=&;!#$%^(){}'
export FZF_DEFAULT_OPTS='--reverse --color="info:#000000,spinner:#000000" --prompt="  "'
export HISTFILE="$HOME/.history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export PAGER=less
export GIT_PAGER='less -F -X'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;47;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GREP_OPTIONS="--color"
export GREP_COLORS=auto
export GREP_COLOR=auto
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export ACK_COLOR_MATCH='red'
export WORDCHARS='*?[]~&;!$%^<>'
export GO111MODULE=on

export ANDROID_HOME=/Users/gianu/Library/Android/sdk
export PTYHON_HOME=/usr/local/Cellar/python/2.7.6
export GOPATH=/Users/gianu/work/go

export PATH=/usr/local/heroku/bin
export PATH=$PATH:/Users/gianu/bin
export PATH=$PATH:/Users/gianu/.cabal/bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools
export PATH=$PATH:${GOPATH}/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/Users/gianu/Library/flutter/bin

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8



#############################
### General configuration ###
#############################

setopt no_beep
setopt interactive_comments
setopt prompt_subst

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

setopt hup
setopt long_list_jobs
setopt notify

autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ''
# case-insensitive, partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


############################
### Aliases              ###
############################

alias ls='ls -G'
alias ll='ls -lG'

alias lzd='lazydocker'

alias pb='kaizoku'

alias yi='yarn install --pure-lockfile --mutext network'

alias mt='mix test'

alias ssh="TERM=xterm-256color ssh"

alias vi="nvim"
alias vim="nvim"

alias python="python3"

#############################
### Plugins configuration ###
#############################

source ~/.zsh/z.sh
unalias z

autoload -U colors && colors

####################
### Key bindings ###
####################
bindkey -e

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '\eb' backward-word
bindkey '\ef' forward-word
bindkey '\ed' kill-word
bindkey '^k' kill-line
bindkey '^d' delete-char
bindkey '\ew' backward-kill-word
bindkey '^u' backward-kill-line
bindkey '^r' history-incremental-search-backward

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^p' up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search

zmodload zsh/complist
bindkey -M menuselect '^e' accept-line
bindkey -M menuselect '\ef' menu-complete
bindkey -M menuselect '\eb' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

zle -N insert-last-command-output
bindkey '^x^l' insert-last-command-output

autoload -U copy-earlier-word
zle -N copy-earlier-word
bindkey '^[m' copy-earlier-word

zle -N expand-or-complete-with-waiting-dots
bindkey '^i' expand-or-complete-with-waiting-dots

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

zle -N fancy-ctrl-z;
bindkey '^z' fancy-ctrl-z

zle -N exit-shell
bindkey '^Sx' exit-shell

bindkey -N paste
zle -N start-paste
bindkey '^[[200~' start-paste
zle -N end-paste
bindkey -M paste '^[[201~' end-paste
zle -N paste-insert paste-insert
bindkey -R -M paste "^@"-"\M-^?" paste-insert
bindkey -M paste -s '^M' '^J'

# bindkey -M emacs 'â' backward-word
# bindkey -M emacs 'æ' forward-word
# bindkey -M emacs 'ä' kill-word
# bindkey -M menuselect 'æ' menu-complete
# bindkey -M menuselect 'â' reverse-menu-complete
# bindkey '®' insert-last-word

#################
### Functions ###
#################

git-prompt-info() {
  git rev-parse --is-inside-work-tree &>/dev/null

  if [[ $? -eq 0 ]]; then
    echo "[%{$fg_bold[white]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%} $(current-git-branch) $(git-dirty)%{$reset_color%}]$"
  else
    echo "[%{$fg_bold[white]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%}]$"
  fi

  # echo " %F{green}($(current-git-branch)%f $(git-dirty)%F{green})%f"

}

current-git-branch() {
  git symbolic-ref --short -q HEAD
}

git-dirty() {
  test -z "$(command git status --porcelain --ignore-submodules -unormal)"
  if [[ $? -eq 1 ]]; then
    echo '%F{red}✗%f'
  else
    echo '%F{green}✔%f'
  fi
}

expand-or-complete-with-waiting-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}

insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}

fancy-ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

exit-shell() {
  exit
}

start-paste() {
  bindkey -A paste main
}

end-paste() {
  bindkey -e
  LBUFFER+=$_paste_content
  unset _paste_content
}

paste-insert() {
  _paste_content+=$KEYS
}


activate_virtualenv() {
  if [ -f env/bin/activate ]; then . env/bin/activate;
  elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
  elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
  elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
  elif [ -f ./bin/activate ]; then . ./bin/activate;
  fi
}

function whodoneit() {
  (set -e &&
    for x in $(git grep -I --name-only $1); do
      git blame -f -- $x | grep $1;
    done
  )
}

function chtitle {
    echo -ne "\033]0;"$*"\007"
}


function ecrlogin() {
  $(aws ecr get-login --no-include-email --region us-east-1)
}

function nuse() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm use
}

#############
### Other ###
#############

. $HOME/.zshrc-private


export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ulimit -n 10240

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
