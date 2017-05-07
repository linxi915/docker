# weblogic-apps

实现weblogic的应用集群，一个 `AdminServer` 和N个应用的container环境。使用命令行和 `AdminServer` 进行实现。

## 使用方法

### 初始化项目

1. 把war包放到app目录下。
2. 根据应用名称和包名修改 `container-scripts/app-deploy-servers.py` 文件。主要是 `app_name` 和 `app_pkg` 两项。
3. 为了提高发布速度，也可以在 `libs` 目录下存放公共包。
4. 启动weblogic集成环境

	```
	docker-compose up -d
	```

	并耐心等待全部 `ManagedServer` 初始化/启动完毕。

5. 执行发布应用命令

	```
	sh deploy.sh
	```

	发布后，应用会上传到应用容器的 `/u01/oracle/user_projects/domains/base_domain/servers/ManagedServer-2c1zRc@4f8ce9778907/stage/` 路径下，其中 `ManagedServer-2c1zRc@4f8ce9778907` 为随机生成的应用容器节点。

### 重新发布

1. 在app目录下替换新的war包。
2. 根据情况，看是否需要修改 `container-scripts/app-deploy-servers.py` 文件。
3. 重新执行 `sh deploy.sh` 即可。


