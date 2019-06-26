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

