# Frp

frp 是一个高性能的反向代理应用，可以帮助您轻松地进行内网穿透，对外网提供服务，支持 tcp, udp, http, https 等协议类型，并且 web 服务支持根据域名进行路由转发。

Frp官方资源地址:

* [github](https://github.com/fatedier/frp)
* [中文手册](https://github.com/fatedier/frp/blob/master/README_zh.md)

## docker化说明

1. 自动基于 https://github.com/fatedier/frp/releases 中的最新版本进行构建。
2. 默认 `network_mode` 为 `host`。说白了，其实就是为了避免由于暂不太了解frp原理(例如是否有额外随机监听的端口和其他机制等)，而造成无法正常使用情况。
3. `frpc` 实际上估计可以跟一些docker化的应用集成一起（应该不用设置 `network_mode`  为`host`，也许吧?），实现把应用反向代理出去的作用（类似nginx）。


