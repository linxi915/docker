# Gollum

## 说明

Gollum 是一个建立在Git之上的简单wiki系统，并且支持[markdown语法](https://github.com/gollum/gollum#markups)等诸多编写方式。github: https://github.com/gollum/gollum

## 使用

由于一些极端情况，不能联网，所以默认情况是使用本地的 `image` ，如果非这样的情况，docker-compose文件可改为 `build .`

### 基础镜像构建命令

```
docker build -t kennylee/gollum .
```

编译时注意启用IPv4 如 `sudo sysctl -w net.ipv4.ip_forward=1`

### 注意事项

* data目录注意权限，还有需要有 `git init` 因为 `Gollum` 会读取里面的md文件作为

## 参考

* [Gollum via Docker](https://github.com/gollum/gollum/wiki/Gollum-via-Docker)


