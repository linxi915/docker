# sonatype/nexus3

Dockerfile仅作为国内构建镜像使用，没任何修改。因为原镜像默认使用的是 `redhat` 系统，使用较少。而修改基础系统的话，就稍微有点麻烦了（虽然原镜像源码项目有提供CentOS的构建文件）。

我们需要的就是开发时的一个maven私服，不是么？

see also [sonatype/nexus3](https://hub.docker.com/r/sonatype/nexus3/)

## 使用

* `/nexus-data`: 数据目录，默认挂载。

## 官方说明

To run, binding the exposed port 8081 to the host.

```
$ docker run -d -p 8081:8081 --name nexus sonatype/nexus3
```

To (re)build the image, copy the Dockerfile and do the build:

```
$ docker build --rm=true --tag=sonatype/nexus3 .
```

### Notes

* Default user is `admin` and the uniquely generated password can be found in the `admin.password` file inside the volume. See Persistent Data for information about the volume.

* Installation of Nexus is to `/opt/sonatype/nexus`.

* A persistent directory, `/nexus-data`, is used for configuration, logs, and storage. This directory needs to be writable by the Nexus process, which runs as UID 200.

### Persistent Data

***Mount a host directory as the volume***. This is not portable, as it relies on the directory existing with correct permissions on the host. However it can be useful in certain situations where this volume needs to be assigned to certain specific underlying storage.

```
$ mkdir /some/dir/nexus-data && chown -R 200 /some/dir/nexus-data
$ docker run -d -p 8081:8081 --name nexus -v /some/dir/nexus-data:/nexus-data sonatype/nexus3
```


