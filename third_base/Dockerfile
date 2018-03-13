FROM hanson:kinetic_hr_ext

ADD .ssh/ /root/.ssh/
RUN apt install -y ssh
#RUN ssh -T git@github.com
RUN hr init /home/hansondev/
RUN hr cmd use_git_ssh
RUN hr install head
