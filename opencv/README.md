# OpenCV镜像

[OpenCV](https://opencv.org/) 各种运行环境镜像。

>注：编译时，最好在国外服务器环境。因为github克隆源码和编译时下载的包都很难在通常的网络环境下进行。

*源码编译真是个体力活，各种等Orz...*

## 检查OpenCV-Java环境

```
docker run --rm \
	registry.cn-hangzhou.aliyuncs.com/kennylee/opencv:openjdk-jdk8 /check.sh
```

成功的话，会显示当前opencv的版本；

## 参考

* [adnrv/opencv](https://hub.docker.com/r/adnrv/opencv)


