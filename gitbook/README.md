本地的gitbook创建命令工具。
---

实际上可以把此容器看成的一个gitbook命令行的封装。

### 构建命令

docker build -t kennylee26/gitbook .

### 说明

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


### 使用教程

首先下载镜像
docker pull kennylee26/gitbook

#### init
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 kennylee26/gitbook init

#### serve
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 kennylee26/gitbook serve

#### build
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 kennylee26/gitbook build

For short, you can use alias for the long command line text. Just place the alias statement in your .bashrc or .zshrc.

alias gitbook='docker run --rm -v "$PWD:/gitbook" -p 4000:4000 kennylee26/gitbook'

#### init
gitbook init

#### serve
gitbook serve

#### build
gitbook build

----
参考 https://hub.docker.com/r/billryan/gitbook/
