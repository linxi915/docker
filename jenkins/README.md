# Jenkins

基于官方 https://hub.docker.com/_/jenkins 镜像构建的mirror，做了本地化的一些提速修改。

官方镜像的jenkins版本比较低，所以Dockerfile中指定了比较新的版本，如果想升级的话，自行修改`JENKINS_VERSION`和`JENKINS_SHA`即可。

获取SHA命令例子：

```
shasum -a 256 jenkins-war-2.164.3.war
```

## 使用

### 本地构建命令

```
docker build -t kennylee26/jenkins .
```

>注: jenkins安装插件比较痛苦，因为各种网络问题导致lugin安装不上。这时可以一个一个的下载到本地再进行安装。而一般jenkins升级后，插件也需要升级才能使用，所以不建议随便升级，等时间特别充裕再弄吧。

## 参考

[jenkins官方构建文件](https://github.com/jenkinsci/docker)


