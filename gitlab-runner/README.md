# Gitlab-Runner

注意事项：

1. 注意宿主机的防火墙，会造成runner无法绑定gitlab的问题。
2. 由于使用 [sameersbn/docker-gitlab-ci-multi-runner](https://github.com/sameersbn/docker-gitlab-ci-multi-runner) 所以，`EXECUTOR=shell` 仅支持是shell。
3. 请根据实际部署环境修改 `.env` 文件中的配置和docker-compose.yml中的`extra_hosts`。
4. `docker`环境下的gitlab使用hostname作为域名，不配置网络的情况下会导致构建失败问题。所以设置了gitlab的hostname。runner中也需要对应的设置gitlab访问的ip地址。
5. 

image主要修改

* 增加java环境变量。
* 修改镜像内的源。

若离线的情况下，可先构建本地先构建，参考命令

```
docker build -t foo/gitlab-runner .
```


