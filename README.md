## 说明

存放各种docker image构建脚本或者快速启动的docker-compose文件。

实现：一处构建，处处可用，方便健忘人士和减轻国内开发人员的负担。

最后，我会在有空的时候尽量完善各个镜像的README，希望对大家有点帮助。

### 这个库的作用？

1. 存放由于种种原因，导致官方image不好使，需要自己构建的docker image。
2. 存放使用过的应用的快速启动文件docker-compose。
3. 由于想在国内快速下载某些镜像，所以使用第三方构建平台创建镜像构建仓库，构建平台需要代码仓库。

### 注意事项

1. 一些compose内都是设置data挂载到本目录的，方便实现数据分离，但这些数据是忽略提交的，所以使时需要注意新建目录和给予权限。
2. 一些旧版本的系统镜像环境中，可能会由于国内镜像源抽风造成无法安装包的问题。建议用新版本系统或者改为用官网源。

## 关于应用的镜像下载

这个项目初衷是加速，所以其实很多应用的 *Dockerfile* 都已经在阿里云上构建好了，大家如果想使用的话并不需要再自己花时间去构建。

前阵子，大家可以直接在 https://dev.aliyun.com/search.html 进行镜像搜索。嗯，而现在？如果你已经点了前面这个地址的话，发现已经不像是一个镜像搜索的地方了，所以目前找得比较痛苦，但还是可以找到的，可以通过下面的方式（我就不再自己列出全部构建好的镜像甚至镜像版本了）。

1. 登录 https://cr.console.aliyun.com
2. 添加 镜像中心 → 镜像搜索
3. 在右侧【用户公开镜像】的输入框内输入 kennylee 就会列出目前我目前已经公开的镜像列表，包括镜像版本也可以看到。

示意图参考下面:

![](assets/images-list-1.png)

## 镜像说明

*有必要还是列一些比较有用的构建好的镜像，但只是会列部分重要的，其他细节的镜像版本，请到阿里云镜像市场自行查看了。*

### [OpenCV](./opencv/)

[OpenCV](https://opencv.org/) 的一些运行环境镜像。由于没有安装包，`只能编译安装`，所以比较麻烦和耗费时间（由于网络和电脑硬件等因素）；

阿里云镜像地址 `registry.cn-hangzhou.aliyuncs.com/kennylee/opencv`

#### 镜像版本

* [latest](./opencv/base/) - 最后编译的opencv版本，带python3环境(但opencv_python未安装)；
* [openjdk-jdk8](./opencv/java/openjdk-jdk8/)  - opencv+java8运行环境；
* [tomcat8](./opencv/tomcat8/)  - 基于 `openjdk-jdk8` 镜像再安装好tomcat的运行环境；
* [python-dlib](./opencv/python-dlib/) - 基于latest镜像，再安装了python和dlib下的支持，shape_predictor_68_face_landmarks.dat文件在`/var/dlib-data/`

