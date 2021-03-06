sudo apt-get install -y clang git gettext libtinfo-dev libacl1-dev libgpm-dev build-essential python3-dev lua5.2 liblua5.2-dev luajit libluajit-5.1 autoconf automake cproto libperl-dev ruby-dev
git clone https://github.com/vim/vim.git ~/vim
cd ~/vim
git pull
cd src
make distclean
./configure --with-features=huge --enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-luainterp --with-luajit --enable-fail-if-missing
make
sudo make install
