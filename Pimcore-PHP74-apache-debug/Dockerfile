FROM dockerhub.dgtls.com:5000/php74apachedebug:latest

RUN mkdir -p /usr/share/man/man1

RUN apt-get update && apt-get install -y \
    openjdk-11-jre-headless \
    openjdk-11-jdk \
    libreoffice-core \
    gnupg \
    ffmpeg \
    facedetect \
    libimage-exiftool-perl

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && npm install --global webpack \
    && npm install --global webpack-cli

RUN apt-get install -y pdftk

COPY /etc/install-cli-and-applications.sh /var/tmp/install-cli-and-applications.sh
RUN chmod +x /var/tmp/install-cli-and-applications.sh
RUN /var/tmp/install-cli-and-applications.sh

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install yarn

RUN apt-get update && apt-get install -y iproute2

RUN apt-get autoremove -y && apt-get autoclean -y

WORKDIR "/var/www"