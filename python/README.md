# Python3

## 说明

Python3的镜像，并配置pip使用国内镜像。

>注：默认python还是2版本；3的话需要用python3命令

如果想要把python3变成默认python命令，可使用:

```
update-alternatives --install /usr/bin/python python /usr/bin/python3 10
```

### 镜像版本说明

* latest(Dockerfile)

	Python运行环境，包含2和3两个版本，默认`python`为 `2.7.xx`。

* python-ppa(Dockerfile-ppa)

	基于 `latest` 版本，额外安装 `software-properties-common ` 的运行环境，可使用 `add-apt-repository` 命令来安装ppa源。
	
* flask(Dockerfile-flask)

	基于 `latest` 版本，额外安装了 `flask` 到默认python。
	
* python3(Dockerfile-python3-default)

	跟 `latest` 版本差不多，区别是把 `python3` 和 `pip3`作为了默认命令，并且使用更新的python3版本。
	
	


