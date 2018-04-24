#!/bin/bash
xhost +local:root
docker run \
    -it \
    --rm \
    --privileged \
    --runtime nvidia \
    -p 8000:8000 \
    -p 8004:6006 \
    -p 4000:4000 \
    -p 4242:4242 \
    -p 11311:11311 \
    -p 9094:9094 \
    -p 9090:9090 \
    --env="DISPLAY=:1" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/home/tesfa/.tmux.conf:/home/hanson_dev/.tmux.conf" \
    --volume="/home/tesfa/.ssh/:/root/.ssh/" \
    --device=/dev/snd:/dev/snd \
    --device=/dev/video0:/dev/video0 \
    --volume="/home/tesfa/.ssh:/home/hansondev/.ssh" \
    --volume="/home/tesfa/clone_dir/hr_launchpad:/root/hansonrobotics/hr_launchpad" \
    --user root \
    hanson:vkws1 /bin/bash 
xhost -local:root
#-p 11311:11311 \
