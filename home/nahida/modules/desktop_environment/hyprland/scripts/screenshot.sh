#!/usr/bin/env bash

outputDir="$HOME/Pictures/Screenshots/"
outputFile="snapshot_$(date +%Y-%m-%d_%H-%M-%S).png"
outputPath="$outputDir/$outputFile"
flag=false
mkdir -p "$outputDir"

case $1 in
area)
  if grimblast copysave area "$outputPath"; then
    flag=true
  fi
  ;;
*)
  if grimblast copysave screen "$outputPath"; then
    flag=true
  fi
  ;;
esac

if $flag; then
  recentFile=$(ls -t "$outputDir"/snapshot_*.png | head -n 1)
  notify-send "Grimblast" "Your snapshot has been saved." \
    -i video-x-generic \
    -a "Grimblast" \
    -t 7000 \
    -u normal \
    --action="scriptAction:-nautilus $outputDir=Directory" \
    --action="scriptAction:-xdg-open $recentFile=View"
fi
