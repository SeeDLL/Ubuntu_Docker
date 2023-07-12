#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

if [ -n "$LANGUAGE" ]; then
  if [ "$LANGUAGE" = "zh_CN" ]; then
    LC_ALL='zh_CN.UTF-8'
    LANG='zh_CN.UTF-8'
    LANGUAGE='zh_CN:zh'
    cp -rf /opt/noVNC/index.html.zh /opt/noVNC/index.html
  elif [ "$LANGUAGE" = "en_US" ]; then
    LC_ALL='en_US.UTF-8'
    LANG='en_US.UTF-8'
    LANGUAGE='en_US:en'
    cp -rf /opt/noVNC/index.html.en /opt/noVNC/index.html
  fi
else
  LC_ALL='en_US.UTF-8'
  LANG='en_US.UTF-8'
  LANGUAGE='en_US:en'
  cp -rf /opt/noVNC/index.html.en /opt/noVNC/index.html
fi

chmod 755 /opt/noVNC/index.html

echo "${LC_ALL} UTF-8" >> /etc/locale.gen
locale-gen ${LC_ALL}
ldconfig
