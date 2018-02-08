#!bin/sh
LAST=$(echo "/`mocp -i|grep File:|cut -d '/' -f 2-5`")
cd "$LAST"
I=$(find . -name '*.jpg' -or -name '*.jpeg' -or -name '*.png')
if [ -f "$I" ]; then
    IMG0=$(find . -name '*.jpg' -or -name '*.jpeg' -or -name '*.png'|shuf -n1|xargs -0)
else
    IMG0=$(find . -name '*.jpg' -or -name '*.jpeg' -or -name '*.png'|cut -c2-|shuf -n1|xargs -0)   
fi
IMG=$(echo "$LAST/$IMG0")
X=$(mat --display "$IMG"|grep "Exif Image Width:"|cut -d ' ' -f 4)
Y=$(mat --display "$IMG"|grep "Exif Image Height:"|cut -d ' ' -f 4)
GEOMETRY=$(echo "$X"x"$Y")
i="100x100"

if [ "$i" != "$GEOMETRY" ]; then
    mogrify -adaptive-resize 100x100! "$IMG"
fi    
