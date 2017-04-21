# Tomcat+sshd

说明：

1. tomcat安装目录为/opt/tomcat，但/root/tomcat也有软连接，ssh后可在根目录看到tomcat目录。
2. ssh默认账号密码为 `root/111111`
3. 端口开放22(ssh)、8080(tomcat)。
4. 想修改JAVA_OPTS环境变量，可通过修改 `~/.bashrc` 和 `/etc/init.d/tomcat` 文件(如果是使用service tomcat命令来操作)


