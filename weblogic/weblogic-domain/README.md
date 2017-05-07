# Docker for Weblogic with domain

fork for https://github.com/playniuniu/docker-weblogic-domain

-----

调整如下：

* 修改默认的基础镜像


----

使用说明

### 测试

```
docker build -t kennylee26/weblogic-domain .
docker run -d -p 8001:8001 --name=wlsadmin kennylee26/weblogic-domain startWebLogic.sh

docker run -d --link wlsadmin:wlsadmin kennylee26/weblogic-domain startNodeManager.sh
# 启动
docker run -d --link wlsadmin:wlsadmin kennylee26/weblogic-domain createMachine.sh
docker run -d --link wlsadmin:wlsadmin kennylee26/weblogic-domain createServer.sh
```

访问 http://127.0.0.1:8001/console

账号密码: `weblogic/welcome1`


