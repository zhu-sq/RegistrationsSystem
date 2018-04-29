CREATE TABLE IF NOT EXISTS user(
   uno INT(4) PRIMARY KEY AUTO_INCREMENT
  ,name VArCHAr(10) NOT NULL
  ,pwd VArCHAr(20) NOT NULL
  ,birthday TIMESTAMP
  ,sex CHAr(2) CHECK (sex='男'or sex='女')
  ,idcard CHAr(18) uNICOdE NOT NULL
  ,phone INT(11) uNIQuE
  ,intro VArCHAr(30)
  ,title VArCHAr(10)
);

CREATE TABLE IF NOT EXISTS role(
   rno INT(2) PRIMARY KEY AUTO_INCREMENT
  ,name VArCHAr(10) NOT NULL
  ,intro VArCHAr(10)
);

CREATE TABLE IF NOT EXISTS role_user(
   uno INT(4)
  ,rno INT(2)
  ,FOREIGN KEY (uno) REFERENCES user(uno)
  ,FOREIGN KEY (rno) REFERENCES role(rno)
  ,PRIMARY KEY (uno,rno)
);

CREATE TABLE IF NOT EXISTS department(
   dno INT(4) PRIMARY KEY AUTO_INCREMENT
  ,name VArCHAr(10) NOT NULL
  ,detail VArCHAr(50)
);

CREATE TABLE IF NOT EXISTS depar_user(
   uno INT(4)
  ,dno INT(4)
  ,FOREIGN KEY (uno) REFERENCES user(uno)
  ,FOREIGN KEY (dno) REFERENCES department(dno)
  ,PRIMARY KEY (uno,dno)
);

CREATE TABLE IF NOT EXISTS shift(
   sno INT(4) PRIMARY KEY AUTO_INCREMENT
  ,date TIMESTAMP NOT NULL
  ,detail VArCHAr(20)
);

CREATE TABLE IF NOT EXISTS shift_user(
   dno INT(4)
  ,uno INT(4)
  ,sno INT(4)
  ,max_num INT(2)
  ,num INT(2) CHECK (num<=max_num)
  ,FOREIGN KEY (dno) REFERENCES department(dno)
  ,FOREIGN KEY (uno) REFERENCES user(uno)
  ,FOREIGN KEY (sno) REFERENCES shift(sno)
  ,PRIMARY KEY (dno,uno,sno)
);

CREATE TABLE IF NOT EXISTS registration(
   doctor INT(4)
  ,sno INT(4)
  ,uno INT(4)
  ,FOREIGN KEY (doctor) REFERENCES user(uno)
  ,FOREIGN KEY (uno) REFERENCES user(uno)
  ,FOREIGN KEY (sno) REFERENCES shift(sno)
  ,PRIMARY KEY (doctor,uno,sno)
);

