# Jetbrains License Server

Jetbrains全系列的证书验证服务器，镜像大小不到10M。

版本为 v1.0.6，目前(2018-04-09)实测支持到Jetbrains的2018.1版本系列IDE。

## 使用说明

1. 启动服务器

```
docker run -d -p 9999:1017 registry.cn-hangzhou.aliyuncs.com/kennylee/jetbrains-license-server
```

2. 打开想要认证Jetbrains的IDE，例如，Idea，Webstorm等。

3. 找到register界面，选择的 `License Server` 的标签，在地址栏输入服务器的URL，如 http://127.0.0.1:9999 ，最后点击 Active 即可。

注：使用者需要在hosts文件上添加 `0.0.0.0 account.jetbrains.com`


