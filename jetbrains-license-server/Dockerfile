FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ubuntu 

MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV JETBRAINS_LICENSE_SERVER_VERSION=v1.0.1\
    JETBRAINS_LICENSE_SERVER_URL=https://doc-08-a0-docs.googleusercontent.com/docs/securesc/lnh143aaib3atculea70h5pk2ab6f3ll/in50gbpi4bvtg0bu2p79i13a64970ba5/1486612800000/04240501430425058257/13618932166282600040/0B0Y6RN-E_loeUEdIYW8wTGxUczQ?e=download&nonce=t9gbcl9jkmvo2&user=13618932166282600040&hash=b6cqik95b9of7ko68jf651mt51rvok8l

RUN curl -o $HOME/JetbrainsLicenseServer_$JETBRAINS_LICENSE_SERVER_VERSION $JETBRAINS_LICENSE_SERVER_URL

# Define default command.
CMD ["bash"]
