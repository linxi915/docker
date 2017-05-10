# weblogic-appdeploy

自动部署的一种方案，在 `Dockerfile` 构建镜像时，进行了 `离线发布发布` ，实际上项目还没被初始化的。可以等从镜像开启容器时，动态加载项目的内容来实现初始化。

集群，多应用容器环境也适用，但最好配合网络存储适用。

注意事项:

* `AdminServer` 必须部署项目，才能让集群的 `NodeManager` 容器部署项目。
* 修改部署包时，可修改 `Dockerfile`。记得重新构建 `docker-compose build` 。

