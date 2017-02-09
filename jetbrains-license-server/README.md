# Jetbrains License Server

Jetbrains全系列的证书验证服务器。

目前版本为 v1.0.1，实测支持到Jetbrains的2016.3.4版本系列IDE。

## 使用说明

1. 启动服务器

```
docker-compose up -d
```

2. 打开想要认证Jetbrains的IDE，例如，Idea，Webstorm等。

3. 找到register界面，选择的 `License Server` 的标签，在地址栏输入服务器的URL，如 http://127.0.0.1:9999 ，最后点击 Active 即可。


