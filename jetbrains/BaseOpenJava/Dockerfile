FROM jlesage/baseimage-gui:ubuntu-22.04-v4

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:${PATH}" \
    LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ARG OPENJDK_VER=20.0.1_9  

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    apt update && \
    apt install -y --no-install-recommends ca-certificates gnupg2 sudo libnss3 libxss1 desktop-file-utils libgtk-3-0 libnotify4 libxtst6 xdg-utils libasound2 libgbm1 libsecret-1-0 libsecret-common  libindicator3-7 libdbusmenu-glib4 libdbusmenu-gtk3-4 procps libx11-xcb1 vim nano wget tzdata curl fontconfig fontconfig locales ttf-wqy-zenhei fonts-noto-cjk fonts-ubuntu fonts-dejavu fonts-hack-ttf fonts-inconsolata fonts-liberation  fonts-roboto && \
    locale-gen en_US.UTF-8 && \
    mkdir -p "$JAVA_HOME" && \
    BINARY_URL='https://github.com/adoptium/temurin20-binaries/releases/download/jdk-20.0.1+9/OpenJDK20U-jdk_x64_linux_hotspot_20.0.1_9.tar.gz' && \
    wget -O /tmp/openjdk.tar.gz ${BINARY_URL} && \
    tar --extract --file /tmp/openjdk.tar.gz --directory "$JAVA_HOME" --strip-components 1 --no-same-owner && \
    rm -f /tmp/openjdk.tar.gz ${JAVA_HOME}/src.zip && \
    find "$JAVA_HOME/lib" -name '*.so' -exec dirname '{}' ';' | sort -u > /etc/ld.so.conf.d/docker-openjdk.conf && \
    ldconfig && \
    rm -rf /var/lib/apt/lists/*
