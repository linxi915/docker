# Siege

Siege是一款开源的压力测试工具，可以根据配置对一个WEB站点进行多用户的并发访问，记录每个用户所有请求过程的相应时间，并在一定数量的并发访问下重复进行。它支持下面3种操作模式： 

1. Regression (when invoked by bombardment)Siege从配置文件中读取URLs，按递归方式，逐个发送请求 
2. Internet simulation (Siege从配置文件中读取URLs，随机选取URL发送请求)
3. Brute force (在命令行上写上一个单独的URL，发送请求)

## 使用





