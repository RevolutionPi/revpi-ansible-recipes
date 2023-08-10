#/bin/bash

# io.sh

#$1: file
#$2: offset
#$3: length
#$4: value
function writeByte() {
printf "$(printf '\\x%02X' $4)" | dd of="$1" bs=1 seek=$2 count=$3 conv=notrunc &> /dev/null
}

#$1: file
#$2: offset
#$3: length
function readByte() {
od -t x1 -j "$2" -N "$3" -Ad "$1"
}

echo "write 0 to address $1 in host $(hostname)..."
writeByte /dev/piControl0 $1 1 0
echo "read address $1 in host $(hostname):"
readByte /dev/piControl0 $1 1
echo
sleep 1
echo
echo "write 1 to address $1 in host $(hostname)..."
writeByte /dev/piControl0 $1 1 1
echo "read address $1 in host $(hostname):"
readByte "/dev/piControl0" $1 1
