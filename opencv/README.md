# OpenCV镜像

[OpenCV](https://opencv.org/) 各种运行环境镜像。

## 构建

由于github过于慢，所以构建时使用镜像源码进行：

```
docker build \
	--build-arg OPENCV_GIT_URL=https://gitee.com/kennylee/opencv \
	--build-arg  OPENCV_CONTRIB_GIT_URL=https://gitee.com/kennylee/opencv_contrib \
	-t kennylee26/opencv \
	./base/
```

## 参考

* [Dockerized OpenCV](https://gitlab.com/docker-hub/opencv)

