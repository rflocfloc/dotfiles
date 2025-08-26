#!/bin/bash

DIRS=(
  $HOME/Documents
  $HOME/Projects
  $HOME/Projects/Work
  $HOME/Projects/Personal
)

if [[ $# -eq 1 ]]; then
  SELECTED_PATH=$1
else
  SELECTED_PATH=$(
    fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path \
    | sed "s|^$HOME/||" \
    | fzf --color="bw"
  )
  SELECTED_PATH="$HOME/$SELECTED_PATH"
fi

if [[ -z $SELECTED_PATH ]]; then
    exit 0
fi

SELECTED_NAME=$(basename "$SELECTED_PATH" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $SELECTED_NAME -c $SELECTED_PATH
    exit 0
fi

if ! tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
    tmux new-session -ds $SELECTED_NAME -c $SELECTED_PATH
fi

tmux switch-client -t $SELECTED_NAME
