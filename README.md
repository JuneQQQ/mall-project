# 京西商城

### 项目简介

本项目是一套仿京东商城的电商项目，包括前台商城系统以及后台管理系统，基于 SpringBoot、SpringCloud、SpringCloud Alibaba、MyBatis
Plus实现。前台商城系统包括：用户登录、注册、商品搜索、商品详情、购物车、订单、秒杀活动等模块。后台管理系统包括：系统管理、商品系统、优惠营销、库存系统、订单系统、用户系统、内容管理等七大模块（暂未完全实现）。

### 项目资源地址

- 线上地址:  http://projectdemo.top（如有异常请尝试刷新）

#### 前台系统

![image-20220724163438183](http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220724163438183.png)

首页下方有当前时段可以参与的秒杀，当使用搜索进入相关商品页时，也会提示该商品正在参与秒杀

![image-20220724165529441](http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220724165529441.png)

微信登录由于一些原因在线上环境并不可用，本地调试时是可以的。因此只能新选择账户登录输入账号密码

> 备用账号（如果注册出现问题或者不想注册）：
>
> 123456
>
> 123456
>
> 支付宝测试账号：
>
> jgggga5962@sandbox.com
>
> 111111（登录密码和支付密码都是 ）

![image-20220724173239265](http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220724173239265.png)

搜索"手机"

![image-20220724170106488](http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220724170106488.png)

<img src="http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220325154216209.png" alt="image-20220325154216209" style="zoom:50%;" />

![image-20220325154516527](http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220325154516527.png)<img
src="http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220325154924454.png" alt="
image-20220325154924454" style="zoom:50%;" />

我的订单

![image-20220724170024366](http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220724170024366.png)

#### 后台系统

仅在本地部署，没有上线

<img src="http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220325155010766.png" alt="image-20220325155010766" style="zoom:50%;" />

<img src="http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220325155037422.png" alt="image-20220325155037422" style="zoom:50%;" />

<img src="http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220325155050701.png" alt="image-20220325155050701" style="zoom:50%;" />



### 项目介绍

#### 微服务架构

- mall-cart 购物车模块
- mall-common 公共依赖模块
- mall-coupon 优惠服务，包含秒杀场次、优惠券等
- mall-gateway 网关
- mall-member 会员服务
- mall-order 订单服务
- mall-product 商品服务
- mall-search 搜索服务，使用elasticsearch
- mall-seckill 秒杀服务
- mall-third-party 第三方服务-短信、OSS
- mall-ware 库存服务
- mall-authentication 权限模块，目前只针对登录
- renren-fast 商城后台的后端系统
- renren-generator 后端增删改查生成模块


![2022.03.26 阶段性部署](http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220326232156188.png)



#### 技术选型

##### 后端技术

| 技术               | 说明                     | 官网                                                  |
| ------------------ | ------------------------ | ----------------------------------------------------- |
| SpringBoot         | 容器+MVC框架             | https://spring.io/projects/spring-boot                |
| SpringCloud        | 微服务架构               | https://spring.io/projects/spring-cloud               |
| SpringCloudAlibaba | 一系列组件               | https://spring.io/projects/spring-cloud-alibaba       |
| MyBatis-Plus       | ORM框架                  | [https://mp.baomidou.com](https://mp.baomidou.com/)   |
| renren-generator   | 人人开源项目的代码生成器 | https://gitee.com/renrenio/renren-generator           |
| Elasticsearch      | 搜索引擎                 | https://github.com/elastic/elasticsearch              |
| RabbitMQ           | 消息队列                 | [https://www.rabbitmq.com](https://www.rabbitmq.com/) |
| Springsession      | 分布式缓存               | https://projects.spring.io/spring-session             |
| Redisson           | 分布式锁                 | https://github.com/redisson/redisson                  |
| Docker             | 应用容器引擎             | [https://www.docker.com](https://www.docker.com/)     |
| OSS                | 对象云存储               | https://github.com/aliyun/aliyun-oss-java-sdk         |

##### 前端技术

| 技术      | 说明       | 官网                                                    |
| --------- | ---------- | ------------------------------------------------------- |
| Vue       | 前端框架   | [https://vuejs.org](https://vuejs.org/)                 |
| Element   | 前端UI框架 | [https://element.eleme.io](https://element.eleme.io/)   |
| thymeleaf | 模板引擎   | [https://www.thymeleaf.org](https://www.thymeleaf.org/) |
| node.js   | 服务端的js | https://nodejs.org/en                                   |

#### 开发工具

| 工具         | 说明                | 官网                                                    |
| ------------ | ------------------- | ------------------------------------------------------- |
| InteliJ IDEA | 开发Java程序        | https://www.jetbrains.com/idea/download                 |
| RDM          | redis客户端连接工具 | https://redisdesktop.com/download                       |
| SwitchHosts  | 本地host管理        | https://oldj.github.io/SwitchHosts                      |
| Termius      | Linux远程连接工具   | http://www.netsarang.com/download/software.html         |
| Navicat      | 数据库连接工具      | http://www.formysql.com/xiazai.html                     |
| Postman      | API接口调试工具     | [https://www.postman.com](https://www.postman.com/)     |
| Jmeter       | 性能压测工具        | [https://jmeter.apache.org](https://jmeter.apache.org/) |
| Typora       | Markdown编辑器      | [https://typora.io](https://typora.io/)                 |

#### 开发环境

纯docker云服务器部署

| 工具          | 版本号 | 下载                                                         |
| ------------- | ------ | ------------------------------------------------------------ |
| JDK           | 1.8    | https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html |
| Mysql         | 8.0    | [https://www.mysql.com](https://www.mysql.com/)              |
| Redis         | Redis  | https://redis.io/download                                    |
| Elasticsearch | 7.17.0 | https://www.elastic.co/downloads                             |
| Kibana        | 7.17.0 | https://www.elastic.co/cn/kibana                             |
| RabbitMQ      | 3.9.11 | http://www.rabbitmq.com/download.html                        |
| Nginx         | 1.20.2 | http://nginx.org/en/download.html                            |

#### 环境搭建

##### 域名映射

```
127.0.0.1 projectdemo.top
127.0.0.1 www.projectdemo.top
127.0.0.1 item.projectdemo.top
127.0.0.1 search.projectdemo.top
127.0.0.1 auth.projectdemo.top
127.0.0.1 cart.projectdemo.top
127.0.0.1 order.projectdemo.top
127.0.0.1 member.projectdemo.top
127.0.0.1 seckill.projectdemo.top
```

##### nginx

```nginx

#user  nobody;
worker_processes  1;

events {
    worker_connections  1024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;

    server {
        listen       80;
        server_name  *.projectdemo.top,*.vaiwan.cn;

        location /order/alipay/notify {

            proxy_set_header Host order.projectdemo.top;
            proxy_pass  http://mall;

        }

        location /static {
            root /opt/homebrew/etc/nginx/html;
            expires  3s;  
       }

        location / {
        
            proxy_set_header Host $host;
            proxy_set_header   X-Real-IP        $remote_addr;
            proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
            proxy_set_header Cookie $http_cookie;
            proxy_pass  http://mall;

        }
     
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }      
    }
    include servers/*;
}

```

#### 控制台

- RabbitMQ  `124.222.*.*:15672`
- Kibina  `124.222.*.*:5601`
- Zipkin   `124.222.*.*:9411`
- Nacos   `124.222.*.*:8848`
- Seata   `124.222.*.*:8858` (未采用)