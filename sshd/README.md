# sshd

基于 `supervisord` 镜像，安装了sshd和初始化配置。

默认远程账号密码为 `root/11111`

鉴于需要添加sshd的容器情景一般都是多应用共用容器的情况，所以干脆默认使用 `supervisord` 来管理了，更加方便，合理，适用于扩展。


