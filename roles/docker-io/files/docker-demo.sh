#!/bin/bash
io_address=$1
docker run -i -t --device=/dev/piControl0 -v /home/pi/files/io.sh:/io.sh debian bash /io.sh $io_address