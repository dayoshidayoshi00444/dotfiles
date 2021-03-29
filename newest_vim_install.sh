git clone https://github.com/vim/vim.git ~/vim
cd ~/vim
git pull
cd src
make distclean
./configure --enable-multibyte --enable-nls --with-features=huge --enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-luainterp --with-luajit --with-lua-prefix=/usr/local --enable-cscope--enable-fail-if-missing=yes --without-x --disable-xim --disable-gui --disable-sysmouse --disable-netbeans --disable-xsmp CC=`which clang`
make
sudo make install
