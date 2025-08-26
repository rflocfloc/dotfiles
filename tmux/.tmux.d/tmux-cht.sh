#!/usr/bin/env bash
# Thanks ThePrimeagen
#
LANG=~/.tmux.d/tmux-cht-languages
CMD=~/.tmux.d/tmux-cht-command

selected=`cat $LANG $CMD | fzf --color="bw"`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" $LANG; then
    query=`echo $query | tr ' ' '+'`
    tmux split-window -h bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux split-window -h bash -c "curl -s cht.sh/$selected~$query | less"
fi
