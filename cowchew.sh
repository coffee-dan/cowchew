#!/bin/sh
face=$(cowsay -l | tail -n +2 | tr ' ' '\n' | gum choose)



if [[ -t 0 ]]; then
  text=$0
else
  text=$(gum write --value "$(fortune)" --placeholder "edit or CTRL-D to finish")
fi

cowsay -f "$face" "$text"
