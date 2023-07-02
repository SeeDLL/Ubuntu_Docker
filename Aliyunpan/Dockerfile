FROM jlesage/baseimage-gui:ubuntu-22.04-v4

ARG ALIYUNPAN_VER=3.11.15

ENV APP_NAME="aliyunpan"
ENV APP_VERSION="3.11.15"
ENV DISPLAY_WIDTH="1920"
ENV DISPLAY_HEIGHT="1080"
ENV TZ=Asia/Shanghai
ENV HOME=/config
ENV LC_ALL=C

COPY --chmod=755 root /

RUN chmod 755 /startapp.sh \
    && apt update \
    && apt install -y --no-install-recommends -y sudo ca-certificates libnss3 libxss1 desktop-file-utils libgtk-3-0 libnotify4 libxtst6 xdg-utils libasound2 libgbm1 libsecret-1-0 ttf-wqy-zenhei libsecret-common  libindicator3-7 libdbusmenu-glib4 libdbusmenu-gtk3-4 libappindicator3-1 procps libx11-xcb1 aria2 \
    && aria2c https://github.com/gaozhangmin/aliyunpan/releases/download/v${ALIYUNPAN_VER}/XBYDriver-${ALIYUNPAN_VER}-linux-amd64.deb -d /tmp -o xbyyunpan.deb \
    && dpkg -i /tmp/xbyyunpan.deb \
    && install_app_icon.sh https://raw.githubusercontent.com/SeeDLL/Ubuntu_Docker/main/Aliyunpan/icon/xbyyunpan.png \
    && mv /opt/noVNC/index.html /opt/noVNC/index.html.en \
    && rm -rf /var/lib/apt/lists/*