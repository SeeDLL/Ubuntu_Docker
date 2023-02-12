#!/usr/bin/with-contenv bash

ConfigFilePath=/conf/
ConfigFile=config.yml
AppDirPath=/app/PagerMaid-Pyro

welcome () {
    echo 
    echo "欢迎进入 PagerMaid-Pyro Docker 。"
    echo "配置即将开始"
    echo 
    sleep 2
}

configure () {
    echo "生成配置文件中 . . ."
    cp $AppDirPath/config.gen.yml $ConfigFilePath/$ConfigFile
    sed -i "s/127.0.0.1/0.0.0.0/" $ConfigFilePath/$ConfigFile
    printf "请输入应用程序 api_id（不懂请直接回车）："
    read -r api_id <&1
    sed -i "s/ID_HERE/$api_id/" $ConfigFilePath/$ConfigFile
    printf "请输入应用程序 api_hash（不懂请直接回车）："
    read -r api_hash <&1
    sed -i "s/HASH_HERE/$api_hash/" $ConfigFilePath/$ConfigFile
    read -p "二维码扫码登录？（避免无法收到验证码） [Y/n]" choi
    if [ "$choi" == "y" ] || [ "$choi" == "Y" ]; then
        sed -i "s/qrcode_login: \"False\"/qrcode_login: \"True\"/" $ConfigFilePath/$ConfigFile
    fi
    printf "请输入应用程序语言（默认：zh-cn）："
    read -r application_language <&1
    if [ -z "$application_language" ]
    then
        echo "语言设置为 简体中文"
    else
        sed -i "s/zh-cn/$application_language/" $ConfigFilePath/$ConfigFile
    fi
    printf "请输入应用程序地区（默认：China）："
    read -r application_region <&1
    if [ -z "$application_region" ]
    then
        echo "地区设置为 中国"
    else
        sed -i "s/China/$application_region/" $ConfigFilePath/$ConfigFile
    fi
    printf "请输入 Google TTS 语言（默认：zh-CN）："
    read -r application_tts <&1
    if [ -z "$application_tts" ]
    then
        echo "tts发音语言设置为 简体中文"
    else
        sed -i "s/zh-CN/$application_tts/" $ConfigFilePath/$ConfigFile
    fi
}

login () {
    echo
    echo "下面进行程序运行。"
    echo "请在账户授权完毕后，按 Ctrl + C 使 Docker 在后台模式下运行。"
    echo
    sleep 2
    echo "Hello world!" > $ConfigFilePath/install.lock
    /bin/cp -rf $ConfigFilePath/$ConfigFile $AppDirPath/$ConfigFile
    python -m pagermaid
    cp $AppDirPath/pagermaid.session $ConfigFilePath/pagermaid.session
    exit 0
}

main () {
    cd $AppDirPath
    if [ ! -s "$ConfigFilePath/install.lock" ]; then
        welcome
        configure
        login
    else
        if [ ! -f "$ConfigFilePath/pagermaid.session" ]; then
            welcome
            configure
        else
            cp $ConfigFilePath/pagermaid.session $AppDirPath/pagermaid.session
        fi
        login
    fi
}

main