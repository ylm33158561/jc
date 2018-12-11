
DROP DATABASE IF EXISTS jc;
CREATE DATABASE jc CHARSET=UTF8;
USE jc;
CREATE TABLE user(
   uid INT PRIMARY KEY AUTO_INCREMENT,  #用户id
   uname VARCHAR(16) UNIQUE,   #用户名
   upwd  VARCHAR(32),   #用户密码
   email VARCHAR(64),   #邮箱
   phone VARCHAR(16)	#手机
);

CREATE TABLE pro_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);
CREATE TABLE laptop(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	l_name VARCHAR(64),         #名字
  	l_price VARCHAR(16),
  	l_pic   VARCHAR(132),
  	comment INT,                     #评论
  	collect INT,
	family_id INT,
	FOREIGN KEY(family_id) REFERENCES pro_family(fid)
);
CREATE TABLE shopcart(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,		#用户id
	product_id INT,         #商品id
	count INT,	#数量
	is_select INT,       #是否选中
	FOREIGN KEY(product_id) REFERENCES laptop(lid)
)




#用户
INSERT INTO user VALUES(null,'dingding',123456,'145261@qq.com',16612541478);
INSERT INTO user VALUES(null,'dangdang',123456,'789632@qq.com',13362458120);

#分类
INSERT INTO pro_family VALUES(null,'newpro');
INSERT INTO pro_family VALUES(null,'bathroom');
INSERT INTO pro_family VALUES(null,'tile');
INSERT INTO pro_family VALUES(null,'lamps');
INSERT INTO pro_family VALUES(null,'curtain');
INSERT INTO pro_family VALUES(null,'tool');
#新品
INSERT INTO laptop VALUES(null,'摇电动阳台智能升降晾衣架','145.00','http://127.0.0.1:3030/new_pic/xin_1.jpg',0,1,1);
INSERT INTO laptop VALUES
(null,'3芯工业暗装斜插座防水','38.00','http://127.0.0.1:3030/new_pic/xin_2.jpg',0,1,1);
INSERT INTO laptop VALUES(null,'全抛釉800x800瓷砖大理石','25.00','http://127.0.0.1:3030/new_pic/xin_3.png',0,0,1);
INSERT INTO laptop VALUES
(null,'LED灯带灯条室内灯光照','39.00','http://127.0.0.1:3030/new_pic/xin_4.jpg',0,1,1);
INSERT INTO laptop VALUES
(null,'卫生间毛巾架不锈钢','389.00','http://127.0.0.1:3030/new_pic/xin_5.jpg',0,1,1);


#1Floor
INSERT INTO laptop VALUES
(null,'自动洗衣机水龙头','89.00','http://127.0.0.1:3030/bath_pic/1f_1.png',0,1,2);
INSERT INTO laptop VALUES
(null,'全铜芯单冷小龙头','85.00','http://127.0.0.1:3030/bath_pic/1f_2.png',0,1,2);
INSERT INTO laptop VALUES
(null,'创意雅黑洗手盆','1316.00','http://127.0.0.1:3030/bath_pic/1f_3.png',0,1,2);
INSERT INTO laptop VALUES
(null,'创意高科技热水器','1899.00','http://127.0.0.1:3030/bath_pic/1f_4.png',0,1,2);
INSERT INTO laptop VALUES
(null,'全自动电动洁身器','999.00','http://127.0.0.1:3030/bath_pic/1f_5.png',0,1,2);
INSERT INTO laptop VALUES
(null,'科勒卫浴连体家用座厕马桶','699.00','http://127.0.0.1:3030/bath_pic/1f_6.png',0,1,2);
INSERT INTO laptop VALUES
(null,'多功能电热锅','198.00','http://127.0.0.1:3030/bath_pic/1f_7.png',0,1,2);
INSERT INTO laptop VALUES
(null,'家用豆浆机','499.00','http://127.0.0.1:3030/bath_pic/1f_8.png',0,1,2);
INSERT INTO laptop VALUES
(null,'厨房全单冷水龙头','109.00','http://127.0.0.1:3030/bath_pic/1f_9.png',0,1,2);
INSERT INTO laptop VALUES
(null,'恒成简约实木浴室卫生间镜柜','480.00','http://127.0.0.1:3030/bath_pic/1f_10.jpg',0,1,2);
INSERT INTO laptop VALUES
(null,'苏泊尔锅具套装','199.00','http://127.0.0.1:3030/bath_pic/1f_11.jpg',0,1,2);
INSERT INTO laptop VALUES
(null,'不锈钢厨房置物架菜刀座','100.00','http://127.0.0.1:3030/bath_pic/1f_12.jpg',0,1,2);


#2Floor
INSERT INTO laptop VALUES(null,'PVC自粘地板','50.00','http://127.0.0.1:3030/tile_pic/2f_1.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'塑料瓦仿屋顶瓦','59.00','http://127.0.0.1:3030/tile_pic/2f_2.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'别墅屋面瓦瓦片','300.00','http://127.0.0.1:3030/tile_pic/2f_3.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'美式白橡木木板','230.00','http://127.0.0.1:3030/tile_pic/2f_4.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'特福特圆形脊瓦','110.00','http://127.0.0.1:3030/tile_pic/2f_5.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'大理石瓷砖','169.00','http://127.0.0.1:3030/tile_pic/2f_6.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'冷冻柜门锁铰链','125.00','http://127.0.0.1:3030/tile_pic/2f_7.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'金刚内墙砖','65.00','http://127.0.0.1:3030/tile_pic/2f_8.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'多层实木地板','219.00','http://127.0.0.1:3030/tile_pic/2f_9.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'北欧橡木原木柚木色纯实木地板','169.00','http://127.0.0.1:3030/tile_pic/2f_10.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'全实木地板金刚柚木地板','245.00','http://127.0.0.1:3030/tile_pic/2f_11.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'诺贝尔瓷砖仿古地砖','45.00','http://127.0.0.1:3030/tile_pic/2f_12.jpg',1,0,3);
INSERT INTO laptop VALUES(null,'全抛釉客厅地板砖','69.00','http://127.0.0.1:3030/tile_pic/2f_13.jpg',1,0,3);


#3Floor
INSERT INTO laptop VALUES(null,'现代简约客厅灯','599.00','http://127.0.0.1:3030/lamps_pic/3f_1.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'北欧创厅灯具','1228.00','http://127.0.0.1:3030/lamps_pic/3f_2.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'欧式吊灯客厅灯复古风格餐厅灯','1688.00','http://127.0.0.1:3030/lamps_pic/3f_3.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'简约大气客厅','258.00','http://127.0.0.1:3030/lamps_pic/3f_4.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'北欧家具灯','1200.00','http://127.0.0.1:3030/lamps_pic/3f_5.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'现代格调餐厅灯','338.00','http://127.0.0.1:3030/lamps_pic/3f_6.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'简约现代led客厅灯','499.00','http://127.0.0.1:3030/lamps_pic/3f_7.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'创意艺术主卧室灯','729.00','http://127.0.0.1:3030/lamps_pic/3f_8.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'客厅吊灯后现代简约北欧创意灯','999.00','http://127.0.0.1:3030/lamps_pic/3f_9.jpg',2,3,4);
INSERT INTO laptop VALUES(null,'美式全铜吊灯客厅灯','998.00','http://127.0.0.1:3030/lamps_pic/3f_10.jpg',2,3,4);


#窗帘
INSERT INTO laptop VALUES(null,'全屋门窗定制','1000.00','http://127.0.0.1:3030/curtain_pic/4f_1.jpg',5,4,5);
INSERT INTO laptop VALUES(null,'定制隔音断桥铝合金窗','2000.00','http://127.0.0.1:3030/curtain_pic/4f_2.jpg',5,4,5);
INSERT INTO laptop VALUES(null,'纱门纱窗定做铝合金门窗','399.00','http://127.0.0.1:3030/curtain_pic/4f_3.jpg',5,4,5);
INSERT INTO laptop VALUES(null,'亚麻绣花客厅卧室定制窗帘','65.00','http://127.0.0.1:3030/curtain_pic/4f_4.jpg',5,4,5);

INSERT INTO laptop VALUES(null,'日本同款同质 现代简约定制木门','3976.00','http://127.0.0.1:3030/curtain_pic/foot_1.jpg',5,4,5);
INSERT INTO laptop VALUES(null,'现代简约遮光隔热窗帘','90.00','http://127.0.0.1:3030/curtain_pic/foot_2.jpg',5,4,5);
INSERT INTO laptop VALUES(null,'白色现代简约实木门','2488.00','http://127.0.0.1:3030/curtain_pic/foot_3.jpg',5,4,5);
#五金建材
INSERT INTO laptop VALUES(null,'希孟组合家用工具套','75.00','http://127.0.0.1:3030/curtain_pic/5f_1.jpg',5,4,6);
INSERT INTO laptop VALUES(null,'进口橱柜门快装脱卸式铰链','59.00','http://127.0.0.1:3030/curtain_pic/5f_2.jpg',5,4,6);
INSERT INTO laptop VALUES(null,'九牧太空铝置物架卫生间折叠浴巾架','449.00','http://127.0.0.1:3030/curtain_pic/5f_3.jpg',5,4,6);
INSERT INTO laptop VALUES(null,'五金 DST01N DST01 浴巾架','389.00','http://127.0.0.1:3030/curtain_pic/5f_4.jpg',5,4,6);





