# Jenkins

基于官方 https://hub.docker.com/r/jenkins/jenkins 镜像构建的mirror，做了本地化的一些提速修改。

官方镜像的jenkins版本比较低，所以Dockerfile中指定了比较新的版本。

查看全部jenkins的war包地址: https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/

### 更新注意事项:

1. 如果想升级的话，需要修改`JENKINS_VERSION`和`JENKINS_SHA`。

	获取SHA命令例子：

	```
	shasum -a 256 jenkins-war-2.164.3.war
	```

2. 更新jenkins的同时建议更新下`tini`的版本。`tini`下载版本查看 https://github.com/krallin/tini/releases/

## 使用

### 本地构建命令

```
docker build -t kennylee26/jenkins .
```

>注: jenkins安装插件比较痛苦，因为各种网络问题导致lugin安装不上。这时可以一个一个的下载到本地再进行安装。而一般jenkins升级后，插件也需要升级才能使用，所以不建议随便升级，等时间特别充裕再弄吧。

### 测试使用宿主docker

```
# 启动宿主docker的代理容器
docker run -d --restart=on-failure \
		--name socat \
		--expose 2375 \
		-v /var/run/docker.sock:/var/run/docker.sock \
		registry.cn-hangzhou.aliyuncs.com/kennylee/socat \
		tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock
		
# 构建镜像
docker build -t registry.cn-hangzhou.aliyuncs.com/kennylee/jenkins:lts-with-docker ./with-docker

# 进入容器测试docker命令
docker run -it --rm \
	-e "DOCKER_HOST=tcp://socat:2375" \
	--link=socat \
	-v /var/run/docker.sock:/var/run/docker.sock \
	registry.cn-hangzhou.aliyuncs.com/kennylee/jenkins:lts-with-docker bash
	
# 命令如
docker version
```

## 参考

[jenkins官方构建文件](https://github.com/jenkinsci/docker)


