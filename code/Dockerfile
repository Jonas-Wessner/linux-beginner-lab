FROM ubuntu:20.04

# install vim
RUN apt-get update && apt-get install -y \
    vim \
    sudo

# create user with home directory and with bash as default shell
RUN useradd -ms /bin/bash myuser
# change password for the user
RUN echo "myuser:secret" | chpasswd
RUN adduser myuser sudo

# change user and directory
USER myuser
WORKDIR /home/myuser

# copy all files
COPY --chown=myuser:myuser home_dir/ /home/myuser/

# create backup folder
RUN mkdir backup && cp -r *_* backup/

CMD ["/bin/bash"]
