---
title: 第一次试验
author: 周玲震
output: revealjs::revealjs_presentation
---

# 第一章实验

---

## 1.无人值守安装Ubuntu18.04镜像

* ### 有人值守成功安装Ubuntu18.04虚拟机

![](images/exp0x01/有人值守安装Ubuntu.jpg)

* ### 挂载镜像

![](images/exp0x01/挂载镜像成功.png)

* ### 同步光盘内容到工作目录

![](images/exp0x01/同步光盘内容到工作目录.png)

* ### 编辑安装引导界面

打开配置文件

![](images/exp0x01/进入工作目录编辑安装引导界面.png)

修改配置文件

![](images/exp0x01/配置文件修改后.png)

* ### 重新生成md5sum.txt

![](images/exp0x01/权限不够更改权限并重新生成md5.png)

* ### 封装镜像
  * 系统中无genisoimage，安装程序
![](images/exp0x01/安装genisoimage.png)

![](images/exp0x01/重新封装完成.png)

* ### 将镜像拉至宿主机

![](images/exp0x01/将镜像拉到宿主机.png)

* ### 实验无人值守安装镜像的有效性
  * ### 实验几次均内核报错，但重新封装之前的镜像却能正常启动
![](images/exp0x01/内核报错.png)

![]()

---

## 2.给虚拟机添加网卡并实现系统自动开机使用和自动获取IP

* ### 给虚拟机添加新网卡

![](images/exp0x01/添加新网卡.png)

* ### 对系统网络设置进行更改
网卡设置前

![](images/exp0x01/网卡设置前.png)

打开网络配置文件
  
![](images/exp0x01/打开网络配置文件.png)

文件更改前

![](images/exp0x01/网络配置文件更改前.png)

文件更改后

![](images/exp0x01/网络配置文件更改后.png)

应用设置

![](images/exp0x01/应用网络设置.png)

添加完成

![](images/exp0x01/网卡添加完成.png)

---

## 3.使用sftp在虚拟机和宿主机之间传输文件

* ### 连接至虚拟机并向虚拟机传输文件

![](images/exp0x01/连接至虚拟机并传输文件.png)

* [连接方法参考csdn博客](https://blog.csdn.net/gzxdale/article/details/81140889)