﻿-- 创建数据库
CREATE DATABASE IF NOT EXISTS mydb CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE mydb;
-- 创建数据表
CREATE TABLE IF NOT EXISTS cost(
  	cost_id INT(4) PRIMARY KEY AUTO_INCREMENT,
  	name VARCHAR(50) NOT NULL,
  	base_duration INT(11),-- 基本时长
  	base_cost DOUBLE(7,2),-- 基本费用
  	unit_cost DOUBLE(7,4),-- 单位费用
  	status CHAR(1),-- 状态：0-开通；1-暂停；
  	descr VARCHAR(100),-- //介绍、描述
  	creatime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,-- 创建时间
  	startime TIMESTAMP NULL,-- 开通时间
	cost_type CHAR(1)-- 资费类型：1-包月；2-套餐；3-计时
  )DEFAULT CHARSET=utf8;
-- 插入数据

INSERT INTO COST VALUES (NULL,'5.9元套餐',20,5.9,0.4,0,'5.9元20小时/月,超出部分0.4元/时',DEFAULT,DEFAULT,'2');
INSERT INTO COST VALUES (NULL,'6.9元套餐',40,6.9,0.3,0,'6.9元40小时/月,超出部分0.3元/时',DEFAULT,DEFAULT,'2');
INSERT INTO COST VALUES (NULL,'8.5元套餐',100,8.5,0.2,0,'8.5元100小时/月,超出部分0.2元/时',DEFAULT,DEFAULT,'2');
INSERT INTO COST VALUES (NULL,'10.5元套餐',200,10.5,0.1,0,'10.5元200小时/月,超出部分0.1元/时',DEFAULT,DEFAULT,'2');
INSERT INTO COST VALUES (NULL,'计时收费',NULL,NULL,0.5,0,'0.5元/时,不使用不收费',DEFAULT,DEFAULT,'3');
INSERT INTO COST VALUES (NULL,'包月',NULL,20,NULL,0,'每月20元,不限制使用时间',DEFAULT,DEFAULT,'1');
INSERT INTO COST VALUES (NULL,'计时收费',NULL,20,NULL,1,'每月30元,不限制使用时间',DEFAULT,DEFAULT,'1');






-- 帐务信息表
CREATE TABLE IF NOT EXISTS account(
 	account_id INT(9)  PRIMARY KEY AUTO_INCREMENT,
 	recommender_id INT(9),
 	login_name VARCHAR(30) NOT NULL,
 	login_passwd VARCHAR(30) NOT NULL,
 	status CHAR(1),
 	create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	pause_date TIMESTAMP NULL,
 	close_date TIMESTAMP NULL,
 	real_name VARCHAR(20)NOT NULL,
 	idcard_no CHAR(18)NOT NULL,
 	birthdate DATE,
 	gender CHAR(1),
 	occupation VARCHAR(50),
 	telephone VARCHAR(15) NOT NULL,
 	email VARCHAR(50),
 	mailaddress VARCHAR(200),
 	zipcode CHAR(6),
 	qq VARCHAR(15),
 	last_login_time TIMESTAMP  NULL,
 	last_login_ip VARCHAR(15)
)DEFAULT CHARSET=utf8;


INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
     REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1000,NULL,'taiji001','256528','1',DEFAULT,'张三丰','19430225','410381194302256528','13669351234');

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,NULL,'xl18z60','190613',1,DEFAULT,'郭靖','19690319','330682196903190613',13338924567);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,1001,'dgbf70','270429',1,DEFAULT,'黄蓉','19710827','330902197108270429',13637811357);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,1005,'mjjzh64','041115',1,DEFAULT,'张无忌','19890604','610121198906041115',13572952468);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,1011,'jmdxj00','010322',1,DEFAULT,'杨过','19960101','350581200201010322',18617832562);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,1011,'ljxj90','310346',1,DEFAULT,'殷离','19930731','320211199307310346',13186454984);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,NULL,'kxhxd20','012115',1,DEFAULT,'韦小宝','20001001','321022200010012115',13953410078);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,NULL,'kxhxd21','012116',1,DEFAULT,'魏无羡','20001002','321022200010012116',13953410079);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,NULL,'kxhxd22','012117',1,DEFAULT,'蓝忘机','20001003','321022200010012117',13953410080);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,NULL,'kxhxd23','012118',1,DEFAULT,'江城','20001004','321022200010012118',13953410081);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,NULL,'kxhxd24','012119',1,DEFAULT,'史蒂夫','20001005','321022200010012119',13953410082);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(NULL,NULL,'kxhxd25','012120',1,DEFAULT,'奥丁','20001006','321022200010012120',13953410083);




-- 业务信息表
CREATE TABLE IF NOT EXISTS service(
 	service_id INT(10)  PRIMARY KEY AUTO_INCREMENT,
 	account_id INT(9) NOT NULL,
 	unix_host VARCHAR(15) NOT NULL ,
 	os_username VARCHAR(8)	NOT NULL,
 	login_passwd VARCHAR(30) NOT NULL,
 	status CHAR(1),	
 	create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	pause_date TIMESTAMP NULL,
 	close_date TIMESTAMP NULL,
 	cost_id INT(4) NOT NULL
)DEFAULT CHARSET=utf8;



INSERT INTO SERVICE VALUES (NULL,1010,'192.168.0.26','guojing','guo1234','0',DEFAULT,DEFAULT,DEFAULT,1);

INSERT INTO SERVICE VALUES (NULL,1004,'192.168.0.26','huangr','huang234','0',DEFAULT,DEFAULT,DEFAULT,1);

INSERT INTO SERVICE VALUES (NULL,1011,'192.168.0.20','huangr','huang234','0',DEFAULT,DEFAULT,DEFAULT,3);

INSERT INTO SERVICE VALUES (NULL,1011,'192.168.0.23','huangr','huang234','0',DEFAULT,DEFAULT,DEFAULT,6);

INSERT INTO SERVICE VALUES (NULL,1001,'192.168.0.26','luwsh','luwu2345','0',DEFAULT,DEFAULT,DEFAULT,4);

INSERT INTO SERVICE VALUES (NULL,1005,'192.168.0.20','luwsh','luwu2345','0',DEFAULT,DEFAULT,DEFAULT,5);

INSERT INTO SERVICE VALUES (NULL,1003,'192.168.0.20','weixb','wei12345','0',DEFAULT,DEFAULT,DEFAULT,6);

INSERT INTO SERVICE VALUES (NULL,1010,'192.168.0.20','guojing','guo09876','0',DEFAULT,DEFAULT,DEFAULT,6);
COMMIT;



-- 业务资费更新备份表
CREATE TABLE IF NOT EXISTS SERVICE_UPDATE_BAK(
 ID INT(10) PRIMARY KEY AUTO_INCREMENT,
 SERVICE_ID INT(9) NOT NULL,
 COST_ID INT(4)  NOT NULL
)DEFAULT CHARSET=utf8;



-- 模块表
CREATE TABLE IF NOT EXISTS module_info(
module_id INT(4)  PRIMARY KEY AUTO_INCREMENT,
module_name VARCHAR(50) NOT NULL
)DEFAULT CHARSET=utf8;

-- 模块表
INSERT INTO MODULE_INFO VALUES(NULL,'角色管理');
INSERT INTO MODULE_INFO VALUES(NULL,'管理员管理');
INSERT INTO MODULE_INFO VALUES(NULL,'资费管理');
INSERT INTO MODULE_INFO VALUES(NULL,'账务账号');
INSERT INTO MODULE_INFO VALUES(NULL,'业务账号');
INSERT INTO MODULE_INFO VALUES(NULL,'账单管理');
INSERT INTO MODULE_INFO VALUES(NULL,'报表');
COMMIT;



-- 角色表
CREATE TABLE IF NOT EXISTS role_info(
 role_id INT(4) PRIMARY KEY AUTO_INCREMENT,
 role_name VARCHAR(50) NOT NULL
)DEFAULT CHARSET=utf8;

-- 角色表
INSERT INTO role_info VALUES(100,'管理员');
INSERT INTO role_info VALUES(null,'营业员');
INSERT INTO role_info VALUES(null,'经理');
INSERT INTO role_info VALUES(null,'aaa');
INSERT INTO role_info VALUES(null,'bbb');
INSERT INTO role_info VALUES(null,'ccc');
COMMIT;

-- 角色模块表
CREATE TABLE role_module(
role_id   INT(4) NOT NULL,
module_id   INT(4) NOT NULL
);

COMMIT;
-- 角色模块表
INSERT INTO role_module VALUES(100,1);
INSERT INTO role_module VALUES(100,2);
INSERT INTO role_module VALUES(200,3);
INSERT INTO role_module VALUES(200,4);
INSERT INTO role_module VALUES(200,5);
INSERT INTO role_module VALUES(200,6);
INSERT INTO role_module VALUES(300,7);

-- 管理员表,admin_code使用utf8_bin区分大小写
CREATE TABLE IF NOT EXISTS admin_info(
   	admin_id 	INT(8) PRIMARY KEY AUTO_INCREMENT,
   	admin_code 	VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
   	password	VARCHAR(30) NOT NULL,
   	admin_name		VARCHAR(30) NOT NULL,
   	telephone 	VARCHAR(15),
   	email 		VARCHAR(50),
   	enrolldate 	TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)DEFAULT CHARSET=utf8;

-- 管理员表
INSERT INTO admin_info VALUES(2000,'admin','123','ADMIN','123456789','admin@tarena.com.cn',DEFAULT);
INSERT INTO admin_info VALUES(null,'zhangfei','123','ZhangFei','123456789','zhangfei@tarena.com.cn',DEFAULT);
INSERT INTO admin_info VALUES(null,'liubei','123','LiuBei','123456789','liubei@tarena.com.cn',DEFAULT);
INSERT INTO admin_info VALUES(null,'caocao','123','CaoCao','123456789','caocao@tarena.com.cn',DEFAULT);
INSERT INTO admin_info VALUES(null,'aaa','123','AAA','123456789','aaa@tarena.com.cn',DEFAULT);
INSERT INTO admin_info VALUES(null,'bbb','123','BBB','123456789','bbb@tarena.com.cn',DEFAULT);
COMMIT;



-- 管理员角色表
CREATE TABLE IF NOT EXISTS admin_role(
admin_id INT(8) NOT NULL,
role_id INT(4) NOT NULL
)DEFAULT CHARSET=utf8;
-- 管理员角色表
INSERT INTO admin_role VALUES(2000,100);
INSERT INTO admin_role VALUES(2001,101);
INSERT INTO admin_role VALUES(2002,103);
INSERT INTO admin_role VALUES(2003,100);
INSERT INTO admin_role VALUES(2003,101);
INSERT INTO admin_role VALUES(2003,102);
COMMIT;






