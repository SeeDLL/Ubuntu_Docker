FROM jlesage/baseimage-gui:ubuntu-22.04-v4

ARG ALIYUNPAN_VER=3.11.15

ENV APP_NAME="aliyunpan"
ENV NOVNC_LANGUAGE="zh_Hans"
ENV TZ=Asia/Shanghai
ENV HOME=/config
ENV LC_ALL=C

COPY --chmod=755 root /
COPY --chmod=755 startapp.sh /startapp.sh

RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ; \
    apt update ; \
    apt install -y --no-install-recommends -y wget libnss3 libxss1 desktop-file-utils libgtk-3-0 libnotify4 libxtst6 xdg-utils desktop-file-utils libasound2 libgbm1 libsecret-1-0 ; \
    cd /root ; \
    wget https://github.com/gaozhangmin/aliyunpan/releases/download/v${ALIYUNPAN_VER}/XBYDriver-${ALIYUNPAN_VER}-linux-amd64.deb ; \
    dpkg -i XBYDriver-${ALIYUNPAN_VER}-linux-amd64.deb ; \
    rm XBYDriver-${ALIYUNPAN_VER}-linux-amd64.deb ; \
    sed -i 's/normal/desktop/g' /opt/base/etc/jwm/main-window-group.sh ; \
    mv /opt/noVNC/index.html /opt/noVNC/index.html.en ; \
    sed -i '/messagebus/d' /var/lib/dpkg/statoverride ; \
    rm -rf /var/lib/apt/lists/*