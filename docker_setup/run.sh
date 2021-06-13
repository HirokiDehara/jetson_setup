#!/bin/sh

IMAGE_NAME=$1

if [ "${IMAGE_NAME}" = "" ]; then
	exit 1
fi

sudo docker run -it --rm --runtime nvidia -v $(pwd):/usr/local/src/ -w /usr/local/src/ --privileged --network host ${IMAGE_NAME}
