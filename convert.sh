#download
youtube-dl -k https://www.youtube.com/watch?v=0oBx7Jg4m-o
mplayer -vo jpeg 'This is Fine-0oBx7Jg4m-o.f137.mp4'


RSZ="-resize %25"
DEL="-delay 1"
set -x

str=""
for i in `seq 50 92`
do
   #apply a patch (draw rectangle) to erase '[adult swim]' writing.
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

#make actual gif
convert -loop 0 $DEL $str test.gif

