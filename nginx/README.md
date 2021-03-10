# Nginx

=====

Dockerfile 基于 [官方](https://github.com/nginxinc/docker-nginx) 修改，主要是本地化开发环境，例如修改163软件源，中文语言，一些基本工具安装。

## 镜像说明

* [vuejs](./vuejs): 配置好 `/usr/share/nginx/html` 作为 `vue.js` router静态页面的反向代理目录的镜像。由于仅仅作为静态页面服务器，使用最小化容器即可。


