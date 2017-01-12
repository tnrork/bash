#mp3 indir kendimi geliştirmek için yazdığım bir program olup
#istediğiniz bir şarkıyı sadece terminal ekranına yazmanız yeterlidir.
#burada debian tabanlı bir dağıtım kullandığınızı farz ederek yapılmıştır
#gerekli durum bildirimi için tnrork@gmail.com adresine yazabilirsiniz.




#!/bin/bash





# gerekli paketleri yüklemek için
kontrol(){



if command -v youtube-dl >/dev/null 2>&1; then
  echo 'youtube-dl var '
else
  echo 'Sistemde program bulunnamadi yukleniyor'
  sudo apt-get -y install wget
  sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
  sudo chmod a+x /usr/local/bin/youtube-dl
  hash -r

fi



if command -v lynx >/dev/null 2>&1; then
  echo 'lynx var!'
else
  echo 'Sistemde program bulunnamadi yukleniyor'
  sudo apt-get -y install lynx
fi
}

#menü seçeneği
menu(){
clear
echo "------------------"
echo "     MAIN MENU        "
echo " "
echo " "
echo -n "indirmek istediginiz sarkinin adini yaziniz > "
read bir iki uc dort bes alti

 }

#arama seçeneği
search(){

lynx --dump https://www.youtube.com/results?search_query=$bir+$iki+$uc+$dort+$bes+$alti | awk '/http/{print $2}' | grep '/watch?v' > t.txt 
}

#indirme işlemi için deneyiniz
download(){

youtube-dl --extract-audio --audio-format mp3 $(cat t.txt | head -1) 

}

kontrol
menu
search
download
