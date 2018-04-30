#!/bin/bash

border_spacing=${border_spacing:-15}
module_spacing=${module_spacing:-30}
bar_left=(desktops weather)
bar_right=(volume battery date clock)

PANEL_FIFO="${HOME}/.panel-fifo"
if ! [[ -p $PANEL_FIFO ]]; then
	rm -f "${PANEL_FIFO}"
	mkfifo -m 0600 "${PANEL_FIFO}" || exit 1
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="${DIR}/modules"
FORMATTER="${DIR}/format-module.sh"

MODULES_ALL=("${bar_left[@]}" "${bar_center[@]}" "${bar_right[@]}")

# Initialize modules
for module in "${MODULES_ALL[@]}"; do
	MODULE_PATH="${MODULES_DIR}/${module}.bar"
	"$MODULE_PATH" --init "$PANEL_FIFO" || echo "Failed to init module"
done

# The variable that will store array elements
declare -A MODULES_ARR

# List of all the monitors/screens you have in your setup
Monitors=$(xrandr | grep -o "^.* connected" | sed "s/ connected//")

while :; do
    while read -r line; do
			# Try to feed line to every module.
			# Inefficient, but easier to customize:
			# this way each module can define what string
			# they want to consume, instead of it being forcefully
			# fed to them by the formatter.
			for module in "${MODULES_ALL[@]}"; do
				MODULE_PATH="${MODULES_DIR}/${module}.bar"
				var="$(echo $line | $MODULE_PATH)" && MODULES_ARR[$module]="$(echo $var | $FORMATTER)"
			done

			MONITORNUM=0
			for m in $(echo "$Monitors"); do                                        
				echo -n "%{S${MONITORNUM}}"
				let MONITORNUM=$MONITORNUM+1                                                          
				# Left side
				echo -n "%{l}%{O${border_spacing}}"
				for module in "${bar_left[@]}"; do
					printf "%s%%{O${module_spacing}}" "${MODULES_ARR[${module}]}"
				done

				# Center
				echo -n "%{c}"
				for module in "${bar_center[@]}"; do
					printf "%s%%{O${module_spacing}}" "${MODULES_ARR[${module}]}"
				done

				echo -n "%{r}"
				# Right side
				for module in "${bar_right[@]}"; do
					printf "%%{O${module_spacing}}%s" "${MODULES_ARR[${module}]}"
				done
				echo -n "%{O${border_spacing}}"
			done
			printf "\n"

    done < "$PANEL_FIFO"
done
