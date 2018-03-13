FROM ros:kinetic-ros-core

LABEL com.nvidia.volumes.needed="nvidia_driver"
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
	libx11-dev \
    ssh \
    sudo \
    apt-transport-https

RUN apt-get install -y mesa-utils
RUN apt-get install -y binutils
ENV ASSUME_YES 1
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}
RUN adduser --disabled-password --gecos '' hansondev 
RUN curl https://raw.githubusercontent.com/hansonrobotics/hrtool/master/get_hr.bash|bash
ENV GITHUB_TOKEN=db60a79bc8144b1213cb33e0fc8c46c1fe0d8603
RUN hr cmd get_latest_version hansonrobotics/hrtool-ext
RUN hr install head-hr-ext
ADD .ssh/ /root/.ssh/
ADD .ssh/ /home/hansondev/.ssh/
RUN mkdir -p /home/hansondev/hansonrobotics/
RUN hr init /home/hansondev/hansonrobotics/
RUN hr cmd use_git_ssh
RUN apt-get -y install nodejs npm
RUN hr install head
