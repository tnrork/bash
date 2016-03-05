#!/bin/bash

#mkdir ~/indirilenMP3

menu(){

clear
echo "------------------"
echo "     MAIN MENU        "
echo " "
echo " "
echo -n "indirmek istediginiz sarkinin adini yaziniz > "
read bir iki uc dort bes alti

 }

search(){

lynx --dump https://www.youtube.com/results?search_query=$bir+$iki+$uc+$dort+$bes+$alti | awk '/http/{print $2}' | grep '/watch?v' > t.txt 
}


download(){

youtube-dl --extract-audio --audio-format mp3 $(cat t.txt | head -1) 

}
menu
search
download
