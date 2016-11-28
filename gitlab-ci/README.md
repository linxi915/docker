# gitlab

注意宿主机器映射地址和访问权限！

指定docker-compose.yml可参考命令

```
docker-compose up -d
```

配置runner，第一次启动后，输入下面命令:

```
docker exec -it gitlab-runner gitlab-runner register
```
