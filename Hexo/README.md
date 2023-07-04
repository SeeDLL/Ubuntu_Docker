Hexo 🐋
============

English | [简体中文](./README_zh.md)

Dockerfile for Hexo with Hexo Admin

This is a Hexo using the latest version of Node.js, which is currently Node.js 20.

[https://github.com/SeeDLL/Ubuntu_Docker](https://github.com/SeeDLL/Ubuntu_Docker)

The image is available directly from [Docker Hub](https://hub.docker.com/r/seedll/hexo/)

### Appreciation to the following projects:

Node.js :
[https://hub.docker.com/_/node ](https://hub.docker.com/_/node "https://hub.docker.com/_/node")

Hexo Blog:
[https://hexo.io ](https://hexo.io "https://hexo.io")  

### Notes:

   * If the directory specified by -v is an empty directory, this container will automatically initialize a complete set of Hexo configuration and pages.  

   * If the directory specified by -v already has existing Hexo files, the container will not re-initialize Hexo, but will run the Hexo in that directory directly.

   * If the directory specified by -v already has a requirements.txt, it will install the modules required in requirements.txt.

   * If you need to check and upgrade the hexo and required module versions when the container starts up each time, you can specify APP_CHECK_UPDATE=true to achieve checking and upgrading.

### Getting Started：

1. Downloading the image

    |Image source|Command|
    |:-|:-|
    |DockerHub|docker pull seedll/hexo:latest|

2. Creating the hexo container

        docker create \
           --name=hexo \
           -p 4000:13389 \
           -e HEXO_SERVER_PORT=13389 \
           -e APP_CHECK_UPDATE=true \
           -e GIT_USER=xxxxxx \
           -e GIT_EMAIL=xxxxxx@gmail.com \
           -v {your hexo dir path}/app \
           --restart unless-stopped \
           seedll/hexo:latest

3. run

       docker start hexo

4. stop

       docker stop hexo

5. delete container

       docker rm hexo

6. delete image

       docker image rm seedll/hexo:latest

### Environment Variable Settings:

|Variable|Description|
|:-|:-|
| `-e HEXO_SERVER_PORT` | hexo server port(default port 4000) |
| `-e APP_CHECK_UPDATE` | check and update package version |
| `-e GIT_USER` | git user |
| `-e GIT_EMAIL` | git email |


