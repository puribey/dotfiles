#############################
### Environment variables ###
#############################

export MAIN_EDITOR="nvim"
export EDITOR=$MAIN_EDITOR
export VISUAL=$EDITOR
export LSCOLORS='exfxcxdxbxegedabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
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
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export ACK_COLOR_MATCH='red'
export WORDCHARS='*?[]~&;!$%^<>'
export GO111MODULE=""
export GOPROXY=direct
export GOSUMDB=off
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"

export ANDROID_HOME=/Users/gianu/Library/Android/sdk
export PTYHON_HOME=/usr/local/Cellar/python/2.7.6

export PATH=$PATH:/Users/gianu/bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:${GOPATH}/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH="/usr/local/opt/terraform@0.13/bin:$PATH"
export PATH=$PATH:/$HOME/.local/scripts

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

fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit
prompt pure

############################
### Aliases              ###
############################

# alias ls='exa' #-G
# alias ps='procs'
# alias cat='bat'
# alias less='bat'
# alias grep='ripgrep'
# alias rg='ripgrep'
# alias nano='kibi'
# alias find='fd'
# alias du='dust'
# alias time='hyperfine"
# alias top='ytop'
alias iftop='bandwhich'
# alias hexdump='hx'
# alias objdump='bingrep'
# alias http-server='miniserve'
# alias license='licensor'

# alias ls='ls -G --color'
alias ls='ls -G'
alias ll='ls -lG'

alias lzd='lazydocker'

# alias pb='kaizoku'

alias yi='yarn install --pure-lockfile --mutex network'
alias yd='yarn dev'

alias mt='mix test'

# alias ssh="TERM=xterm-256color ssh"

alias vi="nvim"
alias vim="nvim"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias python="python3"

alias grep="grep --color"
alias fu="fnm use"
alias fuyi="fnm use && yarn install --pure-lockfile --mutex network"
alias mkt="make test-watch"
alias pi="pnpm install"

## Kubectl aliases for ClassDojo ##
alias kctl-west-prod='kubectl --context="aws/us-west-1-external"'

#############################
### Plugins configuration ###
#############################

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

expand-or-complete-with-waiting-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}

insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}

searchi () {
        selected_line=$(sk --ansi -i -c 'rg -i --line-number --color=always "{}"')
        split_lines=("${(@s/:/)selected_line}")
        if [[ ${#split_lines} > 1 ]]
        then
                nvim +${split_lines[2]} "${split_lines[1]}"
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


function chtitle {
    echo -ne "\033]0;"$*"\007"
}


function ecrlogin() {
  aws ecr get-login-password \
    --region us-east-1 \
| docker login \
    --username AWS \
    --password-stdin 347708466071.dkr.ecr.us-east-1.amazonaws.com
}

# Mob scripts

function mob-start() {
  if [ -z "$1" ]; then
    echo "You must provide a name for the branch."
    echo "eg.: mob-start my_branch 5"
    return 1
  fi

  if [ -z "$2" ]; then
    echo "You must provide a time for the duration of the mob round."
    echo "eg.: mob-start my_branch 5"
    return 2
  fi

  git checkout -b "$1" && git push origin "$1" --set-upstream --no-verify && mob start --include-uncommitted-changes $2;
}

#############
### Other ###
#############

. $HOME/.zshrc-private


eval "$(fnm env)"

ulimit -n 10240

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh


export PATH="/usr/local/opt/openjdk/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/gianu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$PATH:/Users/gianu/.local/bin"
# pnpm end
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# Enable asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

source ~/.api_tz_dont_delete
