#!/bin/bash

VENDOR=lenovo
DEVICE=A7010a48

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling $DEVICE files..."
for FILE in `cat proprietary-blobs.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /system/$FILE $BASE/$FILE
done

./setup-makefiles.sh
