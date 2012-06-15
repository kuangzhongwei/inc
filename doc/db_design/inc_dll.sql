/*
	��ҵ��վͨ�ð� ���ݿ����
	
	һ���ļ��ṹ˵��
		1. /*=== ��˵��(����)====*/
		2. /*
			���������ֶ�
		  */
		3. ������SQL
	
	���� �����淶˵��
		����ͳһ�����»��� ���ж����������
		 
	���� �ļ�������¼
		modify			date			oper		sqlserver
		kzw				2012-06-09		create		2008
	�ġ���������
		��������״̬��������
*/


USE [master]
GO

IF EXISTS(SELECT 1 FROM sysdatabases WHERE NAME='inc_db')
BEGIN
    DROP DATABASE inc_db   --������ݿ������ɾ�����ݿ�
END
GO

CREATE DATABASE inc_db
ON
PRIMARY  --���������ݿ��ļ�
(
    NAME='inc_db',
    FILENAME='E:\workspace\inc_db.mdf',
    SIZE=5MB,
    MaxSize=50MB,
    FileGrowth=1MB
)
LOG ON --������־�ļ�
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

/*========��������(news)=====*/
/*
newId(����ID)
title(����)
keys(�ؼ���)
lastDate(����޸�ʱ��)
logCount(�����)
converImg(����ͼƬ)
state(����״̬)
flag(��Ч��־)
content(��������)
operMan(����Ա)
src(��Դ)
converVideo(������Ƶ)
intro(���)
typeId(����ID)
*/
if exists (select * from sys.objects where name='news')
	drop table news
go

create table news
(
	new_id int primary key identity(1,1) not null,	
	title varchar(200),		-- ���ű���
	keys varchar(200),		-- �ؼ��� ������,��������
	last_date datetime default(getdate()),			-- ����޸�ʱ��
	log_count int,			-- �������
	conver_img  varchar(300),-- ����ͼƬ
	state int,		-- ����״̬
	flag varchar(2) default(1),		-- ��Ч��־
	content text,			-- ��������
	oper_man	varchar(30),-- ����Ա
	src varchar(200),		-- ������Դ
	conver_video varchar(200),--������Ƶ
	intro varchar(500),		-- ���
	type_id int				-- ����ID
)
go

/*=======	����ͼƬ��(new_imgs)  ========*/
/*
imgId(ͼƬID)
newId(����ID)
url(ͼƬ��ַ)
linkUrl(ͼƬ���ӵ�ַ)
title(ͼƬ����)
intro(ͼƬ˵��)
memo(ͼƬ��ע)
flag(��Ч���)
lastDate(����޸�ʱ��)*/
if exists (select * from sys.objects where name='new_imgs')
	drop table new_imgs
go
create table new_imgs
(
	img_id int primary key identity(1, 1) not null,	--ͼƬID
	new_id int,			-- ����ID
	url varchar(500),	-- ͼƬ��ַ
	link_url varchar(500),-- ͼƬ��Ҫ���ӵ�ַ
	title varchar(500),	 -- ����
	intro varchar(200),	 -- ˵��
	memo varchar(500),	 -- ��ע
	flag varchar(2) default(1),	 -- ��Ч��ʶ
	last_date datetime default(getdate())		 --����޸�ʱ��
)
go
/* ======= ����״̬��(dm_new_state) ======*/
/*
stateId(״̬ID)
explain(״̬˵��)
memo(����)
flag(��Ч��־)
lastDate(����޸�ʱ��)
*/
if exists (select * from sys.objects where name='dm_new_state')
	drop table dm_new_state
go
create table dm_new_state
(
	state_id int primary key identity(1,1) not null,	--״̬ID
	explain varchar(300),	-- ״̬˵��
	memo varchar(300),		-- ����
	flag varchar(2) default(1),		-- ��Ч��ʶ
	last_date datetime default(getdate())			-- ����޸�ʱ��
)
go

/* ====== ��������(dm_new_type) ======*/
/*
typeId(����ID)
fid(��ID)
flag(��Ч��־)
title(�������)
memo(����)
lastDate(����޸�ʱ��)*/
if exists (select * from sys.objects where name='dm_new_type')
	drop table dm_new_type
go
create table dm_new_type
(
	type_id int primary key identity(1,1) not null,	--����ID
	fid	int,				--������ID
	flag varchar(2) default(1),		-- ��Ч��ʶ
	explain varchar(300),	-- �������
	memo varchar(300),		-- ����
	last_date datetime default(getdate())			-- ����޸�ʱ��
)
go


/*====��������(comment)=====*/
/*
cId(����ID)
themeType(��������)
themeId(����ID)
fid(��ID)
date(����ʱ��)
content(��������)
userId(�û�ID)
flag(��Ч��־)
*/
if exists (select * from sys.objects where name='comment')
	drop table comment
go
create table comment
(
	comment_id int primary key identity(1,1) not null,	--����ID
	content_type	int,			-- ��������
	content_id      int,			-- ����ID
	f_id			int,			-- ��ID
	comment_date	date,			-- ����ʱ��
	content			text,			-- ��������
	user_id			int,			-- �û�ID
	flag		varchar(2)			--��Ч��ʶ
)
go


/*====�������ͱ�(dm_comment_type) =====*/
/*
tId(����ID)
title(����˵��)
memo(��������)
flag(��Ч��־)
lastDate(����޸�ʱ��)
tableName(���Ͷ�Ӧ�ı���)
tablePKName(��Ӧ�����������)
*/
if exists (select * from sys.objects where name='dm_comment_type')
	drop table dm_comment_type
go
create table dm_comment_type
(
	type_id	int primary key identity(1,1) not null,	--����ID
	explain	varchar(200),		-- ����˵��
	memo varchar(300),			-- ����
	flag varchar(2) default(1),			-- ��Ч��ʶ
	last_date datetime default(getdate()),				-- ����޸�ʱ��
	table_name	varchar(100),	-- ���Ͷ�Ӧ�ı���
	table_pk_name varchar(100)	-- �����Ͷ�Ӧ�ı�������������
)
go

/*====== �û�������ͱ�(dm_user_type) =====*/
/*
typeId(���ID)
explain(���˵��)
memo(�������)
flag(��Ч��־)
lastDate(����޸�ʱ��)
*/
if exists (select * from sys.objects where name='dm_user_type')
	drop table dm_user_type
go
create table dm_user_type
(
	type_id int primary key identity(1,1) not null,	--���ID
	explain  varchar(300),		--���˵��
	memo varchar(200),			-- ����
	flag varchar(2) default(1),			-- ��Ч��ʶ
	last_date datetime default(getdate())				-- ����޸�ʱ��
)
go

/*====== �����û���(comment_user)=====*/
/*
userId(�û�ID)
name(�û�����)
mobile(�ֻ�����)
email(����)
regsrc(ע����Դ)
flag(��Ч��ʶ)
regDate(ע��ʱ��)
last_date  ����޸�ʱ��
userType(�û����)
*/
if exists (select * from sys.objects where name='comment_user')
	drop table comment_user
go
create table comment_user
(
	user_id int primary key identity(1,1) not null,		--�û�ID
	name	varchar(100),		-- �û�����
	mobile  varchar(20),		-- �ֻ�����
	email   varchar(50),		-- ����
	reg_src varchar(2),			-- ע����Դ
	flag	varchar(2),			-- ��Ч��ʶ
	reg_date date,				-- ע��ʱ��
	last_date datetime default(getdate()),				-- ����޸�ʱ��
	user_type	int				-- �û����
)
go

/*===== ��Ʒ��(product)====*/
/*
pid(��ƷID)
name(��Ʒ����)
intro(��Ʒ����)
logCount(�������)
price(��Ʒ�۸�)
marketPrice(�г���)
basePrice(ԭ��)
des(���򼶱�)
lastDate(����޸�ʱ��)
shelvesDate(�ϼ�ʱ��)
operMan(������)
flag(��Ч��־)
state(��Ʒ״̬)
unitID(��λ����ID)
typeID����Ʒ���ͣ�
productImgId(��ƷͼƬ��ID)
converImg(����ͼƬ)
*/
if exists (select * from sys.objects where name='product')
	drop table product
go
create table product
(
	pro_id	int primary key identity(1,1)	not null,	--��ƷID
	name	varchar(100),			-- ��Ʒ����
	memo	varchar(300),			-- ��Ʒ����
	log_count int,					-- �������
	price float,					-- ��Ʒ�۸�
	market_price float,				-- �г���
	base_price	float,				-- ԭ��
	desc_code	int,					    -- ���򼶱� (����Խ��ֵԽ��)
	last_date	date,				-- ����޸�ʱ��
	shelves_date	date,			-- �ϼ�ʱ��
	oper_man	varchar(50),		-- ������
	flag		varchar(2),			-- ��Ч��ʶ
	state		int,				-- ״̬
	unit_id		int,				-- ��λ����ID
	type_id		int,				-- ��Ʒ����ID
	product_imgs_id	int,			-- ��ƷͼƬ��ID
	conver_img	varchar(300)		-- ����ͼƬ 
)
go


/*	==== ��Ʒ���ͱ�(dm_product_type)  ===== */
/*
typeId(����ID)
fid����ID��
explain(����˵��)
memo(��������)
flag(��Ч��־)
lastDate(����޸�ʱ��)
*/
if exists (select * from sys.objects where name='dm_product_type')
	drop table dm_product_type
go
create table dm_product_type
(
	type_id int primary key identity(1,1) not null,		--����ID
	fid		int,				-- ������ID
	explain   varchar(200),		-- ����˵��
	memo	varchar(200),		-- ����
	flag	varchar(2),			-- ��Ч��ʶ
	last_date datetime default(getdate())				-- ����޸�ʱ��
)
go

/*==== ��Ʒ״̬��(dm_product_state) ======*/
/*
stateId(״̬ID)
explain(״̬˵��)
memo(����)
flag(��Ч��־)
lastDate(����޸�ʱ��)
*/
if exists (select * from sys.objects where name='dm_product_state')
	drop table dm_product_state
go
create table dm_product_state
(
	state_id	int primary key identity(1, 1) not null,	--״̬ID
	explain		varchar(200),	-- ״̬˵��
	memo		varchar(200),	-- ����
	flag		varchar(2),		-- ��Ч��ʶ
	last_date	date			-- ����޸�ʱ��
)
go

/*===== ��Ʒ��λ��(dm_product_unit) ====*/
/*
uid(��λID)
explain(��λ˵��)
memo(��λ����)
flag(��Ч��־)
lastDateI(����޸�ʱ��)
*/
if exists (select * from sys.objects where name='dm_product_unit')
	drop table dm_product_unit
go
create table dm_product_unit
(
	unit_id	int primary key identity(1,1) not null,	--��λID
	explain varchar(100),		-- ��λ˵��
	memo		varchar(200),	-- ����
	flag		varchar(2),		-- ��Ч��ʶ
	last_date	date			-- ����޸�ʱ��
)
go

/*	==== ��ƷͼƬ��(product_imgs) =====*/
/*
imgId(ͼƬID)
pId(��ƷID)
url(ͼƬ��ַ)
linkUrl(ͼƬ���ӵ�ַ)
title(ͼƬ����)
desc(ͼƬ����)
memo(ͼƬ��ע)
flag(��Ч���)
desc(����ʽ)
lastDate(����޸�ʱ��)
*/
if exists (select * from sys.objects where name='product_imgs')
	drop table product_imgs
go
create table product_imgs
(
	img_id	int primary key identity(1,1)	not null,	-- ͼƬID
	pro_id	int,			--��ƷID
	url	varchar(200),		-- ͼƬ��ַ
	link_url varchar(200),	-- ͼƬ���ӵ�ַ
	title varchar(100),		-- ͼƬ����
	memo  varchar(200),		-- ��ע
	flag varchar(2) default(1),		-- ��Ч��ʶ
	desc_code int default(0),				-- ���򼶱� (����Խ��ֵԽ��)
	last_date datetime default(getdate())			-- ����޸�ʱ��
)
go

/*	===���߿ͷ���(link_job)====*/
/*
jobId(�ͷ�ID)
jobName(�ͷ�����)
memo(����)
des(�����ֶ�)
flag(��Ч��־)
converurl(����ͼƬURL)
jobConfigId(���߿ͷ�����ID)
lastDate(����޸�ʱ��)
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
	job_id int primary key identity(1,1) not null,	--�ͷ�ID
	job_name varchar(100),		-- �ͷ�����
	memo varchar(100),			-- ����
	desc_code int default(0),					-- ���򼶱� (����Խ��ֵԽ��) 
	flag varchar(2) default(1),			-- ��Ч��ʶ
	conver_url varchar(200),	-- ����ͼƬ
	job_config_id int,			-- �ͷ�����ID
	last_date datetime default(getdate()),				-- ����޸�ʱ��
	QQ	varchar(30),			
	mobile varchar(50),			-- �ֻ�����
	tel		varchar(50),		-- �̶��绰
	email	varchar(50)			-- �����ַ
)
go

/*	====�ͷ����ñ�(dm_link_config)====*/
/*
cId(����ID)
explain(˵��)
memo��������
codeContent(�ű�����)
url(���ӵ�ַ)
flag(��Ч��־)
*/
if exists (select * from sys.objects where name='dm_link_config')
	drop table dm_link_config
go
create table dm_link_config
(
	config_id int primary key identity(1,1) not null,	--����ID
	explain varchar(200),		-- ˵��
	memo varchar(200),			--����
	code_conten text,			-- �ű�����
	url	varchar(400),			-- ���ӵ�ַ
	flag varchar(2) default(1)				-- ��Ч��ʶ
)
go

/*-----------------����Ϊ���������ݹ���----------------*/
--����״̬��(dm_new_state)
insert into dm_new_state (explain,memo)	values('����', '������');
insert into dm_new_state (explain,memo)	values('����', '������');
insert into dm_new_state (explain,memo)	values('�����Ƽ�', '�Ƽ���');





















