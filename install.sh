#!/bin/bash

echo "This script is going to set up everything you need"
echo "to compile and flash C/C++ code onto AVR µC for MacOS"
echo "for your user only!"
echo "Inteded for use with VSCode / AVR Helper"
echo ""
echo "Files are going to be installed to ~/.avr"

## Prep
TARGET_DIR="$HOME/.avr"
mkdir -p "$TARGET_DIR"

## Download AVR
# AVR binaries need to be 64bit!
# Some distributions still contain 32bit,
# but a safe one is Arduino
DL_FOLDER="$TARGET_DIR/download"
DL_ZIP="$DL_FOLDER/arduino.zip"
mkdir -p "$DL_FOLDER"
echo "=== Downloading Arduino AVR ==="
if test -f "$DL_ZIP"; then
    echo "$DL_ZIP already present, skipping download"
else
    curl -o "$DL_ZIP" 'https://downloads.arduino.cc/arduino-1.8.13-macosx.zip'
fi
if test ! -f "$DL_ZIP"; then
    echo "Aborted: download failed"
    exit 1
fi

## Throw away unneeded Arduino stuff
echo "=== Extracting Arduino AVR ==="
rm -rf "$DL_FOLDER/Arduino.app"
(
    cd "$DL_FOLDER"
    unzip "$DL_ZIP"
    cd "Arduino.app/Contents/Java/hardware/tools/avr/"
    cp -r * "$TARGET_DIR/." || exit 1
)
echo "Extracted tools"

echo "=== Cleaning up download ==="
rm -rf "$DL_FOLDER"
echo "Cleaned up"

echo "=== Summary ==="
echo "avrdude: $TARGET_DIR/bin/avrdude"
echo "avr-gcc: $TARGET_DIR/bin/avr-gcc"
echo "avr-g++: $TARGET_DIR/bin/avr-g++"
echo "programmer definitions: $TARGET_DIR/etc/avrdude.conf"
echo ""
echo "If you want access to the binaries you need to add"
echo "PATH=\"$TARGET_DIR/bin:\$PATH\""
echo "to your .profile or .${SHELL}rc"