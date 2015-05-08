Dotfiles:
============

Setup for coding in C++ / Go / Python / Scala and Javascript. Also writing in markdown.

**Vim: One true editor to rule them all.**

Setting up music on nix systems:
-------------------------------
ncmpcpp-0.6.4 
libmpdclient-2.10

Other dependencies : doxygen, libncursesw5-dev, lib64ncurses-5, lib64ncurses5, boost 

Installing ncmpcpp:
-----------------
autoreconf -fvi ( for resolving libtool version mismatch )
BOOST_LIB_SUFFIX="" ./configure --with-curl --with-fftw --with-taglib
make
sudo make install

So with these versions tag editing works great. In the latest version of ncmpcpp the default keybindings file
and format have changed. To have more vim like bindings have to create a file in ~/.ncmpcpp/bindings 

