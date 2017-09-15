# cAdvisor

## Quick Start: Running cAdvisor in a Docker Container

To quickly tryout cAdvisor on your machine with Docker, we have a Docker image that includes everything you need to get started. You can run a single cAdvisor to monitor the whole machine. Simply run:

```
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --restart=always \
  --detach=true \
  --name=cadvisor \
  registry.cn-hangzhou.aliyuncs.com/kennylee/cadvisor:apline
```
  
cAdvisor is now running (in the background) on http://localhost:8080. The setup includes directories with Docker state cAdvisor needs to observe.

## Web UI

cAdvisor exposes a web UI at its port:

http://\<hostname\>:\<port\>/

See the documentation for more details.

## Remote REST API & Clients

cAdvisor exposes its raw and processed stats via a versioned remote REST API. See the API's documentation for more information.

There is also an official Go client implementation in the client directory. See the documentation for more information.

see also https://hub.docker.com/r/google/cadvisor-canary/

-----

注意修改本地映射的 `--volume=/var/lib/docker/:/var/lib/docker:ro`


