FROM ubuntu:latest

# Set locale and tz
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Insall basics
RUN apt-get update && \
    apt-get install -y sudo curl git-core gnupg \
    fish wget neovim locales fzf yarn grip \
    nodejs npm fonts-powerline

#Setup a non-root user 
RUN adduser --quiet --disabled-password --shell \ 
    /bin/fish --home /home/devuser --gecos "User" devuser
RUN echo "devuser:<a href="mailto://p@ssword1">p@ssword1</a>" | chpasswd 
RUN usermod -aG sudo devuser

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Copy configs to the container
RUN rm -rf /home/devuser/.config/fish

COPY nvim /home/devuser/.config/nvim
COPY fish /home/devuser/.config/fish
COPY doom.d /home/devuser/.doom.d

COPY prettierrc.js /home/devuser/.prettierrc.js
COPY noderc.js /home/devuser/.noderc.js 
COPY popuptmux.sh /home/devuser/.popuptmux.sh
COPY tmux.conf.local /home/devuser/.tmux.conf.local

# Install LSP/NVIM
RUN curl -fLo /home/devuser/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN npm install -g @fsouza/prettierd sass-lint eslint_d vim-language-server vscode-langservers-extracted typescript typescript-language-server diagnostic-languageserver

# Log in as devuser
RUN chown devuser /home/devuser
USER devuser
