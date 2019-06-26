# registry-frontend

docker registry镜像私服的WebUI，用来查询私服里面的镜像；

see also: https://github.com/kwk/docker-registry-frontend

## 说明

### registry https模式（SSL）

#### 生成证书命令

首次运行，请执行生成ssl证书脚本，命令参考如下:

```
sh gencert.sh
```

>注: 由于证书是自行颁发的，当执行镜像上传或下载时，客户端会报 `x509: certificate signed by unknown authority` 信息，即提示由未知颁发机构签名的证书，所以不能正常连接；

解决方法：

1. 把证书`pem`文件下载下来，写入到本地操作系统，使系统信任该办法证书，例如导入到 `/etc/pki/tls/certs/ca-bundle.crt`
2. 配置docker客户端，把域名添加到 `insecure-registry` 中。

#### 启动

```
docker-compose up -d
```

### registry http

#### 启动

```
docker-compose -f docker-compose-insecure.yml up -d
```

#### 客户端配置

registry应用启动成功后，若非https模式的话，需要修改客户端上的docker配置，添加registry的信息到 `--insecure-registry` 才能正常使用(建议用域名)，例如:

```
{
	"insecure-registry": [
		"localhost:5000",
		"kenny.registry.docker:5000"
	]
}
```

