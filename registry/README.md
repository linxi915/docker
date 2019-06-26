# Docker Registry v2

私有的Docker Registry，即docker镜像私服。

**注: v1和v2的数据不兼容。**

## 说明

默认docker镜像存储路径 `/var/lib/registry`

### 生成证书命令

首次运行，请执行生成ssl证书脚本，命令参考如下:

```
sh gencert.sh
```

## 使用

### https模式

请确保证书已经生成好，利用docker-compose启动应用：

```
docker-compose up -d
```

测试执行下面命令

```
# 从公服下载镜像
docker pull hello-world
# 重命名
docker tag hello-world localhost/hello-world
# 提交到私服
docker push localhost/hello-world
# 查看提交的镜像
curl -k -X GET https://localhost/v2/_catalog
```

### 非https模式

非https模式的话，需要修改docker上的配置，添加registry的信息到 `--insecure-registry` 才能正常使用(建议用域名)，例如:

```
{
	"insecure-registry": [
		"localhost:5000",
		"kenny.registry.docker:5000"
	]
}
```

启动非https的registry容器

```
docker-compose -f docker-compose-insecure.yml up -d
```

测试执行下面命令

```
# 从公服下载镜像
docker pull hello-world
# 重命名
docker tag hello-world localhost:5000/hello-world
# 提交到私服
docker push localhost:5000/hello-world
# 查看提交的镜像
curl -k -X GET http://localhost:5000/v2/_catalog
```

### Authentication身份认证

身份认证，即配置docker registry的下载和上传权限，可实现不允许匿名随便上传镜像的功能。

添加身份认证服务器依赖镜像 [cesanta/docker_auth](https://hub.docker.com/r/cesanta/docker_auth)，本地配置文件在 `auth_server/config/auth_config.yml` ，可自行根据实际情况进行修改。

默认配置信息：admin可上传下载，账号密码 `admin/admin`，匿名用户可下载镜像

其他更多配置参考: https://github.com/cesanta/docker_auth/tree/master/examples/

#### 生成账号密码

```
htpasswd -nbB <账号> <密码>
```

生成账号密码后可添加到 `auth_config.yml`

#### 启动和使用

启动前，请先修改 `.env` 中的 `docker_auth_public_ip` 为当前运行服务器的IP，不然无法完成 `docker login` 。

启动命令

```
docker-compose -f docker-compose-with-auth.yml up -d
```

```
# 从公服下载镜像
docker pull hello-world
# 重命名
docker tag hello-world localhost/hello-world
# 测试提交到私服是否上传失败
docker push localhost/hello-world

# 登录本地私服
docker login --username admin --password admin  https://localhost
# 再一次提交到私服
docker push localhost/hello-world
```

#### docker登录命令

```
# 登录
docker login --username <账号> --password <密码> https://<私服地址>
# 登出
docker logout https://<私服地址>
```

**注意域名解析**


