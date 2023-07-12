FROM jlesage/baseimage-gui:ubuntu-22.04-v4

ENV HOME=/config \
    LANGUAGE=en_US

COPY root /

RUN chmod 755 / && \
    PackageList="ca-certificates gnupg2 sudo libnss3 libxss1 desktop-file-utils libgtk-3-0 libnotify4 libxtst6 xdg-utils libasound2 libgbm1 libsecret-1-0 libsecret-common libindicator3-7 libdbusmenu-glib4 libdbusmenu-gtk3-4 procps libx11-xcb1 vim nano wget tzdata curl fontconfig locales ttf-wqy-zenhei fonts-noto-cjk fonts-ubuntu fonts-dejavu fonts-hack-ttf fonts-inconsolata fonts-liberation fonts-roboto language-pack-zh-hans" && \
    sed -i "s/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt update && \
    apt install -y --no-install-recommends ${PackageList} && \
    ldconfig && \
    mv /opt/noVNC/index.html /opt/noVNC/index.html.en && \
    rm -rf /var/lib/apt/lists/*
