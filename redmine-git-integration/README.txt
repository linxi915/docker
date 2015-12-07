build

docker build -t kennylee26/redmine-git .

说明：
与redmine集成，根据git/<项目名>这样的约定redmine项目中的Identifier进行匹配，并通过校验输入的用户与redmine上的用户组是否一致来判断下载用户是否有权限进行下载和上传。

构建好image后，使用docker-compose启动容器即可。

默认Git repositories在 /home/git
初始化项目需手动的在该目录上项目目录并 git init --bare 进行git初始化，但创建后记得把权限改为777。

要想有更好的体验，最好通过在redmine插件进行仓库的创建。
