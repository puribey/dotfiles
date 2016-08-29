set -gx PATH /usr/local/heroku/bin /Users/gianu/.rbenv/shims /Users/gianu/bin /Users/gianu/.cabal/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/git/bin /usr/local/go/bin /usr/local/sbin $PATH

alias ls "ls -G"
alias ll "ls -lG"
alias sr "screen -r"

alias pb "kaizoku"

alias weather "curl wttr.in"
alias moon "curl wttr.in/Moon"

set -U GREP_OPTIONS --color
set -U EDITOR vim
set -U ACK_COLOR_MATCH red

set -U LC_ALL en_US.UTF-8
set -U LANG en_US.UTF-8

ulimit -n 8192

set -U GOPATH ~/work/go
set -gx PATH $GOPATH/bin $PATH

# play with color
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_color_stagedstate green

# Status Chars
set __fish_git_prompt_char_dirtystate '💩 '
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_invalidstate 'U'
set __fish_git_prompt_char_untrackedfiles '⚡️ '
set __fish_git_prompt_char_stashstate 'w'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behing '↓'
set __fish_git_prompt_char_upstream_equal ''

function fish_prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname -fs)
  end
  echo -n "["
  set_color -o white
  echo -n -s "$USER"
  set_color normal
  echo -n "@"
  set_color -o red
  echo -n -s "$__fish_prompt_hostname"
  set_color normal
  echo -n " "
  set_color -o cyan
  echo -n (prompt_pwd)
  set_color normal
  echo -n " "
  echo -n (__fish_git_prompt)
  set_color normal
  echo -n "]\$ "
end

# Utility functions
function chtitle
  echo -n -e -s "\e]1;$1\a"
end

function topcommiters
  echo -n (git shortlog -sn)
end
