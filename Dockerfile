FROM centos:centos7

RUN yum install -y wget openssh-server make && \
    yum install -y gcc gcc-c++ ruby ruby-devel lua lua-devel  \
    ctags git python python-devel \
    tcl-devel ncurses-devel \
    perl perl-devel perl-ExtUtils-ParseXS \
    perl-ExtUtils-CBuilder \
    perl-ExtUtils-Embed && \
	git config --global user.email "chaoyanglius@gmail.com" && \
	git config --global user.name "Liu Chaoyang"

RUN wget https://codeload.github.com/vim/vim/tar.gz/v8.2.2479 -O vim.tar.gz && \
    tar -zxvf vim.tar.gz && cd vim-8.2.2479 && \
    ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib64/python2.7/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --prefix=/usr/local && \
    make && make install && \
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && \
	sh ~/.vim_runtime/install_awesome_vimrc.sh && \
	echo "alias vi=vim" >> ~/.bashrc && source ~/.bashrc && \
	echo "set nu" >> ~/.vim_runtime/my_configs.vim

