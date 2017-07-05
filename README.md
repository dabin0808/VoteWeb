# VoteWeb
a system that can sign up、sign in and vote online

---
tags:
- Servlet
- JSP
- JavaBean
- JDBC
- JavaScript
---
使用Servlet、JSP、JavaBean、JDBC和CSS/JavaScript等技术开发一个小型投票网站

## 第一部分网站功能设计

1.前台功能要求

1.1注册功能

用户通过注册功能实现注册，系统将注册的信息保存到数据库中。

1.2登录功能

用户通过注册功能实现注册，系统将检查用户输入的登录信息是否在数据库中的用户信息库中，若不存在，提示需要注册，否则登录成功。

1.3显示投票主题功能

在首页通过查询数据库显示所有的投票主题，截至时间。

1.4投票的功能

用户点击进入投票的链接，跳转到投票页面，显示投票的主题，截至时间，所有投票选项

1.5查询投票的功能

用户点击查询投票的链接，跳转到查询投票页面，显示投票的主题，截至时间，所有投票选项及票数。

1.6搜索投票的功能

用户输入搜索关键之后点击搜索按钮，跳转到搜索投票页面，显示相关投票的主题。

2.后台功能要求

2.1发起投票功能

用户点击发起投票的链接，跳转到发起投票页面，用户输入投票的主题，单选或多选，截至时间，所有投票选项。系统将发起投票的信息保存到数据库中。

2.2查看投票，每个登录用户可以查看自己发起的所有投票信息。

在用户页面通过查询数据库显示所有的投票主题。

2.3禁止投票

将数据库中该投票的是否禁止投票设置为false

2.4取消禁止投票

将数据库中该投票的是否禁止投票设置为true

3.投票结果的图形化显示

通过javascript，以饼图显示每个选项的得票分比；以柱形图表示每个选项的得票数等。

## 第二部分网站页面设计

首页：包含可以跳转到注册页面、登录页面、投票页面、查看投票页面的链接，以及搜索框

注册页面：包含返回首页的链接及账号、用户名、密码输入框

登录页面：包含返回首页的链接及账号、密码输入框

搜索页面：包含返回首页的链接及搜索结果

投票页面：包含投票主题、截止时间、投票选项

查看投票结果页面：包含返回首页的链接、投票主题、截止时间、投票选项以及饼图

用户页面：包含注销登陆、发起投票、进入投票的链接

发起投票页面：包含投票主题、投票选项、截至时间的输入框及单选投票、多选投票单选框

## 第三部分数据库设计

User表：user_id varchar2(20) primary key

user_name varchar2(20) not null

user_password varchar2(20) not null

Vote表：vote_name varchar(20) primary key

vote_e1 varchar(20) not null

vote_n1 int default 0

vote_e2 varcher(20)

vote_n2 int default 0

vote_e3 varcher(20)

vote_n3 int default 0

vote_select varchar(20) default 'single'

vote_deadline Datetime not null

vote_cancel varchar(20) default 'true'

UserVote表：uv_id int auto_increment primary key

vote_name varchar(20) not null

user_id varchar(20) not null)

其中UserVote表中的vote_name来自Vote表的vote_name、user_idUser表的user_id

## 第四部分网站项目结构

整个网站分为首页，注册页面，登录页面，搜索页面，发起投票页面，投票页面，查看投票页面，用户页面。


详情请访问(http://smbera.github.io/)
