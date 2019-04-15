# Siege

Siege是一款开源的压力测试工具，可以根据配置对一个WEB站点进行多用户的并发访问，记录每个用户所有请求过程的相应时间，并在一定数量的并发访问下重复进行。它支持下面3种操作模式： 

1. Regression (when invoked by bombardment)Siege从配置文件中读取URLs，按递归方式，逐个发送请求 
2. Internet simulation (Siege从配置文件中读取URLs，随机选取URL发送请求)
3. Brute force (在命令行上写上一个单独的URL，发送请求)

官网文档: [Siege Manual](https://www.joedog.org/siege-manual/)

镜像构建参考: [jstarcher/siege](https://github.com/jstarcher/siege)

## 使用

### 基础命令

```
docker run --rm registry.cn-hangzhou.aliyuncs.com/kennylee/siege -c5 -r1 www.baidu.com
```

## 命令中使用文件

由于容器环境，所以，若想在siege命令中使用到文件时，需要在命令中挂载到容器内部，然后把传入内部地址传入到命令中才能正常使用，参考如下：

```
docker run --rm registry.cn-hangzhou.aliyuncs.com/kennylee/siege -c10 -r10 -f /opt/urls.txt
```
