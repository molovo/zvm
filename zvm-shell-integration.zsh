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
