# Prometheus

基于镜像 [bitnami/prometheus](https://hub.docker.com/r/bitnami/prometheus) 构建。

相关构建镜像

* [bitnami/alertmanager](https://hub.docker.com/r/bitnami/alertmanager)
* [prom/blackbox-exporter](https://hub.docker.com/r/prom/blackbox-exporter)
* [prom/pushgateway](https://hub.docker.com/r/prom/pushgateway)

k8s

* [bitnami/prometheus-operator](https://hub.docker.com/r/bitnami/prometheus-operator)

> 注：non-root容器

## 使用

### 数据

* `/opt/bitnami/prometheus/data` 数据源。
* `/opt/bitnami/prometheus/conf/prometheus.yml` 配置文件。

