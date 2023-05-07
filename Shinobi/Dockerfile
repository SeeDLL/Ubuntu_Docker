FROM nvidia/cuda:12.1.1-base-ubuntu22.04

ENV DB_USER=majesticflame \
    DB_PASSWORD='' \
    DB_HOST='localhost' \
    DB_DATABASE=ccio \
    DB_PORT=3306 \
    DB_TYPE='mysql' \
    SUBSCRIPTION_ID=sub_XXXXXXXXXXXX \
    PLUGIN_KEYS='{}' \
    SSL_ENABLED='false' \
    SSL_COUNTRY='CA' \
    SSL_STATE='BC' \
    SSL_LOCATION='Vancouver' \
    SSL_ORGANIZATION='Shinobi Systems' \
    SSL_ORGANIZATION_UNIT='IT Department' \
    SSL_COMMON_NAME='nvr.ninja'

RUN mkdir -p /home/Shinobi /config && \
    sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list && \
    sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list && \
    apt update -y && \
    apt install -y software-properties-common \
        wget curl net-tools \
        libfreetype6-dev \
        libgnutls28-dev \
        libmp3lame-dev \
        libass-dev \
        libogg-dev \
        libtheora-dev \
        libvorbis-dev \
        libvpx-dev \
        libwebp-dev \
        libssh2-1-dev \
        libopus-dev \
        librtmp-dev \
        libx264-dev \
        libx265-dev \
        yasm \
        build-essential \
        bzip2 \
        coreutils \
        procps \
        gnutls-bin \
        nasm \
        tar \
        x264 \
        ffmpeg \
        git \
        make \
        g++ \
        gcc \
        pkg-config \
        python3 \
        wget \
        tar \
        sudo \
        xz-utils && \
    apt update --fix-missing && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt install nodejs -y && \
    rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* && \
    node -v && \
    npm -v

# Additional packages to support NodeJS as the base build is NVidia CUDA
# Install FFmpeg

WORKDIR /home/Shinobi

RUN git clone https://gitlab.com/Shinobi-Systems/Shinobi.git /home/Shinobi && \
    cd /home/Shinobi && \
    chmod -R 777 /home/Shinobi/plugins && \
    npm i npm@latest -g && \
    npm install --unsafe-perm && \
    npm install pm2 -g && \
    cp ./Docker/pm2.yml ./ && \
    chmod -f +x /home/Shinobi/Docker/init.sh && \
    sed -i -e 's/\r//g' /home/Shinobi/Docker/init.sh

VOLUME ["/home/Shinobi/videos"]
VOLUME ["/home/Shinobi/libs/customAutoLoad"]
VOLUME ["/config"]

EXPOSE 8080 443 21 25

ENTRYPOINT ["sh","/home/Shinobi/Docker/init.sh"]

CMD [ "pm2-docker", "/home/Shinobi/Docker/pm2.yml" ]

