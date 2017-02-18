#!/usr/bin/env zsh

typeset -g ZVM_DIR=${ZVM_DIR:-"${ZDOTDIR:-$HOME}/.zvm"}

path=(
  ${ZVM_DIR}/bin
  ${ZVM_DIR}/scripts
  $path
)

fpath=(
  ${ZVM_DIR}/site-functions
  ${ZVM_DIR}/functions
  $fpath
)

manpath=(
  ${ZVM_DIR}/man
  $manpath
)

autoload -U add-zsh-hook
load-zvmrc() {
  if [[ -n ${ZVM_AUTO_USE} && -f .zvmrc && -r .zvmrc ]]; then
    zvm use
  fi
}
add-zsh-hook chpwd load-zvmrc
