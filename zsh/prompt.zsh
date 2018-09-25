#!/usr/bin/zsh

function precmd {
PROMPT='%F{blue}%~%f'
if [ -d .git ] || git rev-parse --git-tree &> /dev/null; then
	PROMPT+=" on %B%F{blue}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
	STATUS="$(git status 2> /dev/null)"
	if [[ ! $STATUS =~ 'nothing to commit' ]]; then
		PROMPT+='*'
	fi 
	PROMPT+='%b%f'

fi
PROMPT+="
%B%(?.%F{green}.%F{red})"
if [ -z "$DISPLAY" ]; then
	PROMPT+='>'
else
	PROMPT+='❯'
fi

PROMPT+='%f%b '
}
