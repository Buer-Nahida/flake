str=$(crow -b -- "$(wl-paste $1)")
if [ -z "$str" ]; then
  exit
fi
notify-send "Transout" -- "$str"
