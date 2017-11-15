# Gitlab CE

### 使用方法

1. 根据部署环境，修改 _docker-compose.env_ 文件。
2. 执行 _env.sh_ 脚本，生成docker-compose的配置文件。
3. 执行 `docker-compose up -d` 命令，启动容器。

> /opt/gitlab/embedded/bin/runsvdir-start: line 24: ulimit: pending signals: cannot modify limit: Operation not permitted


### 注意事项

* 容器首次启动可能比较久。
* 由于gitlab默认使用hostname为访问的路径，所以在docker环境下不适合，可指定`hostname`，然后再响应的ip映射，并且注意使用者的本地host映射地址和访问权限！


--------

官方 dockerfile 地址: https://hub.docker.com/r/gitlab/gitlab-ce/~/dockerfile/


