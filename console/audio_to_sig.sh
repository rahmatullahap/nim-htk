#!/bin/bash
for f in data/train/raw/*.mp4; do 
    if [ -f "$f" ]
    then
        NEW_FILE_NAME="${f/%\.mp4/\.wav}"
        echo $NEW_FILE_NAME
        ffmpeg -i "$f" "$NEW_FILE_NAME" -y
    fi
done
for f in data/train/raw/*.m4a; do 
    if [ -f "$f" ]
    then
        NEW_FILE_NAME="${f/%\.m4a/\.wav}"
        echo $NEW_FILE_NAME
        ffmpeg -i "$f" "$NEW_FILE_NAME" -y
    fi
done
for f in data/train/raw/*.mpeg; do 
    if [ -f "$f" ]
    then
        NEW_FILE_NAME="${f/%\.mpeg/\.wav}"
        echo $NEW_FILE_NAME
        ffmpeg -i "$f" "$NEW_FILE_NAME" -y
    fi
done
for f in data/train/raw/*.mp3; do 
    if [ -f "$f" ]
    then
        NEW_FILE_NAME="${f/%\.mp3/\.wav}"
        echo $NEW_FILE_NAME
        ffmpeg -i "$f" "$NEW_FILE_NAME" -y
    fi
done
for f in data/train/raw/*.wav; do
    if [ -f "$f" ]
    then
        NEW_FILE_NAME="${f/\/raw\//\/sig\/}"
        NEW_FILE_NAME="${NEW_FILE_NAME/%\.wav/\.sig}"
        echo $NEW_FILE_NAME
        HCopy -C hcopy.conf "$f" "$NEW_FILE_NAME"
    fi
done

