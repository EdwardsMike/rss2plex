#!/bin/bash

DIR="/mnt/MEDIA/Music/Brain Damage/"

LATEST=$(curl -s http://floydpodcast.com/feed/podcast | parse_feed.pl - )

cd "$DIR"
MP3=$(echo $LATEST | cut -d '/' -f 8 )  ;

if [ ! -e $MP3 ]; then
    wget -qi $LATEST
fi
