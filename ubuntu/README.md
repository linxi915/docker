# Ubuntu

参考 http://dockerfile.github.io/#/ubuntu

主要修改如下:

* 修改apt-get使用aliyun的源
* 一般tag安装的基础工具

	* curl、git、unzip、vim
	* language-pack-zh-hans (中文包)

* 中国时区和中文本环境。

参考构建命令

```
docker build -t kennylee26/ubuntu .
```


