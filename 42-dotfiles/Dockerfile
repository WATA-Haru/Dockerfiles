FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

RUN apt update && \
    apt-get update && \
    apt install -y curl git ripgrep tar unzip vim wget python3 python3-pip python3-venv

RUN wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz

RUN apt install -y locales && \
    locale-gen ja_JP.UTF-8

# 42-dotfiles for 42 school
RUN git clone -b main https://github.com/WATA-Haru/42-dotfiles.git

RUN rm -f ~/.bashrc && \
    rm -rf ~/.config/nvim && \
    ln -s /42-dotfiles/.bashrc ~/.bashrc && \
    ln -s /42-dotfiles/.bash_aliases ~/.bash_aliases && \
    mkdir ~/.config/ && \
    ln -s /42-dotfiles/nvim ~/.config/nvim

RUN rm -f ~/.vimrc && \
    rm -rf ~/.vim && \
    ln -s /42-dotfiles/vim/vimrc ~/.vimrc && \
    ln -s /42-dotfiles/vim/vim ~/.vim

RUN apt-get install -y ca-certificates gnupg && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    NODE_MAJOR=20 && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \ 
    apt-get update && \
    apt-get install nodejs -y

# dev tools for 42school
# norminette
RUN python3 -m pip install --upgrade pip setuptools
RUN python3 -m pip install norminette

RUN source ~/.bashrc
