# Gitbook

本地的gitbook创建命令工具（gitbook-cli），实际上可以把此容器看成的一个gitbook命令行的封装。

## 构建命令

docker build -t kennylee26/gitbook .

### GIT_BOOK_VERSION 

GIT_BOOK_VERSION指的是gitbook版本，`latest` 为官网定义的稳定版本。如果发现`latest`版本使用有问题的话可以手动切换到开发版本。

默认镜像就安装了`gitbook`，若不安装的话每次使用镜像的时候都会重新下载`gitbook`。

## 说明

* 输出pdf乱码问题

	默认情况下pdf输出中文会乱码，因为默认字体不支持中文，所以镜像内安装了中文字体 ```WenQuanYi Micro Hei Mono``` , 然后在book.json里面配置输出字体。参考如下: 
	
	```json
	{
	    "pdf": {
        "pageNumbers": false,
        "fontSize": 12,
        "fontFamily": "WenQuanYi Micro Hei Mono",
        "paperSize": "a4",
        "margin": {
            "bottom": 36,
            "left": 62,
            "right": 62,
            "top": 36
        	},
        "footerTemplate": null,
        "headerTemplate": null
    	}
    }
	```


## 使用教程

首先下载镜像
docker pull kennylee26/gitbook

### init
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 kennylee26/gitbook init

### serve
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 kennylee26/gitbook serve

### build
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 kennylee26/gitbook build

For short, you can use alias for the long command line text. Just place the alias statement in your .bashrc or .zshrc.

alias gitbook='docker run --rm -v "$PWD:/gitbook" -p 4000:4000 kennylee26/gitbook'

设置别名后，直接 `gitbook build` 即可

注：若build一次不成功可以继续build一次，莫名发现会产生这个问题。也许是跟编写的`SUMMARY.md`等文件有关。

### init
gitbook init

### serve
gitbook serve

### build
gitbook build

----
参考 https://hub.docker.com/r/billryan/gitbook/


