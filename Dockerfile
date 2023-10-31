FROM ubuntu:latest

RUN \
    apt update && \
    apt -y upgrade && \
    apt install -y build-essential && \
    apt install -y software-properties-common && \
    apt install -y curl git man unzip vim wget sudo

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"#

