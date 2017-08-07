# Alpine

主要修改如下:

* 使用阿里云源
* 安装的基础工具 curl bash tzdata tar unzip 
* 中国时区
* 默认bash

参考构建命令

```
docker build -t kennylee26/alpine .
```

## 版本说明

* `coreutils` 包含coreutils包的镜像，没有coreutils的话，date命令的格式化无法正常使用。


