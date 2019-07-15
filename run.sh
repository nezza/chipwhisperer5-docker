#!/bin/bash

if [ -z "$1" ]
then
      echo "Please supply a token for authentication!"
      exit 1
fi

if [ -z "$2" ]
then
	echo "Please supply a directory to work in."
	exit 1
fi

docker run -i -t -p 8888:8888 --privileged \
	-u $(id -u ${USER}):$(id -g ${USER}) --group-add plugdev \
	-v /dev/bus/usb:/dev/bus/usb \
	-v ${2}:/cw_workspace \
	--env TOKEN=${1} \
	--env HOME=/home \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/group:/etc/group:ro \
	-v /etc/group-:/etc/group-:ro \
	cw5
