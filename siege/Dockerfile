# ------------------------- builder -------------------------
FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ubuntu as builder

RUN apt-get update \
        && apt-get install -y build-essential automake curl openssl jq zlib1g-dev \
        && LATEST=$(curl -s https://api.github.com/repos/JoeDog/siege/tags | jq  --raw-output '.[0]["tarball_url"]') \
        && curl -L -o siege.tar.gz $LATEST \
        && tar xvvzf siege.tar.gz \
        && cd JoeDog* \
        && utils/bootstrap \
        && ./configure \
        && make \
        && make install

# ------------------------- container -------------------------
FROM registry.cn-hangzhou.aliyuncs.com/kennylee/alpine:alpine-3.9_glibc	

MAINTAINER kennylee26 <kennylee26@gmail.com>

COPY --from=builder /usr/local/bin/siege /usr/bin/siege
COPY --from=builder /usr/local/bin/bombardment /usr/bin/bombardment
COPY --from=builder /usr/local/bin/siege.config /usr/bin/siege.config

ENTRYPOINT ["siege"]

CMD ["--help"]
