#!/bin/bash

if [ -n "$2" ]
then
      TOKEN_OPT="--NotebookApp.token=${2}"
fi

if [ -z "$1" ]
then
	echo "Please supply a directory to work in."
	exit 1
fi

WORKSPACE=$(realpath "$1")

docker run -i -t -p 8888:8888 --privileged \
	-u $(id -u ${USER}):$(id -g ${USER}) --group-add plugdev \
	-v /dev/bus/usb:/dev/bus/usb \
	-v ${WORKSPACE}:/cw_workspace \
	--env TOKEN_OPT=${TOKEN_OPT} \
	--env HOME=/home \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/group:/etc/group:ro \
	-v /etc/group-:/etc/group-:ro \
	cw5
