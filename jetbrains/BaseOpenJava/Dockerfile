FROM jlesage/baseimage-gui:ubuntu-22.04-v4

ENV JAVA_HOME=/opt/java/openjdk \
    LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

COPY OpenJDK20U-jre_x64_linux_hotspot_20.0.1_9.tar.gz /tmp/openjdk.tar.gz

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates gnupg2 sudo libnss3 libxss1 desktop-file-utils libgtk-3-0 libnotify4 libxtst6 xdg-utils libasound2 libgbm1 libsecret-1-0 ttf-wqy-zenhei libsecret-common  libindicator3-7 libdbusmenu-glib4 libdbusmenu-gtk3-4 procps libx11-xcb1 wget tzdata curl fontconfig fontconfig locales && \
    locale-gen en_US.UTF-8 && \
    mkdir -p "$JAVA_HOME" && \
    tar --extract --file /tmp/openjdk.tar.gz --directory "$JAVA_HOME" --strip-components 1 --no-same-owner && \
    rm -f /tmp/openjdk.tar.gz ${JAVA_HOME}/src.zip && \
    find "$JAVA_HOME/lib" -name '*.so' -exec dirname '{}' ';' | sort -u > /etc/ld.so.conf.d/docker-openjdk.conf && \
    ldconfig && \
    PATH=$PATH:$JAVA_HOME/bin && \
    rm -rf /var/lib/apt/lists/*

 #   ESUM='daacf24c15bf7f38a957a98a312911a36ba7f7d97004920a7875791f20e8e1ed' && \
 #   BINARY_URL='https://github.com/adoptium/temurin20-binaries/releases/download/jdk-20.0.1%2B9/OpenJDK20U-jre_x64_linux_hotspot_20.0.1_9.tar.gz' && \
 #   wget -O /tmp/openjdk.tar.gz ${BINARY_URL} && \