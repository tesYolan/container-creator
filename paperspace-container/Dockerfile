FROM ubuntu:16.04
ARG TOKEN
RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
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
        vim \
        software-properties-common \
        net-tools \
	netcat \
	libslf4j-java \
	liblogback-java \
        libvulkan-dev && \
    rm -rf /var/lib/apt/lists/*
RUN touch /var/log/syslog
ENV ASSUME_YES 1
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && apt-get install -y nodejs
RUN curl https://raw.githubusercontent.com/hansonrobotics/hrtool/master/get_hr.bash -o /tmp/get_hr.bash
RUN apt-get update && apt-get upgrade -y && bash /tmp/get_hr.bash
ENV GITHUB_TOKEN ADD_YOUR_TOKEN_HERE
RUN hr init /hansonrobotics
RUN hr cmd use_git_ssh
RUN hr install head-hr-ext
# TODO HACK as https cloning queries passwd
ADD .ssh/ /root/.ssh/
RUN hr install -f head
RUN hr install opencog
