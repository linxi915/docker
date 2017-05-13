# weblogic-apps

weblogic，在线部署的例子，部署比较灵活，但比较不稳定。没离线的好用，可参考 `weblogic-appdeploy` 文件夹例子。

实现weblogic的应用集群，一个 `AdminServer` 和N个应用的container环境。使用命令行和 `AdminServer` 进行实现。

## 使用方法

### 初始化项目

1. 把war包/解压目录放到app目录下。
2. 根据情况，看是否需要修改 `AdminServer` 容器中的发布脚本(`container-scripts/app-deploy-servers.py`)变量，例如

	```
	APP_NAME=app
	APP_PKG_FILE=sample.war
	APP_PKG_LOCATION=/u01/oracle/app
	APP_STAGE_MODE=nostage
	APP_UPLOAD=False
	```
	
3. 为了提高发布速度，建议使用 `nostage` 模式，不过需要网络存储配合。
4. 启动weblogic集成环境

	```
	docker-compose up -d
	```

	并耐心等待全部 `ManagedServer` 初始化/启动完毕，启动完毕后会看到类似如下信息。
	
	```
	server1_1      | <May 8, 2017, 9:55:29,418 PM CST> <Notice> <WebLogicServer> <BEA-000360> <The server started in RUNNING mode.> 
server1_1      | <May 8, 2017, 9:55:29,546 PM CST> <Notice> <WebLogicServer> <BEA-000365> <Server state changed to RUNNING.> 
	```

5. 执行发布应用命令

	```
	sh deploy.sh
	```

	如果stage部署模式的话，发布后，应用会上传到应用容器的 `/u01/oracle/user_projects/domains/base_domain/servers/ManagedServer-2c1zRc@4f8ce9778907/stage/` 路径下，其中 `ManagedServer-2c1zRc@4f8ce9778907` 为随机生成的应用容器节点。

### 重新发布

1. 在app目录下替换新的war包。
2. 根据情况，看是否需要修改 `AdminServer` 容器中的发布脚本(`container-scripts/app-deploy-servers.py`)变量，例如

	```
	APP_NAME=app
	APP_PKG_FILE=sample.war
	APP_PKG_LOCATION=/u01/oracle/app
	APP_STAGE_MODE=nostage
	APP_UPLOAD=False
	```

3. 重新执行 `sh deploy.sh` 即可。


