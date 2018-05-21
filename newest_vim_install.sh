cd ~/vim
git pull
cd src
make distclean
./configure --with-features=huge --enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-luainterp --with-luajit --with-lua-prefix=/usr/local --enable-fail-if-missing
make
make install
