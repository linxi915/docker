# Siege

Siege是一款开源的压力测试工具，可以根据配置对一个WEB站点进行多用户的并发访问，记录每个用户所有请求过程的相应时间，并在一定数量的并发访问下重复进行。它支持下面3种操作模式： 

1. Regression (when invoked by bombardment)Siege从配置文件中读取URLs，按递归方式，逐个发送请求 
2. Internet simulation (Siege从配置文件中读取URLs，随机选取URL发送请求)
3. Brute force (在命令行上写上一个单独的URL，发送请求)

官网文档: [Siege Manual](https://www.joedog.org/siege-manual/)

镜像构建参考: [jstarcher/siege](https://github.com/jstarcher/siege)

## 使用

镜像下载

```
docker pull registry.cn-hangzhou.aliyuncs.com/kennylee/siege

docker pull registry.cn-hangzhou.aliyuncs.com/kennylee/siege:siege-4.0.4_python2
```

### 基础命令

```
docker run --rm registry.cn-hangzhou.aliyuncs.com/kennylee/siege -c5 -r1 www.baidu.com
```

### 命令中使用文件

由于容器环境，所以，若想在siege命令中使用到文件时，需要在命令中挂载到容器内部，然后把传入内部地址传入到命令中才能正常使用，参考如下：

```
docker run --rm registry.cn-hangzhou.aliyuncs.com/kennylee/siege -c10 -r10 -f /opt/urls.txt
```

### 命令别名

修改linux环境下的`.bashrc`或`.zshrc`文件，添加别名命令，内容参考如下:

```
alias siege='docker run --rm -v "/tmp/siege:/tmp" registry.cn-hangzhou.aliyuncs.com/kennylee/siege'
```

重新打开一个控制台或者 `source .bashrc` 让命令生效，然后就可以直接想在本地安装的一样使用了

```
siege -c5 -r1 www.baidu.com
```


## 关于此镜像

这个镜像使用docker的 `multi-stage` 特性来构建了，在ubuntu环境下编译包，然后把编译后的文件拷贝到Alpine使用，原因有两点:

1. Apline构建，镜像后的体积偏大，构建完后体积去到170MB（目前这个镜像仅仅20m）。
2. Apline构建，编译Siege 4.0.4版本失败，实测最高只能构建3.1.4的版本。

Alpine构建脚本可参考 [brainsiq/alpine-siege](https://github.com/brainsiq/alpine-siege)编译失败的问题[无独有偶](https://github.com/JoeDog/siege/issues/124)

## 镜像版本

* Dockerfile-python2

	带python2.7的siege运行环境，ENTRYPOINT为python命令，因为这个镜像环境一般是适用于用python来操作siege的情况。


