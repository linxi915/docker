# Tomcat8+jdk7+sshd

### build

```
docker build -t kennylee26/sshd-tomcat8-jdk7 .
```

说明：

1. tomcat安装目录为/opt/tomcat，但/root/tomcat也有连接，ssh后可在根目录看到tomcat目录。
2. ssh默认账号密码为 root/111111
3. 端口开放22、8080。


