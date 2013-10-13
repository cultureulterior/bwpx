for i in *.png; do
   pngcrush -rem alla -rem text -bit_depth 2 $i $i.crush
   echo -n "<img id=\"$i\" src=\"data:image/png;base64," > $i.b64
   openssl enc -a -A -in $i.crush >> $i.b64
   echo -n '"/>' >> $i.b64
done
cat *.b64 > images.html
cat images.html
