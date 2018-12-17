#!/usr/bin/env zsh

function _current_epoch() {
  echo $(date +%s)
  # echo $(( $EPOCHSECONDS / 60 / 60 / 24 ))
}

function _update_dotfiles_update() {
  echo "LAST_EPOCH=$(_current_epoch)" >! ${DOTFILES}/.dotfiles-update
}

function _upgrade_dotfiles() {
  # Use colors, but only if connected to a terminal, and that terminal
  # supports them.
  if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi

  printf "${BLUE}%s${NORMAL}\n" "Updating Hawkins' Dotfiles..."
  cd "$DOTFILES"
  if git pull --rebase --stat origin master
  then
    # Text from http://www.patorjk.com/software/taag/#p=display&h=0&f=Sub-Zero&t=hawkins
    printf '%s' "$GREEN"
    printf '%s\n' ' __  __     ______     __     __     __  __     __     __   __     ______   '
    printf '%s\n' '/\ \_\ \   /\  __ \   /\ \  _ \ \   /\ \/ /    /\ \   /\ "-.\ \   /\  ___\  '
    printf '%s\n' '\ \  __ \  \ \  __ \  \ \ \/ ".\ \  \ \  _"-.  \ \ \  \ \ \-.  \  \ \___  \ '
    printf '%s\n' ' \ \_\ \_\  \ \_\ \_\  \ \__/".~\_\  \ \_\ \_\  \ \_\  \ \_\\"\_\  \/\_____\'
    printf '%s\n' '  \/_/\/_/   \/_/\/_/   \/_/   \/_/   \/_/\/_/   \/_/   \/_/ \/_/   \/_____/'
    printf '%s\n' '                                                                            '
    printf "${BLUE}%s\n" "Hooray! Dotfiles have been updated and/or are  at the current version."
  else
    printf "${RED}%s${NORMAL}\n" 'There was an error updating. Do you have any unstaged changes?'
  fi
}

epoch_target=$UPDATE_DOTFILES_DAYS
if [[ -z "$epoch_target" ]]; then
  # Default to old behavior
  epoch_target=$((3 * 86400))
fi

# Cancel upgrade if the current user doesn't have write permissions
[[ -w "$DOTFILES" ]] || return 0

if [ -f ${DOTFILES}/.dotfiles-update ]; then
  . ${DOTFILES}/.dotfiles-update

  if [[ -z "$LAST_EPOCH" ]]; then
    # Create the dotfiles update if it does not yet exist
    _update_dotfiles_update && return 0
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]; then
    echo "[Hawkins Dotfiles] Would you like to update? [Y/n]: \c"
    read line
    if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
      _upgrade_dotfiles
    fi
  fi
else
  # create the update time file
  _update_dotfiles_update
fi
