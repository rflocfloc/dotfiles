#!/bin/bash

DIRS=(
  $HOME/Documents
  $HOME/Projects
  $HOME/Projects/Work
  $HOME/Projects/Personal
)

switch_to_tmux (){
  if [[ -z $TMUX ]]; then
    tmux attach-session -t "$1"
  else
    tmux switch-client -t "$1"
  fi
}

tmux_has_session (){
  tmux has-session -t "$1" 2>/dev/null
}

if [[ $# -eq 1 ]]; then
  SELECTED_PATH=$1
else
  SELECTED_PATH=$(
    fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path \
    | sed "s|^$HOME/||" \
    | fzf --margin 10% --color="bw"
  )
  SELECTED_PATH="$HOME/$SELECTED_PATH"
fi

if [[ -z "$SELECTED_PATH" ]]; then
  echo "No path selected."
  exit 1
fi

# if path does not exist create dir
if [[ ! -d $SELECTED_PATH ]]; then
  read -p "Directory '$SELECTED_PATH' doesn\'t exists. Create it? (y/n)" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p $SELECTED_PATH
  fi
fi

SESSION_NAME=$(basename "$SELECTED_PATH" | tr . _)
TMUX_RUNNING=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $TMUX_RUNNING ]]; then
  tmux new-session -s $SESSION_NAME -c $SELECTED_PATH
  exit 0
fi

if ! tmux_has_session $SESSION_NAME; then
  tmux new-session -ds $SESSION_NAME -c $SELECTED_PATH
fi

switch_to_tmux $SESSION_NAME
exit 0
