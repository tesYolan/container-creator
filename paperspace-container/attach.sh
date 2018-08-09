#!/bin/bash
xhost +local:root
docker exec -it $1 /bin/bash
xhost -local:root
