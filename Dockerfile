FROM hanson:nvi112

LABEL com.nvidia.volumes.needed="nvidia_driver"

RUN apt-get install -y mesa-utils
RUN apt-get install -y binutils
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}
USER hansondev
WORKDIR /home/hansondev/
RUN mkdir -p /home/hansondev/hansonrobotics
RUN hr install -f head
