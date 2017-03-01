# Debian

主要修改如下:

* 修改apt-get使用163的软件源
* 安装的基础工具

	* curl git unzip vim 
	* kde-l10n-zhcn (中文包)

* 中国时区和中文语言环境。

参考构建命令

```
docker build -t kennylee26/debian .
```

