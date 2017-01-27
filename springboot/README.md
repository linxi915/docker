# SpringBoot

运行SpringBoot的jar项目的Docker容器(JRE8)。

使用方法:

1. 把使用编译好的springboot的jar部署包放到app目录下即可。（不要出现多个jar的情况，否则不保证得到你想要的运行结果，因为会默认执行其中一个。）
2. 运行命令 `docker-compose up -d`
3. 为了方便修改配置，默认在 `docker-compose.yml` 下配置了加载宿主机器中的 `application.yml`。如果不是你想要的，请自行修改。
4. 默认使用 `alpine` 为容器环境，因为比较小，但缺点是中文支持不了，也不适用于一些对服务器运行的本地开发环境比较高依赖的应用。如果不想这样可以修改下 `image-build/Dockerfile` 文件。

	把 
	
	```
	FROM registry.cn-hangzhou.aliyuncs.com/kennylee/java:alpine-oraclejava-jre8u121b13
	```
	
	改成
	
	```
	FROM registry.cn-hangzhou.aliyuncs.com/kennylee/java:openjdk-8-jre
	```
	
	然后 `docker-compose build`  构建即可。

