# Redis

fork for https://github.com/docker-library/redis

## 高可用

设置 `master` 和 `slave` 两台 redis，然后N台(官方推荐3)台 `sentinel` 服务器。

`sentinel` 只要设置 `master` 的IP即可，挂了的话，会自动切换到 `slave` 为master。原master恢复后，不会切换回来。

应用机器，只要设置 `sentinel` 的服务器集群来发现可用redis服务器即可。

## 镜像更新

1. 更新变量 `REDIS_VERSION` 为最新版本
2. 下载具体 `redis-${REDIS_VERSION}.tar.gz` 文件。
3. 获取`SHA`，如命令 `shasum -a 256 ~/Downloads/redis-3.2.13.tar.gz`
4. 更新 `REDIS_DOWNLOAD_SHA` 为刚获取到的SHA值。




