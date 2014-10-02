FILE=poster.svg
i=1
FOLDER=$(pwd)
inkscape=inkscape
if [[ $(uname) == 'Darwin' ]]; then
  inkscape=/Applications/Inkscape.app/Contents/Resources/bin/inkscape
fi
cd ../../osp.work.visual-grammar
for COMMIT in $(git log --oneline $FILE | cut -f 1 -d " "); do 
  git checkout $COMMIT $FILE;
  cp $FILE $FOLDER/$i-$COMMIT-$FILE;
  $inkscape --export-png=$FOLDER/$i-$COMMIT-$FILE.png --export-dpi=18 $FOLDER/$i-$COMMIT-$FILE
  (( i = i + 1 ))
done
