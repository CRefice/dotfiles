#! /bin/bash
function devenv() {
if [[ $# -eq 0 ]]; then
	DIR="$(pwd)"
else
	DIR="$1"
fi
cd $DIR
SESS_NAME="$(basename $DIR)"
tmux new-session -d -s "$SESS_NAME"
tmux rename-window "code"
tmux split-window -h
tmux resize-pane -R 25
tmux -2 attach-session -d
}
