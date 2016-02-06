运行SpringBoot项目的Docker容器
===

默认依赖 kennylee26/java8 启用前可先执行 docker pull kennylee26/java8

使用方法:

1. 把部署包放到lib/目录下，并且命名为app.jar(即lib/app.jar)
2. 然后 docker-compose up -d 即可
3. 如果有app.jar包更新，可替换掉lib/app.jar包，然后docker-compose rm进行删除旧容器。最后重新启用 docker-compose up -d 即可。