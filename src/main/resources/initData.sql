



-- 设置shift表的约束条件，约定num不能大于max_num，并且num要大于0，max_num>0
DELIMITER |
CREATE TRIGGER shift_num BEFORE UPDATE ON shift
  FOR EACH ROW
  BEGIN
    DECLARE msg varchar(200);
    IF NEW.num > OLD.max_num THEN
      set msg = '预约号已满';
      SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = msg;
    END IF;

    IF NEW.num < 0 THEN
      set msg = '预约号为0';
      SIGNAL SQLSTATE 'HY001' SET MESSAGE_TEXT = msg;
    END IF;

    IF NEW.max_num < 0 THEN
      set msg = '最大挂号数不能小于0';
      SIGNAL SQLSTATE 'HY002' SET MESSAGE_TEXT = msg;
    END IF;
  END |
DELIMITER ;


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


-- 添加科室 科室为二级科室，使用逗号隔开。格式为:内科门诊,普通内科
INSERT INTO department VALUES (1,'内科门诊,普通内科','普通内科');
INSERT INTO department VALUES (2,'内科门诊,内科','内科');
INSERT INTO department VALUES (3,'皮肤门诊,皮肤门诊','普通皮肤科');
INSERT INTO department VALUES (4,'皮肤门诊,痔疮专科','痔疮专科');
INSERT INTO department VALUES (5,'皮肤门诊,脱发专科','脱发专科');
INSERT INTO department VALUES (6,'皮肤门诊,湿疹专科','湿疹专科');
INSERT INTO department VALUES (7,'皮肤门诊,皮肤病专科','皮肤病专科');
INSERT INTO department VALUES (8,'耳鼻喉门诊,耳鼻喉专科','耳鼻喉专科');
INSERT INTO department VALUES (9,'耳鼻喉门诊,头颈肿瘤','头颈肿瘤');

-- 将医生安排到科室
INSERT INTO depar_user VALUES (2,1);
INSERT INTO depar_user VALUES (3,3);
INSERT INTO depar_user VALUES (4,9);

-- 排班信息排班表编号 班次开始日期 班次结束日期 科室编号 医生编号 最大挂号数 现有挂号数 班次描述
INSERT INTO shift VALUES (1,'2018-4-30 8:00:00','2018-4-30 9:00:00',1,2,8,1,'none');
INSERT INTO shift VALUES (2,'2018-4-30 8:00:00','2018-4-30 9:00:00',3,3,8,1,'none');
INSERT INTO shift VALUES (3,'2018-4-30 8:00:00','2018-4-30 9:00:00',9,4,8,1,'none');

-- 挂号信息表
INSERT INTO registration VALUES (1,5);
INSERT INTO registration VALUES (2,6);
INSERT INTO registration VALUES (3,7);