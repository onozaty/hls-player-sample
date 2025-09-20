FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    git

RUN echo "ubuntu ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
    && chmod 0440 /etc/sudoers.d/ubuntu
