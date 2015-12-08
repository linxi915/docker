本地的gitbook创建工具。

基本参考 https://hub.docker.com/r/billryan/gitbook/

实际上可以把此容器看成的一个gitbook命令行的封装。

以下是使用方法，来源于 docker pull billryan/gitbook

Usage
Read the official documentation GitbookIO/gitbook first.

# init
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook init
# serve
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook serve
# build
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook build
For short, you can use alias for the long command line text. Just place the alias statement in your .bashrc or .zshrc.

alias gitbook='docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook'
# init
gitbook init
# serve
gitbook serve
# build
gitbook build
