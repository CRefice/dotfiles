#!/usr/bin/bash

export LOCATION=`curl -s 'http://ip-api.com/json/?fields=16401' | jq -e -r '@uri "\(.city),%20\(.country)"'`

for i in {1..5}; do
    text=$(curl -s "https://wttr.in/$LOCATION?format=1")
    if [[ $? == 0 ]]
    then
        tooltip=$(curl -s "https://wttr.in/$LOCATION?T0q")
        if [[ $? == 0 ]]; then
            jo text="$text" tooltip="$tooltip"
            exit
        fi
    fi
    sleep 2
done
jo text="error" tooltip="error"
