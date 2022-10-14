# https://medium.com/@ls12styler/docker-as-an-integrated-development-environment-95bc9b01d2c1
FROM alpine:latest

# Install packages
RUN apk update
RUN apk add -U \
    gcc \
    git \
    nodejs \
    npm \
    openssh-client \
    curl \ 
    less \
    ripgrep \
    fzf \
    luarocks \
    python3 \
    neovim \
    ruby

# Install npm packages and js lsp support
RUN npm install -g \
    yarn \
    @fsouza/prettierd \
    sass-lint \
    eslint_d \  
    vim-language-server \
    vscode-langservers-extracted \
    typescript \
    typescript-language-server \
    diagnostic-languageserver \ 
    neovim

# Install clojure lsp support
RUN curl -s https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install

# Install neovim python support
#RUN pip3 install neovim

#Setup a non-root user 
#RUN adduser -s /bin/fish -D me
RUN adduser --disabled-password me
WORKDIR /home/me
ENV HOME /home/me
USER me

# Copy configs
RUN mkdir .config
COPY ./nvim .config/nvim
#COPY ./prettierrc.js .prettierrc.js
#COPY ./eslintrc.js .eslintrc.js
#COPY ./noderc.js .noderc.js 

# Install doom emacs for dev user
#COPY ./doom.d .doom.d
#RUN git clone --depth 1 https://github.com/hlissner/doom-emacs .emacs.d 
#RUN .emacs.d/bin/doom sync

# Install nvim plugins
#RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#RUN nvim +PlugInstall +qall >> /dev/null
#RUN nvim +PlugInstall +qa
#RUN nvim -es -u .config/init.vim -i NONE -c "PlugInstall" -c "qa"

# Launch neovim ?
#ENTRYPOINT nvim

