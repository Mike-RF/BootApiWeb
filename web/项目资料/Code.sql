create table RoleInfo
(
	Id int not null auto_increment primary key,						-- 编号
	RoleName varchar(50) not null unique,									-- 对外编号
	CreateDate datetime not null,													-- 创建日期
	AdminNum int not null,																-- 管理员个数
	RoleDesc varchar(2000) not null,											-- 角色描述
	Status int not null																	-- 1:正常,0:停用
)auto_increment=100;

insert into RoleInfo(Id,RoleName,CreateDate,AdminNum,RoleDesc,Status)
values(1,'系统管理员',NOW(),1,'系统最高管理权限',1)

-- 管理员表
create table AdminInfo
(
	Id int not null auto_increment primary key,					-- 编号
	AdminName varchar(50) not null unique,							-- 登录名称
	AdminPwd varchar(50) not null,											-- 登录密码
	TrueName nvarchar(20) not null,											-- 真实名称
	CreateDate datetime not null,												-- 创建日期
	LastLoginDate datetime not null,										-- 最后登入日期
	CurrentLoginDate datetime not null,									-- 当前登陆日期
	RoleInfoId int not null,														-- 角色
	Status int not null,																-- 用户状态,1:正常,0:停用
	foreign key(RoleInfoId) references RoleInfo(Id)
)auto_increment=100;

insert into AdminInfo(id,AdminName,AdminPwd,TrueName,CreateDate,LastLoginDate,CurrentLoginDate,Status,RoleInfoId)
 values(1,'admin','e10adc3949ba59abbe56e057f20f883e','管理员',NOW(),NOW(),NOW(),1,1);

create table MenuInfo
(
	Id int not null  primary key,								-- 编号
	MenuName varchar(50) not null,								-- 菜单名称
	MenuUrl varchar(100) not null,								-- 地址
	ParentId int not null										-- 父节点ID
)

create table RoleMenuInfo
(
	Id int not null auto_increment primary key,					-- 编号
	RoleInfoId int not null references RoleInfo,				-- 角色编号
	MenuInfoId int not null references MenuInfo					-- 菜单编号
)


insert into MenuInfo values(1,'系统管理员','',0);
	insert into MenuInfo values(101,'角色管理','../RoleInfo/index.jsp',1);
	insert into MenuInfo values(102,'管理员列表','../AdminInfo/index.jsp',1);
insert into MenuInfo values(2,'业务办理','',0);
	insert into MenuInfo values(201,'账户开户','../AccountInfo/create.jsp',2);
	insert into MenuInfo values(202,'账户存钱','../AccountInfo/moneyIn.jsp',2);
	insert into MenuInfo values(203,'账户取钱','../AccountInfo/monthOut.jsp',2);
	insert into MenuInfo values(204,'账户转账','../AccountInfo/oneByOne.jsp',2);
	insert into MenuInfo values(205,'账户冻结','../AccountInfo/ice.jsp',2);
	insert into MenuInfo values(206,'账户解冻','../AccountInfo/unIce.jsp',2);
insert into MenuInfo values(3,'业务查看','',0);
	insert into MenuInfo values(301,'账户开户记录','../AccountInfo/index.jsp',3);
	insert into MenuInfo values(302,'账户存钱记录','../AccountInfo/moneyInIndex.jsp',3);
	insert into MenuInfo values(303,'账户取钱记录','../AccountInfo/monthOutIndex.jsp',3);
	insert into MenuInfo values(304,'账户转账记录','../AccountInfo/oneByOneIndex.jsp',3);
	insert into MenuInfo values(305,'账户冻结记录','../AccountInfo/iceIndex.jsp',3);
	insert into MenuInfo values(306,'账户解冻记录','../AccountInfo/unIceIndex.jsp',3);
insert into MenuInfo values(4,'统计报表','',0)
insert into MenuInfo values(5,'系统配置','',0)

insert into RoleMenuInfo(RoleInfoId,MenuInfoId) values(1,1);
insert into RoleMenuInfo(RoleInfoId,MenuInfoId) values(1,101);
insert into RoleMenuInfo(RoleInfoId,MenuInfoId) values(1,102);