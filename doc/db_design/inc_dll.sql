/*
	企业网站通用版 数据库设计
	
	一、文件结构说明
		1. /*=== 表说明(表名)====*/
		2. /*
			表中所有字段
		  */
		3. 创建表SQL
	
	二、 命名规范说明
		名称统一采用下划线 进行多个单词区分
		 
	三、 文件操作记录
		modify			date			oper		sqlserver
		kzw				2012-06-09		create		2008
	四、基础数据
		插入新闻状态基础数据
*/


USE [master]
GO

IF EXISTS(SELECT 1 FROM sysdatabases WHERE NAME='inc_db')
BEGIN
    DROP DATABASE inc_db   --如果数据库存在先删掉数据库
END
GO

CREATE DATABASE inc_db
ON
PRIMARY  --创建主数据库文件
(
    NAME='inc_db',
    FILENAME='E:\workspace\inc_db.mdf',
    SIZE=5MB,
    MaxSize=50MB,
    FileGrowth=1MB
)
LOG ON --创建日志文件
(
    NAME='inc_db_log',
    FileName='E:\workspace\inc_db_log.ldf',
    Size=2MB,
    MaxSize=20MB,
    FileGrowth=1MB
)
GO
use[inc_db]
go

/*========新闻主表(news)=====*/
/*
newId(主键ID)
title(标题)
keys(关键字)
lastDate(最后修改时间)
logCount(浏览数)
converImg(封面图片)
state(新闻状态)
flag(有效标志)
content(新闻内容)
operMan(操作员)
src(来源)
converVideo(封面视频)
intro(简介)
typeId(类型ID)
*/
if exists (select * from sys.objects where name='news')
	drop table news
go

create table news
(
	new_id int primary key identity(1,1) not null,	
	title varchar(200),		-- 新闻标题
	keys varchar(200),		-- 关键字 多条用,进行区分
	last_date datetime default(getdate()),			-- 最后修改时间
	log_count int,			-- 浏览次数
	conver_img  varchar(300),-- 封面图片
	state int,		-- 新闻状态
	flag varchar(2) default(1),		-- 有效标志
	content text,			-- 新闻内容
	oper_man	varchar(30),-- 操作员
	src varchar(200),		-- 新闻来源
	conver_video varchar(200),--封面视频
	intro varchar(500),		-- 简介
	type_id int				-- 类型ID
)
go

/*=======	新闻图片集(new_imgs)  ========*/
/*
imgId(图片ID)
newId(新闻ID)
url(图片地址)
linkUrl(图片链接地址)
title(图片标题)
intro(图片说明)
memo(图片备注)
flag(有效标记)
lastDate(最后修改时间)*/
if exists (select * from sys.objects where name='new_imgs')
	drop table new_imgs
go
create table new_imgs
(
	img_id int primary key identity(1, 1) not null,	--图片ID
	new_id int,			-- 新闻ID
	url varchar(500),	-- 图片地址
	link_url varchar(500),-- 图片需要链接地址
	title varchar(500),	 -- 标题
	intro varchar(200),	 -- 说明
	memo varchar(500),	 -- 备注
	flag varchar(2) default(1),	 -- 有效标识
	last_date datetime default(getdate())		 --最后修改时间
)
go
/* ======= 新闻状态表(dm_new_state) ======*/
/*
stateId(状态ID)
explain(状态说明)
memo(描述)
flag(有效标志)
lastDate(最后修改时间)
*/
if exists (select * from sys.objects where name='dm_new_state')
	drop table dm_new_state
go
create table dm_new_state
(
	state_id int primary key identity(1,1) not null,	--状态ID
	explain varchar(300),	-- 状态说明
	memo varchar(300),		-- 描述
	flag varchar(2) default(1),		-- 有效标识
	last_date datetime default(getdate())			-- 最后修改时间
)
go

/* ====== 新闻类别表(dm_new_type) ======*/
/*
typeId(类型ID)
fid(父ID)
flag(有效标志)
title(类别名称)
memo(描述)
lastDate(最后修改时间)*/
if exists (select * from sys.objects where name='dm_new_type')
	drop table dm_new_type
go
create table dm_new_type
(
	type_id int primary key identity(1,1) not null,	--类型ID
	fid	int,				--父类型ID
	flag varchar(2) default(1),		-- 有效标识
	explain varchar(300),	-- 类别名称
	memo varchar(300),		-- 描述
	last_date datetime default(getdate())			-- 最后修改时间
)
go


/*====留言主表(comment)=====*/
/*
cId(留言ID)
themeType(内容类型)
themeId(内容ID)
fid(父ID)
date(留言时间)
content(留言内容)
userId(用户ID)
flag(有效标志)
*/
if exists (select * from sys.objects where name='comment')
	drop table comment
go
create table comment
(
	comment_id int primary key identity(1,1) not null,	--留言ID
	content_type	int,			-- 内容类型
	content_id      int,			-- 内容ID
	f_id			int,			-- 父ID
	comment_date	date,			-- 留言时间
	content			text,			-- 留言内容
	user_id			int,			-- 用户ID
	flag		varchar(2)			--有效标识
)
go


/*====留言类型表(dm_comment_type) =====*/
/*
tId(类型ID)
title(类型说明)
memo(类型描述)
flag(有效标志)
lastDate(最后修改时间)
tableName(类型对应的表名)
tablePKName(对应表的主键名称)
*/
if exists (select * from sys.objects where name='dm_comment_type')
	drop table dm_comment_type
go
create table dm_comment_type
(
	type_id	int primary key identity(1,1) not null,	--类型ID
	explain	varchar(200),		-- 类型说明
	memo varchar(300),			-- 描述
	flag varchar(2) default(1),			-- 有效标识
	last_date datetime default(getdate()),				-- 最后修改时间
	table_name	varchar(100),	-- 类型对应的表名
	table_pk_name varchar(100)	-- 【类型对应的表名】主键名称
)
go

/*====== 用户身份类型表(dm_user_type) =====*/
/*
typeId(身份ID)
explain(身份说明)
memo(身份描述)
flag(有效标志)
lastDate(最后修改时间)
*/
if exists (select * from sys.objects where name='dm_user_type')
	drop table dm_user_type
go
create table dm_user_type
(
	type_id int primary key identity(1,1) not null,	--身份ID
	explain  varchar(300),		--身份说明
	memo varchar(200),			-- 描述
	flag varchar(2) default(1),			-- 有效标识
	last_date datetime default(getdate())				-- 最后修改时间
)
go

/*====== 留言用户表(comment_user)=====*/
/*
userId(用户ID)
name(用户姓名)
mobile(手机号码)
email(邮箱)
regsrc(注册来源)
flag(有效标识)
regDate(注册时间)
last_date  最后修改时间
userType(用户身份)
*/
if exists (select * from sys.objects where name='comment_user')
	drop table comment_user
go
create table comment_user
(
	user_id int primary key identity(1,1) not null,		--用户ID
	name	varchar(100),		-- 用户姓名
	mobile  varchar(20),		-- 手机号码
	email   varchar(50),		-- 邮箱
	reg_src varchar(2),			-- 注册来源
	flag	varchar(2),			-- 有效标识
	reg_date date,				-- 注册时间
	last_date datetime default(getdate()),				-- 最后修改时间
	user_type	int				-- 用户身份
)
go

/*===== 商品表(product)====*/
/*
pid(商品ID)
name(商品名称)
intro(商品描述)
logCount(浏览次数)
price(商品价格)
marketPrice(市场价)
basePrice(原价)
des(排序级别)
lastDate(最后修改时间)
shelvesDate(上架时间)
operMan(操作人)
flag(有效标志)
state(商品状态)
unitID(单位类型ID)
typeID（商品类型）
productImgId(商品图片集ID)
converImg(封面图片)
*/
if exists (select * from sys.objects where name='product')
	drop table product
go
create table product
(
	pro_id	int primary key identity(1,1)	not null,	--商品ID
	name	varchar(100),			-- 商品名称
	memo	varchar(300),			-- 商品描述
	log_count int,					-- 浏览次数
	price float,					-- 商品价格
	market_price float,				-- 市场价
	base_price	float,				-- 原价
	desc_code	int,					    -- 排序级别 (级别越高值越大)
	last_date	date,				-- 最后修改时间
	shelves_date	date,			-- 上架时间
	oper_man	varchar(50),		-- 操作人
	flag		varchar(2),			-- 有效标识
	state		int,				-- 状态
	unit_id		int,				-- 单位类型ID
	type_id		int,				-- 商品类型ID
	product_imgs_id	int,			-- 商品图片集ID
	conver_img	varchar(300)		-- 封面图片 
)
go


/*	==== 商品类型表(dm_product_type)  ===== */
/*
typeId(类型ID)
fid（父ID）
explain(类型说明)
memo(类型描述)
flag(有效标志)
lastDate(最后修改时间)
*/
if exists (select * from sys.objects where name='dm_product_type')
	drop table dm_product_type
go
create table dm_product_type
(
	type_id int primary key identity(1,1) not null,		--类型ID
	fid		int,				-- 父类型ID
	explain   varchar(200),		-- 类型说明
	memo	varchar(200),		-- 描述
	flag	varchar(2),			-- 有效标识
	last_date datetime default(getdate())				-- 最后修改时间
)
go

/*==== 商品状态表(dm_product_state) ======*/
/*
stateId(状态ID)
explain(状态说明)
memo(描述)
flag(有效标志)
lastDate(最后修改时间)
*/
if exists (select * from sys.objects where name='dm_product_state')
	drop table dm_product_state
go
create table dm_product_state
(
	state_id	int primary key identity(1, 1) not null,	--状态ID
	explain		varchar(200),	-- 状态说明
	memo		varchar(200),	-- 描述
	flag		varchar(2),		-- 有效标识
	last_date	date			-- 最后修改时间
)
go

/*===== 商品单位表(dm_product_unit) ====*/
/*
uid(单位ID)
explain(单位说明)
memo(单位描述)
flag(有效标志)
lastDateI(最后修改时间)
*/
if exists (select * from sys.objects where name='dm_product_unit')
	drop table dm_product_unit
go
create table dm_product_unit
(
	unit_id	int primary key identity(1,1) not null,	--单位ID
	explain varchar(100),		-- 单位说明
	memo		varchar(200),	-- 描述
	flag		varchar(2),		-- 有效标识
	last_date	date			-- 最后修改时间
)
go

/*	==== 商品图片集(product_imgs) =====*/
/*
imgId(图片ID)
pId(商品ID)
url(图片地址)
linkUrl(图片链接地址)
title(图片标题)
desc(图片描述)
memo(图片备注)
flag(有效标记)
desc(排序方式)
lastDate(最后修改时间)
*/
if exists (select * from sys.objects where name='product_imgs')
	drop table product_imgs
go
create table product_imgs
(
	img_id	int primary key identity(1,1)	not null,	-- 图片ID
	pro_id	int,			--商品ID
	url	varchar(200),		-- 图片地址
	link_url varchar(200),	-- 图片链接地址
	title varchar(100),		-- 图片标题
	memo  varchar(200),		-- 备注
	flag varchar(2) default(1),		-- 有效标识
	desc_code int default(0),				-- 排序级别 (级别越高值越大)
	last_date datetime default(getdate())			-- 最后修改时间
)
go

/*	===在线客服表(link_job)====*/
/*
jobId(客服ID)
jobName(客服名称)
memo(描述)
des(排序字段)
flag(有效标志)
converurl(封面图片URL)
jobConfigId(在线客服配置ID)
lastDate(最后修改时间)
QQ
mobile
tel
email
*/
if exists (select * from sys.objects where name='link_job')
	drop table link_job
go
create table link_job
(
	job_id int primary key identity(1,1) not null,	--客服ID
	job_name varchar(100),		-- 客服名称
	memo varchar(100),			-- 描述
	desc_code int default(0),					-- 排序级别 (级别越高值越大) 
	flag varchar(2) default(1),			-- 有效标识
	conver_url varchar(200),	-- 封面图片
	job_config_id int,			-- 客服配置ID
	last_date datetime default(getdate()),				-- 最后修改时间
	QQ	varchar(30),			
	mobile varchar(50),			-- 手机号码
	tel		varchar(50),		-- 固定电话
	email	varchar(50)			-- 邮箱地址
)
go

/*	====客服配置表(dm_link_config)====*/
/*
cId(配置ID)
explain(说明)
memo（描述）
codeContent(脚本代码)
url(连接地址)
flag(有效标志)
*/
if exists (select * from sys.objects where name='dm_link_config')
	drop table dm_link_config
go
create table dm_link_config
(
	config_id int primary key identity(1,1) not null,	--配置ID
	explain varchar(200),		-- 说明
	memo varchar(200),			--描述
	code_conten text,			-- 脚本代码
	url	varchar(400),			-- 连接地址
	flag varchar(2) default(1)				-- 有效标识
)
go

/*-----------------以下为基础表数据构建----------------*/
--新闻状态表(dm_new_state)
insert into dm_new_state (explain,memo)	values('精华', '精华帖');
insert into dm_new_state (explain,memo)	values('热门', '热门帖');
insert into dm_new_state (explain,memo)	values('版主推荐', '推荐帖');





















