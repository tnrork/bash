# Bu program klsörde bulunan videoları mp3 dosyasına çeviriyor bütün avileri video formatına çevirmek yeterli.

#!/bin/bash
for f in *.avi
do
    name=`echo "$f" | sed -e "s/.avi$//g"`
#        ffmpeg -i "$f" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "$name.mp3"
        avconv -i "$f" -threads auto -vn -c:a libmp3lame -qscale:a 3 "$name.mp3"
  #      avconv -i the.it.crowd.s01e04.ws.dvdrip.xvid-ingot.avi -threads auto -vn -c:a libmp3lame -qscale:a 3 output.mp3

        done

