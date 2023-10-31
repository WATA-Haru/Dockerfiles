FROM ubuntu:22.04

RUN apt update && \
    apt-get update && \
    apt install -y curl git ripgrep tar unzip vim wget

RUN wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz

RUN apt install -y locales && \
    locale-gen ja_JP.UTF-8

# dotfiles for 42tokyo
RUN git clone -b dotfiles https://github.com/WATA-Haru/42-dotfiles.git

RUN mv ~/.bashrc ~/.prev_bashrc && \
	mv ~/.config/nvim ~/tmp_nvim && \
    ln -s /dotfiles/.bashrc ~/.bashrc && \
    ln -s /dotfiles/.bash_aliases ~/.bash_aliases && \
    ln -s /dotfiles/.config/nvim/ ~/.dotfiles/nvim && \