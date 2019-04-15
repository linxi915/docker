# Alpine

主要修改如下:

* 使用阿里云源
* 安装的基础工具 curl bash tzdata tar unzip 
* 中国时区
* 默认bash

## 镜像下载

```
docker pull registry.cn-hangzhou.aliyuncs.com/kennylee/alpine

docker pull registry.cn-hangzhou.aliyuncs.com/kennylee/alpine:3.9

docker pull registry.cn-hangzhou.aliyuncs.com/kennylee/alpine:alpine-3.9_glibc

docker pull registry.cn-hangzhou.aliyuncs.com/kennylee/alpine:3.4
```

## 参考构建命令

```
docker build -t kennylee26/alpine .

docker build -t kennylee26/alpine:coreutils -f Dockerfile-coreutils .

docker build -t kennylee26/alpine:glibc -f Dockerfile-glibc .
```

## 版本说明

* `coreutils` 包含coreutils包的镜像，没有coreutils的话，date命令的格式化无法正常使用。
* `glibc` 包含glibc包的镜像环境。


