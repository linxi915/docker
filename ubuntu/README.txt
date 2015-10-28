参考 http://dockerfile.github.io/#/ubuntu

修改使用163的源。

此image默认安装好byobu curl git htop man unzip vim wget和software-properties-common常用工具。所以支持add-apt-repository ppa:webupd8team/java来添加第三方源。


build
docker build -t kennylee26/ubuntu .
