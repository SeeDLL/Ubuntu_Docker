## NAS自用：

### GitHub:

[https://github.com/SeeDLL/Ubuntu_Docker](https://github.com/SeeDLL/Ubuntu_Docker)

### 感谢以下项目:

[https://github.com/jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui "https://github.com/jlesage/docker-baseimage-gui")                                       

### 版本：

|名称|版本|说明|
|:-|:-|:-|
|小白羊云盘|3.11.5|amd64|

#### 注意：

   * 初次使用，请完成登陆后，到设置页面设置好相关参数，包括下载位置也需手动配置(右上角-设置)。

### docker命令行设置：

1. 下载镜像

    |镜像源|命令|
    |:-|:-|
    |DockerHub|docker pull seedll/aliyunpan:latest|

2. 创建 aliyunpan 容器

        docker create \
           --name=aliyunpan \
           -p 5800:5800 \
           -p 5900:5900 \
           -v /配置文件位置:/config \
           -v /下载位置:/config/download \
           --restart unless-stopped \
           seedll/aliyunpan:latest

3. 运行

       docker start aliyunpan

4. 停止

       docker stop aliyunpan

5. 删除容器

       docker rm aliyunpan

6. 删除镜像

       docker image rm seedll/aliyunpan:latest

### 变量:

|参数|说明|
|:-|:-|
| `--name=aliyunpan` |容器名|
| `-p 5800:5800` |容器 网页版VNC界面访问端口,[ip:5800](ip:5800)|
| `-p 5900:5900` |容器 VNC 协议访问端口,[ip:5900](ip:5900)|
| `-v /配置文件位置:/config` |aliyunpan 配置文件位置|
| `-v /下载位置:/config/download` |aliyunpan 下载路径(需手动设置)|
| `-e VNC_PASSWORD=VNC密码` |VNC密码|
| `-e USER_ID=1000` |uid设置,默认为1000|
| `-e GROUP_ID=1000` |gid设置,默认为1000|
| `-e NOVNC_LANGUAGE="zh_Hans"` |(zh_Hans\|en)设定novnc语言,默认为中文|


更多参数设置详见:[https://registry.hub.docker.com/r/jlesage/baseimage-gui](https://registry.hub.docker.com/r/jlesage/baseimage-gui "https://registry.hub.docker.com/r/jlesage/baseimage-gui")                                     


### 群晖docker设置：

1. 卷

|参数|说明|
|:-|:-|
| `本地文件夹1:/config/baidunetdiskdownload` |baidunetdisk下载路径(3.3.2需手动设置)|
| `本地文件夹2:/config` |baidunetdisk配置文件位置|

2. 端口

|参数|说明|
|:-|:-|
| `本地端口1:5800`  |Web界面访问端口,[ip:本地端口1](ip:本地端口1)|
| `本地端口2:5900`  |VNC协议访问端口.如果未使用VNC客户端,则为可选,[ip:本地端口2](ip:本地端口2)|

3. 环境变量

|参数|说明|
|:-|:-|
| `VNC_PASSWORD=VNC密码` |VNC密码|
| `USER_ID=1000` |uid设置,默认为1000|
| `GROUP_ID=1000` |gid设置,默认为1000|
| `NOVNC_LANGUAGE="zh_Hans"` |(zh_Hans\|en)设定novnc语言,默认为中文|