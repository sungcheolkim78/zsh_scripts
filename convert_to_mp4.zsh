#!/usr/bin/zsh

emulate -LR zsh

for f in *.MTS
do
  # use % and # for parameter substitution
  newVideoName="video${${f%.MTS}##000}.mp4"
  
  # use [[ for if condition
	if [[ ! -f "$newVideoName" ]]; then
  
		echo "convert from $f to $newVideoName"
		
    # use ffmpeg with most compatitable setting. slower option is good for size optimization
    ffmpeg -i $f -c:v libx264 -c:a aac -vf format=yuv420p -movflags +faststart -preset slower $newVideoName
	fi
done
