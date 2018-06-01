#!/bin/bash
xhost +local:root
docker start -ia $1
xhost -local:root
