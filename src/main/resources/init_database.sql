CREATE TABLE IF NOT EXISTS user(
   uno INT(4) PRIMARY KEY AUTO_INCREMENT
  ,name VARCHAR(30) NOT NULL
  ,pwd VARCHAR(50) NOT NULL
  ,birthday TIMESTAMP
  ,sex CHAR(2) CHECK (sex='男'or sex='女')
  ,idcard CHAR(18) UNIQUE
  ,phone VARCHAR(20) UNIQUE
  ,intro VARCHAR(100)
  ,title VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS role(
   rno INT(2) PRIMARY KEY AUTO_INCREMENT
  ,name VARCHAR(30) NOT NULL
  ,intro VARCHAR(100)
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
  ,name VARCHAR(30) NOT NULL
  ,detail VARCHAR(100)
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
  ,start_date TIMESTAMP NOT NULL
  ,end_date TIMESTAMP NOT NULL
  ,detail VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS shift_user(
   suno INT(4) PRIMARY KEY AUTO_INCREMENT
  ,dno INT(4)
  ,uno INT(4)
  ,sno INT(4)
  ,max_num INT(2)
  ,num INT(2) CHECK (num<=max_num)
  ,FOREIGN KEY (dno) REFERENCES department(dno)
  ,FOREIGN KEY (uno) REFERENCES user(uno)
  ,FOREIGN KEY (sno) REFERENCES shift(sno)
);

CREATE TABLE IF NOT EXISTS registration(
   suno INT(4)
  ,uno INT(4)
  ,FOREIGN KEY (suno) REFERENCES shift_user(suno)
  ,FOREIGN KEY (uno) REFERENCES user(uno)
  ,PRIMARY KEY (suno,uno)
);

