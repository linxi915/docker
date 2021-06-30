# see also: https://github.com/prometheus/blackbox_exporter
FROM prom/blackbox-exporter

EXPOSE      9115
ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "--config.file=/etc/blackbox_exporter/config.yml" ]
