pushd .
curl -o ~/rxvt.tar.bz2 http://dist.schmorp.de/rxvt-unicode/rxvt-unicode-9.22.tar.bz2
cd ~/
tar -xf rxvt.tar.bz2
mv rxvt-unicode-9.22 .rxvt-unicode-9.22
rm rxvt.tar.bz2
cd .rxvt-unicode-9.22
git clone https://aur.archlinux.org/rxvt-unicode-patched.git
git clone https://github.com/blueyed/PKGBUILD-rxvt-unicode-wide.git

#patch -p0 -i rxvt-unicode-patched/font-width-fix.patch
#patch -p0 -i rxvt-unicode-patched/line-spacing-fix.patch
#patch -p0 -i rxvt-unicode-patched/sgr-mouse-mode.patch
#patch -p1 -i rxvt-unicode-patched/fix-smart-resize-with-x11-frame-borders.patch

patch -p0 -i PKGBUILD-rxvt-unicode-wide/font-width-fix.patch
patch -p0 -i PKGBUILD-rxvt-unicode-wide/line-spacing-fix.patch
patch -p1 -i PKGBUILD-rxvt-unicode-wide/enable-wide-glyphs.patch

  ./configure \
    --prefix=$HOME/.rxvt-unicode-9.22 \
    --enable-256-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --enable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll

make
make install -j8

