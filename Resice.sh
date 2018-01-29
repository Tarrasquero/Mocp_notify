IMG=/tmp/cover.jpg
X=$(mat --display "$IMG"|grep "Exif Image Width:"|cut -d ' ' -f 4)
Y=$(mat --display "$IMG"|grep "Exif Image Height:"|cut -d ' ' -f 4)
GEOMETRY=$(echo "$X"x"$Y")
i="100x100"

if [ $i != $GEOMETRY ]; then
    mogrify -resize 100x100! $IMG
fi    