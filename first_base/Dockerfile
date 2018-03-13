FROM ros:kinetic-ros-core

RUN apt-get update && apt-get install -y \
	git \
	tmux \
	bc \
	wget \
	liblapack-dev \
	freeglut3-dev \
	libqglviewer-dev \
	libsuitesparse-dev \
    curl \
	libx11-dev 
RUN adduser --disabled-password --gecos '' hansondev 
RUN apt-get -y install sudo
RUN curl https://raw.githubusercontent.com/hansonrobotics/hrtool/master/get_hr.bash|bash
