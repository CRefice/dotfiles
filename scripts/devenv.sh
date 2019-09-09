#! /bin/bash
function devenv() {
	if [[ $# -eq 0 ]]; then
		DIR="$(pwd)"
	else
		DIR="$1"
	fi
	SESS_NAME="$(basename $DIR)"
	(cd $DIR && launch_tmux)
}

function launch_tmux() {
	tmux new-session -s "$SESS_NAME" -d
	tmux rename-window "code"
	tmux split-window -h
	tmux resize-pane -R 22
	tmux -2 attach-session -d
}
