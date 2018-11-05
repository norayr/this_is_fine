#download
youtube-dl -k https://www.youtube.com/watch?v=0oBx7Jg4m-o
mplayer -vo jpg "This is Fine-0oBx7Jg4m-o.f137.mp4"


RSZ="-resize %25"
DEL="-delay 1"
set -x

#str=00000050
#convert ${str}.jpg -fill '#f9ec50' -draw 'rectangle 1620,950 1820,1050'  000000${str}.png
#convert ${str}.png $RSZ ${str}_.png
str=""
for i in `seq 50 92`
do
   convert 000000${i}.jpg -fill '#f9ec50' -draw 'rectangle 1620,950 1820,1050'  000000${i}.png
   convert 000000${i}.png $RSZ  000000${i}_.png
  if [[ -n "$str" ]]
  then
    str="$str 000000${i}_.png "
  else
    str="000000${i}_.png "
  fi
  
  #echo $str
done
convert -loop 0 $DEL $str test.gif

