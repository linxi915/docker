# Frp

frp 是一个高性能的反向代理应用，可以帮助您轻松地进行内网穿透，对外网提供服务，支持 tcp, udp, http, https 等协议类型，并且 web 服务支持根据域名进行路由转发。

Frp官方资源地址:

* [github](https://github.com/fatedier/frp)
* [中文手册](https://github.com/fatedier/frp/blob/master/README_zh.md)

## docker化说明

1. 自动基于 https://github.com/fatedier/frp/releases 中的最新版本进行构建，即 `每次编译都会拉取最新的frp包` 升级非常简单。
2. 再一次提醒，注意宿主机的防火墙的配置！！
3. 关于network_mode

	默认设置为 `host`。据目前测试，frpc完全是通过客户端连接来实现代理数据的，所以不需要开通任何端口。设置为 `host` 的原因是，一般情况下 `local_ip` 可以直接写 `127.0.0.1`。否则，非 `host` 模式就要填写一个访问本机的地址，而不能是127.0.0.1(除非应用和frpc在都在容器内吧)，比较麻烦。

4. 必要时，需要根据实际环境进行配置修改，例如 `docker-compose` 中的端口，或 `.ini` 文件。

## Docker-compose使用参考

### frps

```
version: '2'
services:
    app:
        image: registry.cn-hangzhou.aliyuncs.com/kennylee/frp
        container_name: frps
        ports:
            - "7000:7000"
            - "7500:7500"
            - "8080:8080"
        volumes:
            - ./frps.ini:/data/frp/frps.ini:z
        restart: always
        entrypoint:
            - ./frp/frps
            - -c
            - /data/frp/frps.ini
```

注意本地创建 `frps.ini` 配置文件

### frpc

```
version: '2'
services:
    app:
        image: registry.cn-hangzhou.aliyuncs.com/kennylee/frp
        network_mode: "host"
        volumes:
            - ./frpc.ini:/data/frp/frpc.ini:z
        restart: always
        entrypoint:
            - ./frp/frpc
            - -c
            - /data/frp/frpc.ini
```

注意本地创建 `frpc.ini` 配置文件

