
#!/bin/bash

EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'

degisken(){
clear
mkdir ~/indirilendosyalar
touch ~/indirilendosyalar/linkler2.txt
DIR=~/indirilendosyalar/linkler2.txt

cd ~/indirilendosyalar
}

show_menus() {
	
clear
echo "~~~~~~~~~~~~~~~~~~~~~"    
echo " M A I N - M E N U"
echo "~~~~~~~~~~~~~~~~~~~~~"
echo " "
echo " "
echo -n "Indirmek istediginiz icerigin linkine giriniz >" 
read url
echo "Hangi türde dosya indirmek istiyorsunuz?..."
echo "1. pdf "
echo "2. jpg"


}

read_options(){
	local choice
	read -p "Enter choice [ 1 - 2] " choice


case $choice in
1) pdf ;;
2) jpg ;; 
3) exit 0;;
*) echo -e "${RED}Hata...${STD}" && sleep 2 	
esac	
	}

pdf(){
		echo "pdf seceniğini seçtiniz"
		format=pdf
		indirme
	}

jpg(){
		echo "jpg sectiniz"
		format=jpg
		indirme
	}

indirme(){
	
	lynx --dump $url | awk '/http/{print $2}' | grep $format  >> $DIR
	echo "ha?"
	for i in $( cat $DIR ); do wget $i; done
	rm -rf $DIR
	clear
	#buraya if dosya var mı komutu gelecek..
	echo "Dosyaniz basarili bir sekilde indirilmistir"
	cd ~/indirilendosyalar
	echo -e "${RED}Dosyalariniz görüntüleniyor...${STD}" && sleep 2
	echo " "
	echo " "
	echo " "
	
	ls -l 
	}



#main menü alanı

#while true
#do

#degisken
degisken
show_menus
read_options


#done
