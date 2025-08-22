#!/bin/bash

# Dirs to look for projects
DIRS=(
  $HOME/Documents
  $HOME/Projects
  $HOME/Projects/Work
  $HOME/Projects/Personal
)

# if arg given open that as session, otherwise use fzf
if [[ $# -eq 1 ]]; then
  SELECTED_PATH=$1
else
  SELECTED_PATH=$(fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path \
    | sed "s|^$HOME/||" \
    | fzf --margin 10% --color="bw")
  SELECTED_PATH="$HOME/$SELECTED_PATH"
fi

SESSION_NAME=$(basename "$SELECTED_PATH" | tr . _)

# Check if the tmux session exists
tmux has-session -t $SESSION_NAME 2>/dev/null
if [ $? != 0 ]; then
  # Create the tmux session and windows
  tmux new-session -ds $SESSION_NAME -c $SELECTED_PATH
  # Add more windows
  tmux new-window -t $SESSION_NAME:1 -n "nvim" -c $SELECTED_PATH
  tmux new-window -t $SESSION_NAME:2 -n "bash" -c $SELECTED_PATH
  # Send command "open editor" to window
  tmux send-keys -t $SESSION_NAME:1 "nvim" C-m
fi

# Attach to the tmux session
tmux switch-client -t "$SESSION_NAME"
