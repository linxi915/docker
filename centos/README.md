# CentOS

主要修改如下:

* 修改yum使用163的软件源
* 安装的基础工具 git unzip vim wget 
* 中国时区

注：中文语言设置，尝试了一下，还是不成功，暂时搁置。考虑到容器内使用中文，再加上是CentOS的情况其实也不多。

参考构建命令

```
docker build -t kennylee26/centos .
```

