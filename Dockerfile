FROM ubuntu:14.04

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD http://mirror.pcbeta.com/google/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_42.0.2311.152-1_amd64.deb /src/google-chrome-stable_current_amd64.deb

RUN useradd -m google-chrome; \
    apt-get update; \
    apt-get install -y ca-certificates \
                       gconf-service \
                       hicolor-icon-theme \
                       libappindicator1 \
                       libasound2 \
                       libcurl3 \
                       libexif-dev \
                       libgconf-2-4 \
                       libgl1-mesa-dri \
                       libgl1-mesa-glx \
                       libnspr4 \
                       libnss3 \
                       libpango1.0-0 \
                       libv4l-0 \
                       libxss1 \
                       libxtst6 \
                       xdg-utils \
                       wget; \ 
    dpkg -i /src/google-chrome-stable_current_amd64.deb; \
    rm -f /src/google-chrome-stable_current_amd64.deb; \
    rm -rf /var/lib/apt/lists/*

COPY start-google-chrome.sh /tmp/

ENTRYPOINT ["/tmp/start-google-chrome.sh"]
