LAST=$(echo "/`mocp -i|grep File:|cut -d '/' -f 2-5`")
cover="cover.jpg"
IMG=$(echo "$LAST/$cover")
X=$(mat --display "$IMG"|grep "Exif Image Width:"|cut -d ' ' -f 4)
Y=$(mat --display "$IMG"|grep "Exif Image Height:"|cut -d ' ' -f 4)
GEOMETRY=$(echo "$X"x"$Y")
i="100x100"

if [ $i != $GEOMETRY ]; then
    mogrify -adaptive-resize 100x100! "$IMG"
fi    
