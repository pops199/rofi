#!/bin/sh

# /---------------------\
# | PPPP OOOO PPPP SSSS |
# | P  P O  O P  P S    |
# | PPPP O  O PPPP SSSS |
# | P    O  O P       S |
# | P    OOOO P    SSSS |
# \---------------------/ 
#
# Author: Johan Odendaal


# Give your input to dmenu (bash could work, but ? character triggers zsh globs and other annoying terminal bugs)
targeturl="$(rofi -dmenu -p Enter_URL </dev/null)"

# Pass targeturl to youtube downloader (works for any kind of video)
yt-dlp -f 'ba' -x --audio-format mp3 -P /home/johan/Music "$targeturl"
