# RocketMQ

参见 https://github.com/apache/rocketmq-docker 的编译容器。

## 说明 

### 镜像

镜像文件 [image-build/Dockerfile](./image-build/Dockerfile) 中的 `ARG version=4.6.0` 为具体构建镜像的版本，可根据 http://archive.apache.org/dist/rocketmq/ 发布的版本列表来选择构建。

### docker-compose.yml

* [cluster](./cluster): 集群节点环境。`docker-compose.yml` 使用了 `ROCKETMQ_VERSION` 动态变量，修改使用的RocketMQ版本时，需要对应修改同目录下的`.env`文件中的`ROCKETMQ_VERSION`对应的值。
* [standalone](./standalone): 单节点环境。

