# Docker Registry v2

私有的Docker Registry，即docker镜像私服。

**注: v1和v2的数据不兼容。**

## 说明

默认docker镜像存储路径 `/var/lib/registry`

### 使用

registry应用启动成功后，若非https模式的话，需要修改docker上的配置，添加registry的信息到 `--insecure-registry` 才能正常使用(建议用域名)，例如:

```
{
	"insecure-registry": [
		"localhost:5000",
		"kenny.registry.docker:5000"
	]
}
```

#### 测试

```
# 从公服下载镜像
docker pull hello-world
# 重命名
docker tag hello-world localhost:5000/hello-world
# 提交到私服
docker push localhost:5000/hello-world
# 查看提交的镜像
curl -X GET http://localhost:5000/v2/_catalog
```

### 生成证书命令

```
openssl req -x509 \
-subj "/C=CN/ST=BeiJing/L=Dongcheng/CN=docker.kennylee.cn" \
-nodes -days 3650 -newkey rsa:2048 -keyout server.key -out server.pem
```

```
openssl x509 -outform der -in server.pem -out server.crt
```

详细可参见https://the.binbashtheory.com/creating-private-docker-registry-2-0-with-token-authentication-service


