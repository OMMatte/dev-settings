# This file should be placed in .oh-my-zsh/custom

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
COLOR_PINK="\e[95m"

function get_git_color {
 local git_status="$(git status 2> /dev/null)"
  if [[ $git_status =~ "git add <file>..." ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_GREEN
  elif [[ $git_status =~ "working tree clean" ]]; then
    
  else
    echo -e $COLOR_PINK
  fi
}

function git_prompt_info() {
local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$(get_git_color)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}