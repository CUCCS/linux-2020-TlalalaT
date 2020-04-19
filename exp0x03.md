---
title: "Linux系统与网络管理"
author: zlz
---

# 第三次实验

---

## 一、 跟随教程学习Systemd

### 1. Systemd 入门教程：命令篇

* (1) 由来
* (2) Systemd 概述
* [(3) 系统管理](https://asciinema.org/a/320662)
* [(4) Unit](https://asciinema.org/a/320669)
* [(5) Unit 的配置文件](https://asciinema.org/a/320673)
* [(6) Target](https://asciinema.org/a/320676)
* [(7) 日志管理](https://asciinema.org/a/320678)

### 2. Systemd 入门教程：实战篇

*  [(1) 开机启动](https://asciinema.org/a/321329)
*  [(2) 启动服务](https://asciinema.org/a/321331)
*  [(3) 停止服务](https://asciinema.org/a/321336)
*  [(4) 读懂配置文件](https://asciinema.org/a/321340)
*  (5) [Unit] 区块：启动顺序与依赖关系。
*  (6) [Service] 区块：启动行为
*  [(7) [Install] 区块](https://asciinema.org/a/321373)
*  [(8) Target 的配置文件](https://asciinema.org/a/321378)
*  [(9) 修改配置文件后重启](https://asciinema.org/a/321383)

---

## 二、 本章完成后的自查清单

* 如何添加一个用户并使其具备sudo执行程序的权限？

  
* 如何将一个用户添加到一个用户组？



* 如何查看当前系统的分区表和文件系统详细信息？
* 如何实现开机自动挂载Virtualbox的共享目录分区？
* 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
* 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
* 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现***杀不死***？