# registry-frontend

docker registry镜像私服的WebUI，用来查询私服里面的镜像；

see also: https://github.com/kwk/docker-registry-frontend

## 使用

registry应用启动成功后，若非https模式的话，需要修改docker上的配置，添加registry的信息到 `--insecure-registry` 才能正常使用(建议用域名)，例如:

```
{
	"insecure-registry": [
		"localhost:5000",
		"kenny.registry.docker:5000"
	]
}
```

