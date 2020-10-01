FROM dockerhub.dgtls.com:5000/php71apachedebug:latest

RUN mkdir -p /usr/share/man/man1

RUN apt-get update && apt-get install -y \
    libreoffice-core \
    gnupg \
    ffmpeg \
    facedetect \
    libimage-exiftool-perl

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

RUN apt-get install -y pdftk

COPY /etc/install-cli-and-applications.sh /var/tmp/install-cli-and-applications.sh
RUN chmod +x /var/tmp/install-cli-and-applications.sh
RUN /var/tmp/install-cli-and-applications.sh

RUN apt-get update && apt-get install -y iproute2

RUN apt-get autoremove -y && apt-get autoclean -y

WORKDIR "/var/www"