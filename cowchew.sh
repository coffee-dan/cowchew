#!/bin/sh
cow_face_list=($(cowsay -l | tail -n +2 | tr ' ' '\n'))

# generate random index
index=$(( $RANDOM % ${#cow_face_list[@]} ))

gum confirm "Are you feeling lucky?" && cowsay -f "${cow_face_list[$index]}" "$(fortune)" && exit

face=$(printf '%s\n' "${cow_face_list[@]}" | gum choose)

text=$(<&0)
if [ -z "$text" ]; then
  text=$(gum write --placeholder "edit or CTRL-D to finish")
fi

cowsay -f "$face" "$text"
