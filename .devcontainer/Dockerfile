FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    vim \
    ffmpeg \
    nginx

RUN echo "ubuntu ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
    && chmod 0440 /etc/sudoers.d/ubuntu

# nginx config
COPY nginx/default.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
