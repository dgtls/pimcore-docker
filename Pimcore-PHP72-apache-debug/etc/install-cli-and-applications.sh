#!/bin/bash

wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz -O ffmpeg.tar.xz
tar -Jxf ffmpeg*.tar.xz
mv ffmpeg-* /usr/local/ffmpeg
ln -s /usr/local/ffmpeg/ffmpeg /usr/local/bin/
ln -s /usr/local/ffmpeg/ffprobe /usr/local/bin/
ln -s /usr/local/ffmpeg/qt-faststart /usr/local/bin/
ln -s /usr/local/ffmpeg/qt-faststart /usr/local/bin/qtfaststart

pushd ./
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
tar xf  wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
cd ./wkhtmltox
cp -R ./* /usr/
popd

pushd ./
wget https://downloads.sourceforge.net/project/pmt/pngcrush/1.8.13/pngcrush-1.8.13.tar.gz
tar pngcrush-1.8.13.tar.gz
mv pngcrush /usr/local/bin
make
popd

pushd ./
wget https://github.com/tjko/jpegoptim/archive/RELEASE.1.4.4.tar.gz
zcat RELEASE.1.4.4.tar.gz | tar xf -
cd RELEASE.1.4.4.tar.gz
./configure
make
make strip
make install
popd

pushd ./
wget https://github.com/google/zopfli/archive/zopfli-1.0.1.tar.gz \
    && tar xf zopfli-1.0.1.tar.gz \
    && cd zopfli-zopfli-1.0.1 \
    && make -is zopflipng\
    && mv zopflipng /usr/local/bin
popd
