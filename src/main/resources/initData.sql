



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
INSERT INTO medical.department VALUES (1,'儿科','儿科');
INSERT INTO medical.department VALUES (2,'小儿呼吸科','小儿呼吸科');
INSERT INTO medical.department VALUES (3,'小儿外科','小儿外科');
INSERT INTO medical.department VALUES (4,'小儿内科','小儿内科');
INSERT INTO medical.department VALUES (5,'小儿骨科','小儿骨科');
INSERT INTO medical.department VALUES (6,'妇科','妇科');
INSERT INTO medical.department VALUES (8,'妇科内分泌','妇科内分泌');
INSERT INTO medical.department VALUES (9,'妇泌尿科','妇泌尿科');
INSERT INTO medical.department VALUES (10,'遗传咨询科','遗传咨询科');
INSERT INTO medical.department VALUES (11,'神经外科','神经外科');
INSERT INTO medical.department VALUES (12,'心血管外科','心血管外科');
INSERT INTO medical.department VALUES (13,'胸外科','胸外科');
INSERT INTO medical.department VALUES (14,'整形科','整形科');
INSERT INTO medical.department VALUES (15,'泌尿外科','泌尿外科');
INSERT INTO medical.department VALUES (16,'心血管内科','心血管内科');
INSERT INTO medical.department VALUES (17,'神经内科','神经内科');
INSERT INTO medical.department VALUES (18,'内分泌科','内分泌科');
INSERT INTO medical.department VALUES (19,'消化内科','消化内科');
INSERT INTO medical.department VALUES (20,'普通内科','普通内科');
INSERT INTO medical.department VALUES (21,'耳鼻喉','耳鼻喉');
INSERT INTO medical.department VALUES (22,'头颈外科','头颈外科');
INSERT INTO medical.department VALUES (23,'口腔科','口腔科');
INSERT INTO medical.department VALUES (24,'正畸科','正畸科');
INSERT INTO medical.department VALUES (25,'牙周科','牙周科');
INSERT INTO medical.department VALUES (26,'骨科','骨科');
INSERT INTO medical.department VALUES (27,'脊柱外科','脊柱外科');
INSERT INTO medical.department VALUES (28,'手外科','手外科');
INSERT INTO medical.department VALUES (29,'创伤骨科','创伤骨科');
INSERT INTO medical.department VALUES (30,'矫形骨科','矫形骨科');
INSERT INTO medical.department VALUES (31,'肿瘤内科','肿瘤内科');
INSERT INTO medical.department VALUES (32,'肿瘤外科','肿瘤外科');
INSERT INTO medical.department VALUES (33,'肿瘤妇科','肿瘤妇科');
INSERT INTO medical.department VALUES (34,'放疗科','放疗科');
INSERT INTO medical.department VALUES (35,'肿瘤康复科','肿瘤康复科');

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