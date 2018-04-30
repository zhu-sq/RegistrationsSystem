
-- 删除表格，重新建立
DROP TABLE registration;
DROP TABLE depar_user;
DROP TABLE shift_user;
DROP TABLE role_user;
DROP TABLE shift;
DROP TABLE user;
DROP TABLE department;
DROP TABLE role;


-- 添加角色表
-- 1 超级管理员 （账号只有一个，有最高权限，可以添加管理员，可以理解为院长账号）
-- 2 管理员 （医生）
-- 3 普通用户 （患者）
INSERT INTO role(rno,name,intro) VALUES (1,'院长','超级管理员，有最高权限，可以操作管理员');
INSERT INTO role(rno,name,intro) VALUES (2,'医生','医生，可以查看预约信息');
INSERT INTO role(rno,name,intro) VALUES (3,'患者','普通患者');

-- 添加账号
-- 超级管理员一定是一开始就存在，所以要添加超级管理员
INSERT INTO user(uno,name,pwd) VALUES (1,'admin','admin');

-- 添加测试账号
INSERT INTO user(uno,name,pwd) VALUES (2,'医生1','123');
INSERT INTO user(uno,name,pwd) VALUES (3,'医生2','123');
INSERT INTO user(uno,name,pwd) VALUES (4,'医生3','123');
INSERT INTO user(uno,name,idcard,pwd) VALUES (5,'患者1','222222222222222222','123');
INSERT INTO user(uno,name,idcard,pwd) VALUES (6,'患者2','111111111111111111','123');
INSERT INTO user(uno,name,phone,pwd) VALUES (7,'患者3',18826054757,'123');

-- 设置用户角色
INSERT INTO role_user VALUES (1,1);
INSERT INTO role_user VALUES (2,2);
INSERT INTO role_user VALUES (3,2);
INSERT INTO role_user VALUES (4,2);
INSERT INTO role_user VALUES (5,3);
INSERT INTO role_user VALUES (6,3);
INSERT INTO role_user VALUES (7,3);