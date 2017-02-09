FROM registry.cn-hangzhou.aliyuncs.com/kennylee/alpine

MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV JETBRAINS_LICENSE_SERVER_VERSION=v1.0.1\
    HOME=/root

WORKDIR $HOME

COPY JetBrainsLicenseServer_linux_64 $HOME
RUN chmod +x $HOME/JetBrainsLicenseServer_linux_64

EXPOSE 9999

# Define default command.
CMD ["/root/JetBrainsLicenseServer_linux_64 --host=0.0.0.0 -p 9999"]
