# PostgreSQL

使用方法参考:

```
postgresql:
  restart: always
  image: postgres:9.6.2-alpine
  port:
  	- 5432:5432
  environment:
	- POSTGRES_USER=gitlab
	- POSTGRES_PASSWORD=gitlab
	- POSTGRES_DB=gitlabhq_production
# the following are hints on what volumes to mount if you want to persist data
#  volumes:
#	- data/postgresql:/var/lib/postgresql/data:rw
```

官方 https://hub.docker.com/_/postgres/

