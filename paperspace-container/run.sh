#!/bin/bash
export DISPLAY=:0
xhost +local:root
docker run \
    -it \
    -p 11311:11311 \
    -p 8000:8000 \
    -p 8004:6006 \
    -p 4000:4000 \
    -p 4242:4242 \
    -p 9094:9094 \
    -p 9090:9090 \
    --volume="/var/run/docker.sock:/var/run/docker.sock" \
    --privileged \
    --env="DISPLAY=:0" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name opencog_cpu \
    hanson:opencog /bin/bash 
xhost -local:root
#-p 11311:11311 \
#    -p 8000:8000 \
#    -p 8004:6006 \
#    -p 4000:4000 \
#    -p 4242:4242 \
#    -p 11311:11311 \
#    -p 9094:9094 \
#    -p 9090:9090 \
#    --volume="/var/run/docker.sock:/var/run/docker.sock" \
