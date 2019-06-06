Docker Registry v2的docker-compose启动文件

-------
注意，v1和v2的数据不兼容。

证书命令参考：
openssl req -x509 \
-subj "/C=CN/ST=BeiJing/L=Dongcheng/CN=docker.kennylee.cn" \
-nodes -days 3650 -newkey rsa:2048 -keyout server.key -out server.pem

openssl x509 -outform der -in server.pem -out server.crt

详细可参见https://the.binbashtheory.com/creating-private-docker-registry-2-0-with-token-authentication-service
