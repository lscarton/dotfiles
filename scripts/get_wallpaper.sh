#!/bin/bash
fn_basedir=/tmp/
fn_index='.chromecast.html'
fn_image='wallpaper.jpg'

mkdir -p "$fn_basedir"

notify-send -i "wallpaper" "Changing wallpaper..." -h string:x-canonical-private-synchronous:anything

# Get page index
wget -q "https://clients3.google.com/cast/chromecast/home" -O "${fn_basedir}${fn_index}" 
if [ $? -ne 0 ]; then
  echo "Failed to get index from google chromecast"
  exit 1
fi

# Set image url
image_url=$(grep -oP 'https:\\/\\/lh3(.*?)-mv' "${fn_basedir}${fn_index}" | sed -e 's/\\//g' -e 's/u003d/=/g' | head -1)

# Get image
wget -q "$image_url" -O "${fn_basedir}${fn_image}" 
if [ $? -ne 0 ]; then
  echo "Failed to get image from www.googleusercontent.com"
  exit 1
fi

# Change wallpaper
sleep 1
feh --bg-fill "${fn_basedir}${fn_image}"

notify-send -i "wallpaper" "Wallpaper changed" -h string:x-canonical-private-synchronous:anything
exit 0
