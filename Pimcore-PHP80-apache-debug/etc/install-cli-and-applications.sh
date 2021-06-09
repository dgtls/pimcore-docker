#!/bin/sh

set -e
NPM_VERSION=6.0

# install wkhtmltopdf
cd /
apt-get update && apt-get remove -y libqt4-dev qt4-dev-tools wkhtmltopdf && apt-get autoremove -y
apt-get install openssl build-essential libssl-dev libxrender-dev git-core libx11-dev libxext-dev libfontconfig1-dev libfreetype6-dev fontconfig -y
mkdir /var/wkhtmltopdf
cd /var/wkhtmltopdf && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz && tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
cp /var/wkhtmltopdf/wkhtmltox/bin/wkhtmltopdf /bin/wkhtmltopdf && cp /var/wkhtmltopdf/wkhtmltox/bin/wkhtmltoimage /bin/wkhtmltoimage
chown -R www-data:www-data /var/wkhtmltopdf
chmod +x /bin/wkhtmltopdf && chmod +x /bin/wkhtmltoimage
ln -s /bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

# install pngout
cd /tmp
wget https://github.com/imagemin/pngout-bin/tree/main/vendor/linux/x64/pngout -O /usr/local/bin/pngout
chmod 0755 /usr/local/bin/pngout
cd /

# install pngcrush
cd /tmp
wget https://github.com/imagemin/pngcrush-bin/tree/main/vendor/linux/pngcrush -O /usr/local/bin/pngcrush
chmod 0755 /usr/local/bin/pngcrush
cd /

# install jpegoptim
cd /tmp
wget https://github.com/imagemin/jpegoptim-bin/tree/main/vendor/linux/jpegoptim -O /usr/local/bin/jpegoptim
chmod 0755 /usr/local/bin/jpegoptim
cd /

# install zopflipng
cd /tmp
wget https://github.com/imagemin/zopflipng-bin/tree/main/vendor/linux/zopflipng -O /usr/local/bin/zopflipng
chmod 0755 /usr/local/bin/zopflipng
cd /

# install advpng
cd /tmp
wget https://github.com/imagemin/advpng-bin/tree/main/vendor/linux/advpng -O /usr/local/bin/advpng
chmod 0755 /usr/local/bin/advpng
cd /

# install mozjpeg
cd /tmp
wget https://github.com/imagemin/mozjpeg-bin/tree/main/vendor/linux/cjpeg -O /usr/local/bin/cjpeg
chmod 0755 /usr/local/bin/cjpeg
cd /

# install specific npm version
npm install -g npm@$NPM_VERSION
npm install fsevents@latest -f --save-optional

# install less
npm install -g less && npm install -g less-plugin-clean-css

# install grunt
npm install -g grunt-cli

# install gulp
npm install -g gulp
