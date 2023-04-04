#!/usr/bin/bash
# Variables
if [ -v 1 ]; then
    INPUT_PBIN="$1"
else
    INPUT_PBIN="./code.pbin"
fi

if [ ! -v OUTPUT_DIR ]; then
    OUTPUT_DIR="./"
fi

if [ ! -v TEMP_ZIP ]; then
    TEMP_ZIP="/tmp/doclic-panorama-extract.zip"
fi

# File checks
if [ ! -f $INPUT_PBIN ]; then
    echo "File $INPUT_PBIN doesn't exist"
    exit 1
fi

if [ ! -d $OUTPUT_DIR ]; then
    echo "Directory $OUTPUT_DIR doesn't exist"
    exit 1
fi

if [ -f $TEMP_ZIP ]; then
    echo "File $TEMP_ZIP already exists"
    exit 1
fi



# Extract
tail -c +517 $INPUT_PBIN > $TEMP_ZIP
unzip -d $OUTPUT_DIR $TEMP_ZIP > /dev/null
rm $TEMP_ZIP
