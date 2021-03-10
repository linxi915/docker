# TNginx

## 概述

Tengine是由淘宝网发起的Web服务器项目。它在Nginx 的基础上，针对大访问量网站的需求，添加了很多高级功能和特性。Tengine的性能和稳定性已经在大型的网站如淘宝网 ，天猫商城 等得到了很好的检验。它的最终目标是打造一个高效、稳定、安全、易用的Web平台。

Tnginx 安装基础目录 `/etc/nginx`

* [官网](https://tengine.taobao.org/)
* [下载包](https://tengine.taobao.org/download.html)

## 快速使用

```
docker run -d --name tnginx -p 80:80 registry.cn-hangzhou.aliyuncs.com/kennylee/tnginx:2.3.2
```

## docker-compose使用参考

```
version: '2'
    
networks:
    &network http:
        driver: bridge

services:
    http:
        image: registry.cn-hangzhou.aliyuncs.com/kennylee/tnginx:2.3.2
        container_name: "tnginx"
        ports:
            - "80:80"
        volumes:
            - ./config/nginx.conf:/etc/nginx/nginx.conf
            - ./config/conf.d/:/etc/nginx/conf.d/
        networks:
            - *network 
```


