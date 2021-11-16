# xray Heroku

## 警告⚠：此技术仅限用于个人查看学术或科研娱乐使用！！！若用于其他违法目的，后果自负！！！

## 概述

用于在 Heroku 上部署 xray Websocket + tls

## 一键部署到Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https://github.com/HXHGTS/xray-heroku)

## ENV 设定

### UUID生成方法

Windows下用cmd执行:

`powershell [guid]::NewGuid() | find /v "Guid" | find /v "--" | find "-"`

Linux下用bash执行:

`uuidgen`

在线生成UUID(推荐):

<a href="http://tool.pfan.cn/guidgen/create?chkbrace=0&chkhyphen=1&chkupper=0&num=1" target="_blank">在线生成UUID</a>

### CDN嵌套方法

[CDN嵌套方法](https://hxhgts.github.io/xray-websocket-tls-nginx/cdn.html)

## 注意

部署时一定不要用默认的uuid，记得替换！！！

WebSocket 路径为 `/`

`alterId` 为 `0`

heroku每个月限制550h(约23d)的免费时长，时长使用完会导致服务器离线，下个月自动恢复


