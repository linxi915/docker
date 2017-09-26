FROM registry.cn-hangzhou.aliyuncs.com/kennylee/alpine

MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV JETBRAINS_LICENSE_SERVER_VERSION v1.0.4
ENV HOME /root

WORKDIR $HOME

COPY IntelliJIDEALicenseServer_linux_amd64 $HOME/JetBrainsLicenseServer_linux_64
RUN chmod +x $HOME/JetBrainsLicenseServer_linux_64

EXPOSE 1017

# Define default command.
CMD ["./JetBrainsLicenseServer_linux_64", "-l", "0.0.0.0", "-p","1017", "-u", "foo"]
