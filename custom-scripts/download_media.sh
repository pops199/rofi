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

# Select what media you want to download

selected=$(echo "MP3\nVIDEO" | rofi -dmenu -i -p "Do you want to download the Video or MP3?")
file2=$(find /home/johan/Videos -type f -printf "%f\n" | sort -n | tail -l | head -1)
# # Give your input to dmenu (bash could work, but ? character triggers zsh globs and other annoying terminal bugs)

if [ "$selected" = "MP3" ]; then
  targeturl="$(rofi -dmenu -p Enter_URL </dev/null)";

# Pass targeturl to youtube downloader (works for any kind of video)
  yt-dlp -f 'ba' -x --audio-format mp3 -P /home/johan/Music "$targeturl";
  file1=$(find /home/johan/Music -type f -printf "%f\n" | sort -n | tail -l | head -1);
# Sends Notification
  notify-send -u normal 'Download Media' "$file1\n \n Downloaded Successful"

#  more=$(echo "Download More" | rofi -dmenu -i -p "DONE")

fi

# Give your input to dmenu (bash could work, but ? character triggers zsh globs and other annoying terminal bugs)

if [ "$selected" = "VIDEO" ]; then
  targeturl="$(rofi -dmenu -p Enter_URL </dev/null)";

# Pass targeturl to youtube downloader (works for any kind of video)

  yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -P /home/johan/Videos "$targeturl";
# Sends Notification
  notify-send -u normal 'Download Media' "$file2\n \n Downloaded Successful"
fi
