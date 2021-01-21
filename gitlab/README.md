# Gitlab CE

## 使用方法

1. 根据部署环境，修改 _docker-compose.env_ 文件。
2. 执行 _env.sh_ 脚本，生成docker-compose的配置文件(`.env`文件)。
3. 执行 `docker-compose up -d` 命令，启动容器。

### 外部PostgreSQL

> 注：目前仅支持使用PostgreSQL数据库

官方不建议使用外部数据库，而实际上使用外部数据库时也会遇到不少问题，免于不必要的时间花费吧。

* [PostgreSQL versions](https://docs.gitlab.com/omnibus/package-information/postgresql_versions.html)
* [Database settings](https://docs.gitlab.com/13.7/omnibus/settings/database.html#gitlab-137-and-later)
* [External PostgreSQL database](https://docs.gitlab.com/13.7/charts/advanced/external-db/index.html)

创建gitlab数据库

```
CREATE DATABASE gitlabhq_production;
```

### 外部nginx

* [NGINX settings](https://docs.gitlab.com/omnibus/settings/nginx.html)

## 注意事项

* 容器首次启动可能比较久。
* 由于gitlab默认使用hostname为访问的路径，所以在docker环境下不适合，构造容器时指定了`hostname`，并且在相应的在gitlab启动参数中添加该配置。但除非该hostname是有对于的dns作为解析。不然，使用者应当的本地hosts文件中添加使用映射地址和ip。
* 尝试单独升级git版本失败，原因是gitlab使用的内部的git版本，具体路径是 `/opt/gitlab/embedded/bin/git`

## 文档参考

* [GitLab Docker images](https://docs.gitlab.com/13.7/omnibus/docker/README.html)
* [Configuring Omnibus GitLab](https://docs.gitlab.com/omnibus/settings/README.html)
* [gitlab官方dockerfile](https://hub.docker.com/r/gitlab/gitlab-ce/~/dockerfile/)
* [git官方帮助文档](https://about.gitlab.com/getting-help/)


