# 简介

用flutter来写的秒杀应用。

这是 [秒杀应用后端](https://github.com/weiraneve/seckillcloud)
的mobile端，这里还有[web端](https://github.com/weiraneve/seckill-front)
，以及[后台配置web](https://github.com/weiraneve/seckillcloud)


## 界面和功能

- 登录页面

<img src="./docs/images/login.png" alt="用户登陆界面" width="20%" />

- 注册界面

<img src="./docs/images/register.png" alt="用户登陆界面" width="20%" />

- 商品列表界面

<img src="./docs/images/goods_list.png" alt="商品列表界面" width="20%" />


<img src="./docs/images/goods_list_no.png" alt="商品列表界面" width="20%" />

- 商品详情界面

<img src="./docs/images/order.png" alt="商品详情界面" width="20%" />

- 修改密码界面

<img src="./docs/images/update_password.png" alt="修改密码界面" width="20%" />

## 技术栈
包括但不仅限于:
- 项目很多功能基于[GetX](https://pub.dev/packages/get)，如依赖注入、路由管理、状态管理(controller)等功能。
- 网络部分使用的是，[Dio](https://pub.dev/packages/dio) + [retrofit](https://pub.dev/packages/retrofit) +
  [json_serializable](https://pub.dev/packages/json_serializable)的组合。
- 环境变量[flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- MVVM[provider](https://pub.dev/packages/provider)
- local storage存储token[flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)