pushd .
curl -o ~/rxvt.tar.bz2 http://dist.schmorp.de/rxvt-unicode/rxvt-unicode-9.22.tar.bz2
cd ~/
tar -xf rxvt.tar.bz2
mv rxvt-unicode-9.22 .rxvt-unicode-9.22
rm rxvt.tar.bz2
cd .rxvt-unicode-9.22
git clone https://aur.archlinux.org/rxvt-unicode-patched.git
git clone https://github.com/blueyed/PKGBUILD-rxvt-unicode-wide.git
git clone https://aur.archlinux.org/rxvt-unicode-wcwidthcallback.git
pushd .
cd rxvt-unicode-patched 
curl -o sgr-mouse-mode.patch https://gist.githubusercontent.com/alexoj/df5bae7a4825cb596581/raw/75a1e75c2ae1ec5c0db68a29f8a6821e9e3d87a5/sgr-mouse-mode.patch
popd 

patch -p0 -i rxvt-unicode-patched/font-width-fix.patch
patch -p0 -i rxvt-unicode-patched/line-spacing-fix.patch
patch -p0 -i rxvt-unicode-patched/sgr-mouse-mode.patch
patch -p1 -i rxvt-unicode-patched/fix-smart-resize-with-x11-frame-borders.patch
patch -p1 -i PKGBUILD-rxvt-unicode-wide/add-space-to-extent_test_chars.patch

#patch -p0 -i PKGBUILD-rxvt-unicode-wide/font-width-fix.patch
#patch -p0 -i PKGBUILD-rxvt-unicode-wide/line-spacing-fix.patch
#patch -p1 -i PKGBUILD-rxvt-unicode-wide/enable-wide-glyphs.patch

#  patch -p0 -i rxvt-unicode-wcwidthcallback/line-spacing-fix.patch
#  patch -p0 -i rxvt-unicode-wcwidthcallback/sgr-mouse-mode.patch
#  patch -p1 -i rxvt-unicode-wcwidthcallback/fix-smart-resize-with-x11-frame-borders.patch
#
#  # Remove new files to make the patch apply when rebuilding.  Is there a option for `patch`?!
#  rm -f src/rxvtwcwidth.C src/rxvtwcwidth.h README.md
#  patch -Np1 -i rxvt-unicode-wcwidthcallback/wcwidthcallback.patch

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

