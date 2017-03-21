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

typeset -g ZVM_GLOBAL_VERSION

autoload -U add-zsh-hook
load-zvmrc() {
  if [[ $ZVM_AUTO_USE -ne 1 ]]; then
    return
  fi

  version=$(zvm dir --quiet 2>&1)
  if [[ -n $version ]]; then
    if [[ $version != $(zvm current) ]]; then
      ZVM_GLOBAL_VERSION=$(zvm current)
      zvm use $version
    fi

    return
  fi

  if [[ -n $ZVM_GLOBAL_VERSION ]]; then
    zvm use ${ZVM_GLOBAL_VERSION}
    ZVM_GLOBAL_VERSION=''
  fi
}
add-zsh-hook chpwd load-zvmrc
