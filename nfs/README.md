Docker NFS Server
================

fork for [cpuguy83/docker-nfs-server](https://github.com/cpuguy83/docker-nfs-server)

Usage
----
```bash
docker run -d --name nfs --privileged cpuguy83/nfs-server /path/to/share /path/to/share2 /path/to/shareN
```

```bash
docker run -d --name nfs-client --privileged --link nfs:nfs cpuguy83/nfs-client /path/on/nfs/server:/path/on/client
``` 

More Info
=========

See [docker-quicktip-4-remote-volumes](./2014-03-29-docker-quicktip-4-remote-volumes.md)


