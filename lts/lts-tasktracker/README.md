# lts-tasktracker

调度程序具体跑业务的节点，使用 `springboot` 作为节点运行环境。 

### 注意事项

* 由于docker环境和lts的一些问题，需要手动绑定节点绑定的ip，请根据实际部署服务情况修改 `config/application.yml` 中的 `bind-ip` 的值。
* 目前代码内的 `app/lts-tasktracker.jar` 仅作为例子参考，因为实际部署的应用都需要根据业务来实现的。
* springboot构建后的项目请改名为 `lts-tasktracker.jar` 后，扔到app下。最终路径如 `app/lts-tasktracker.jar`。
* 由于 `tasktracker` 容器很大可能是启动多个的，所以就不指定 `container_name` 了。

另，至于 tasktracker+springboot 的编写，可参考:

* [官网example](https://github.com/ltsopensource/lts-examples) 
* [个人整合的单纯springboot例子](http://git.oschina.net/kennylee/lts-springboot)


