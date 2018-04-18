FROM nvidia/opengl:1.0-glvnd-devel-ubuntu16.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        ca-certificates \
        build-essential \
	tmux \
	bc \
	curl \
        libxinerama-dev \
        libxext-dev \
        libxrandr-dev \
        libxi-dev \
        libxcursor-dev \
        libxxf86vm-dev \
	sudo \
	apt-transport-https \
	ssh \
	jq \
	parallel \
	python-configobj \
	lsb-release \
        libvulkan-dev && \
    rm -rf /var/lib/apt/lists/*
ENV ASSUME_YES 1
RUN adduser --disabled-password --gecos '' hansondev 
RUN curl https://raw.githubusercontent.com/hansonrobotics/hrtool/master/get_hr.bash|bash
ENV GITHUB_TOKEN 9c8fa57d9a86d6303303e0c439d5c088c61d4cc9 # DUMMY TOKEN, IT DOESN'T WORK
RUN hr cmd use_git_ssh
RUN hr install head-hr-ext
ADD .ssh/ /root/.ssh/
RUN hr install -f head
# DONOT TOUCH ABOVE FOR NOW
RUN mkdir -p /root/blender-git
WORKDIR /root/blender-git
RUN git clone https://git.blender.org/blender.git
WORKDIR /root/blender-git/blender
RUN git submodule update --init --recursive
RUN git submodule foreach git checkout master
RUN git submodule foreach git pull --rebase origin master
RUN git checkout v2.79-rc2
WORKDIR /root/blender-git
COPY writeffmpeg.c blender/source/blender/blenkernel/intern/writeffmpeg.c
RUN ./blender/build_files/build_environment/install_deps.sh --with-all --skip-python --skip-numpy --no-confirm
RUN mkdir -p /root/blender-git/blender/build
WORKDIR /root/blender-git/blender/build
RUN cmake -DWITH_CODEC_FFMPEG=ON ..
RUN make -j8
