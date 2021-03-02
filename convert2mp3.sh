#!/usr/bin/bash

# Place this inside the folder where you wish to convert files
# This script relies on parallel for faster mp3 conversion
# And on ffmpeg to do the converting

for filename in $(ls)
do
	ext=${filename##*\.}
	case "$ext" in
	flac) #checks if there are flac files in folder
		parallel ffmpeg -i {} -qscale:a 0 {.}.mp3 ::: ./*.flac #converts flac files to mp3
		sleep 5 #sleeps for 5 seconds so you have time to see if there are errors
		break #breaks the loop
		;;
	ogg)
		parallel ffmpeg -i "{}" "{.}.mp3" ::: ./*.ogg
		sleep 5
		break
		;;
	wav)
		parallel ffmpeg -i "{}" "{.}.mp3" ::: ./*.wav
		sleep 5
		break
		;;
	acc)
		parallel ffmpeg -i "{}" "{.}.mp3" ::: ./*.acc
		sleep 5
		break
		;;
	ape)
		parallel ffmpeg -i "{}" "{.}.mp3" ::: ./*.ape
		sleep 5
		break
		;;
esac
done

if [ -d 'mp3filut' ]; then #rename this if you want | checks if the folder exists
	:
else
	mkdir 'mp3filut' #creates a folder for files
fi

mv *.mp3 mp3filut/ #moves newly created mp3 files into the folder
