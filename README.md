# NamakoBot

A qqbot for Princess Connect Re:Dive (and other usage :)

**个人使用的杂交版本HoshinoBot+Yobot，仅支持Docker下启动**
**新版本为了方便同步上游commit并整理原commit记录,因此重新fork了上游项目**
**若想查看旧版本信息，请访问[NamakoBot_Legacy](https://github.com/NamakoNeko/NamakoBot_Legacy)**
**附带一些本人编写的插件，请在modules目录下查看，在此不为模块单独设置git仓库**

## 简介

**NamakoBot:** 基于 [nonebot](http://nonebot.cqp.moe) 框架，开源、无公害、非转基因的QQ机器人。
基于上游版本[HoshinoBot](https://github.com/Ice-Cirno/HoshinoBot)、[Yobot](https://github.com/pcrbot/yobot)进行了一些修改。
仅能在Docker容器下运行，部署需要搭配脚本[部署脚本](https://github.com/NamakoNeko/NamakoBotDeploy)进行使用，相关文档正在完善中。


## 功能介绍

HoshinoBot 的功能开发以服务 [公主连结☆Re:Dive](http://priconne-redive.jp) 玩家为核心。

由于bot的功能会快速迭代开发，使用方式以及功能这里不进行具体的说明，请向bot发送"help"或移步[此文件](hoshino/modules/botmanage/help.py)查看详细。会战管理功能因 HoshinoBot V2 的 Clanbattle V3 仍为完善，我们在此采用 Yobot 的会战功能并对 Clanbattle V3 进行了屏蔽处理，请不要启用 Clanbattle 模块。



> 如果您有新的想法，欢迎联系我！即便您不会编程，您也可以在内容更新上帮到我们！

## 注意事项
NamakoBot 对原 HoshinoBot 的某些底层模块以及程序本身进行了修改以达到本人定制需求，可能会对您按照 HoshinoBot 标准开发的插件产生不能正常使用的问题，但这不代表 NamakoBot 本身不兼容 HoshinoBot V2 插件，您可能需要参考源代码对现有的插件本身进行一些修改。

-------------

### 功能模块控制

HoshinoBot 的功能繁多，各群可根据自己的需要进行开关控制，群管理发送 `lssv` 即可查看功能模块的启用状态，使用以下命令进行控制：

```
启用 service-name
禁用 service-name
```



### 更进一步

现在，机器人已经可以使用`会战管理`、`模拟抽卡(纯文字版)`等基本功能了。但还无法使用`竞技场查询`、`番剧订阅`、`推特转发`等功能。这是因为，这些功能需要对应的静态图片资源以及相应的api key。相应资源获取有难有易，您可以根据自己的需要去获取。

下面将会分别介绍资源与api key的获取方法：



#### 静态图片资源

> 发送图片的条件：  
> 1. 静态图片资源

您可能希望看到更为精致的图片版结果，若希望机器人能够发送图片，首先需要您购买酷Q Pro版，其次需要准备静态图片资源，其中包括：

- 公主连接角色头像（来自 [干炸里脊资源站](https://redive.estertion.win/) 的拆包）
- 公主连接官方四格漫画
- 公主连接每月rank推荐表
- 表情包杂图
- setu库
- [是谁呼叫舰队](http://fleet.diablohu.com/)舰娘&装备页面截图
- 艦これ人事表

等资源。自行收集可能较为困难，所以我们准备了一个较为精简的资源包以及下载脚本，可以满足公主连接相关功能的日常使用。如果需要，请加入QQ群 **Hoshino的后花园** 367501912，下载群文件中的`res.zip`。



#### pcrdfans授权key

竞技场查询功能的数据来自 [公主连结Re: Dive Fan Club - 硬核的竞技场数据分析站](https://pcrdfans.com/) ，查询需要授权key。您可以向pcrdfans的作者索要。（注：由于最近机器人搭建者较多，pcrdfans的作者最近常被打扰，我们**不建议**您因本项目而去联系他，推荐您前往网站[pcrdfans.com](https://pcrdfans.com)进行查询）

若您已有授权key，在文件`hoshino/config/priconne.py`中填写您的key：

```python
class arena:
    AUTH_KEY = "your_key"
```



#### 蜜柑番剧 RSS Token

> 请先在`hoshino/config/__bot__.py`的`MODULES_ON`中取消`mikan`的注释  
> 本功能默认关闭，在群内发送 "启用 bangumi" 即可开启

番剧订阅数据来自[蜜柑计划 - Mikan Project](https://mikanani.me/)，您可以注册一个账号，添加订阅的番剧，之后点击Mikan首页的RSS订阅，复制类似于下面的url地址：

```
https://mikanani.me/RSS/MyBangumi?token=abcdfegABCFEFG%2b123%3d%3d
```

保留其中的`token`参数，在文件`hoshino/config/mikan.py`中填写您的token：

```python
MIKAN_TOKEN = "abcdfegABCFEFG+123=="
```

注意：`token`中可能含有url转义，您需要将`%2b`替换为`+`，将`%2f`替换为`/`，将`%3d`替换为`=`。



#### 推特转发

推特转发功能需要推特开发者账号，具体申请方法请自行[Google](http://google.com)。注：现在推特官方大概率拒绝来自中国大陆的新申请，自备海外手机号及大学邮箱可能会帮到您。

若您已有推特开发者账号，在文件`hoshino/config/twitter.py`中填写您的key：

```python
consumer_key = "your_consumer_key",
consumer_secret = "your_consumer_secret",
access_token_key = "your_access_token_key",
access_token_secret = "your_access_token_secret"
```


## 友情链接

**干炸里脊资源站**: https://redive.estertion.win/

**公主连结Re: Dive Fan Club - 硬核的竞技场数据分析站**: https://pcrdfans.com/

**yobot**: https://yobot.win/

