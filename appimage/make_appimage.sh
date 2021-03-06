#!/bin/sh
rm -rf build
mkdir build
wget -nc https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage
cd build
cmake ../.. -DDATA_DIR=/usr/share/Pyramid_Schemist -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
make
make install DESTDIR=AppDir
cd ..
./linuxdeploy-x86_64.AppImage --appdir build/AppDir --output appimage -d pyramid_schemist.desktop -i ../img/icon.png
