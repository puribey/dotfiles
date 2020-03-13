#############################
### Environment variables ###
#############################

set -Ux MAIN_EDITOR "nvim"
set -Ux EDITOR $MAIN_EDITOR
set -Ux VISUAL $EDITOR
set -Ux LSCOLORS 'exfxcxdxbxegedabagacad'
set -Ux LS_COLORS 'di 34:ln 35:so 32:pi 33:ex 31:bd 36;01:cd 33;01:su 31;40;07:sg 36;40;07:tw 32;40;07:ow 33;40;07:'
# set -Ux PROMPT '%~$(git-prompt-info)$ '
# set -Ux PROMPT '$(git-prompt-info) '
set -Ux WORDCHARS '*?_[]~ &;!#$%^(){}'
set -Ux FZF_DEFAULT_OPTS '--reverse --color "info:#000000,spinner:#000000" --prompt "  "'
set -Ux HISTFILE "$HOME/.history"
set -Ux HISTSIZE 100000
set -Ux SAVEHIST $HISTSIZE
set -Ux PAGER less
set -Ux GIT_PAGER 'less -F -X'
set -Ux LESS_TERMCAP_mb '\E[01;31m'
set -Ux LESS_TERMCAP_md '\E[01;31m'
set -Ux LESS_TERMCAP_me '\E[0m'
set -Ux LESS_TERMCAP_se '\E[0m'
set -Ux LESS_TERMCAP_so '\E[00;47;30m'
set -Ux LESS_TERMCAP_ue '\E[0m'
set -Ux LESS_TERMCAP_us '\E[01;32m'
set -Ux GREP_OPTIONS "--color"
set -Ux GREP_COLORS auto
set -Ux GREP_COLOR auto
set -Ux HOMEBREW_NO_ANALYTICS 1
set -Ux HOMEBREW_NO_AUTO_UPDATE 1
set -Ux PIP_DOWNLOAD_CACHE $HOME/.pip/cache
set -Ux ACK_COLOR_MATCH 'red'
set -Ux WORDCHARS '*?[]~&;!$%^<>'
set -Ux GO111MODULE ""
set -Ux GOPROXY direct
set -Ux GOSUMDB off
set -Ux PKG_CONFIG_PATH "/usr/local/opt/libffi/lib/pkgconfig"
set -Ux LDFLAGS "-L/usr/local/opt/libffi/lib"
set -Ux CPPFLAGS "-I/usr/local/opt/libffi/include"

set -Ux ANDROID_HOME /Users/gianu/Library/Android/sdk
set -Ux PTYHON_HOME /usr/local/Cellar/python/2.7.6
set -Ux GOPATH /Users/gianu/work/go

set -U fish_user_paths /usr/local/heroku/bin /Users/gianu/bin /Users/gianu/.cabal/bin $HOME/.bin ./node_modules/.bin /usr/local/git/bin $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools $HOME/.cargo/bin /Users/gianu/Library/flutter/bin $GOPATH/bin $fish_user_paths

set -Ux LC_ALL en_US.UTF-8
set -Ux LANG en_US.UTF-8


############################
### Aliases              ###
############################

# alias ls 'exa' #-G
# alias ps 'procs'
# alias cat 'bat'
# alias less 'bat'
# alias grep 'ripgrep'
# alias rg 'ripgrep'
# alias nano 'kibi'
# alias find 'fd'
# alias du 'dust'
# alias time 'hyperfine"
# alias top 'ytop'
alias iftop 'bandwhich'
# alias hexdump 'hx'
# alias objdump 'bingrep'
# alias http-server 'miniserve'
# alias license 'licensor'

alias ls 'ls -G'
alias ll 'ls -lG'

alias lzd 'lazydocker'

alias pb 'kaizoku'

alias yi 'yarn install --pure-lockfile --mutex network'

alias mt 'mix test'

# alias ssh "TERM xterm-256color ssh"

alias vi "nvim"
alias vim "nvim"

alias python "python3"


#############
### Other ###
#############

. ~/.config/fish/fish-private


set -Ux NVM_DIR "$HOME/.nvm"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ulimit -n 10240

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/local/share/autojump/autojump.fish ]; . /usr/local/share/autojump/autojump.fish

starship init fish | source

