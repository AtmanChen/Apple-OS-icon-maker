
#!/bin/sh
# this bash need source image path to make size from 16 to 1024 Mac or iOS icons
# new icon name can specified and will be stored in ~/Desktop/appIcons/ folder




TIPS="*****"
echo $TIPS"SOURCE IMAGE PATH NEEDED:"$TIPS
read SOURCE_IMAGE_PATH
echo $TIPS"OUT IMAGE NAME NEEDED:"$TIPS
read ICON_NAME
echo $TIPS"MIN SIZE"$TIPS
read MIN_SIZE
echo $TIPS"MAX_SIZE"$TIPS
read MAX_SIZE

UNDERLINE="_"
SLASH="/"
PNGFORMAT=".png"
DOUBLETIMES="@2x"
TRIPLETIMES="@3x"
DESKTOP_PATH="~/Desktop"
ICON_DIRECTORY="appIcons"
MULTIPLE="x"
SEPARATOR="-----"

if [ ! -x $SOURCE_IMAGE_PATH ]; then
cd $DESKTOP_PATH
mkdir $ICON_DIRECTORY
cd $ICON_DIRECTORY
for((i=$MIN_SIZE;i<=$MAX_SIZE;i*=2)); do


  OUT_SIZE=$i
  OUT_SIZE_DOUBLE=$[$i * 2]
  OUT_SIZE_TRIPLE=$[$i * 3]

  OUT=$ICON_NAME$OUT_SIZE$MULTIPLE$OUT_SIZE$PNGFORMAT
  OUT_DOUBLE=$ICON_NAME$OUT_SIZE$MULTIPLE$OUT_SIZE$DOUBLETIMES$PNGFORMAT
  OUT_TRIPLE=$ICON_NAME$OUT_SIZE$MULTIPLE$OUT_SIZE$TRIPLETIMES$PNGFORMAT

  sips -z $OUT_SIZE $OUT_SIZE $SOURCE_IMAGE_PATH --out $OUT
  echo $SEPARATOR$OUT maded$SEPARATOR

  sips -z $OUT_SIZE_DOUBLE $OUT_SIZE_DOUBLE $SOURCE_IMAGE_PATH --out $OUT_DOUBLE
  echo $SEPARATOR$OUT_DOUBLE maded$SEPARATOR

  sips -z $OUT_SIZE_TRIPLE $OUT_SIZE_TRIPLE $SOURCE_IMAGE_PATH --out $OUT_TRIPLE
  echo $SEPARATOR$OUT_TRIPLE maded$SEPARATOR

  
done
fi

