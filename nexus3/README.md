# sonatype/nexus3

[sonatype/nexus3](https://hub.docker.com/r/sonatype/nexus3/)

A Dockerfile for Sonatype Nexus Repository Manager 3, based on CentOS. The git repo is https://github.com/sonatype/docker-nexus3.

To run, binding the exposed port 8081 to the host.

```
$ docker run -d -p 8081:8081 --name nexus sonatype/nexus3
```

To test:

```
$ curl -u admin:admin123 http://localhost:8081/service/metrics/ping
```

To (re)build the image, copy the Dockerfile and do the build:

```
$ docker build --rm=true --tag=sonatype/nexus3 .
```

### Notes

Default credentials are: admin / admin123


