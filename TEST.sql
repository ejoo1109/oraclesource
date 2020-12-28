--�������� (DDL�ۼ�)
--1.NOT NULL
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD) 
VALUES('hong1234','hong1234');

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD) 
VALUES('KANG 1234',NULL);

UPDATE TABLE_NOTNULL SET login_pwd=NULL WHERE login_id='hong1234';

SELECT * FROM TABLE_NOTNULL;

--�������� Ȯ���ϱ� 
SELECT*FROM SYS.user_constraints;

--�������Ǹ��� �����ϱ�
CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBL_NN_LGIND_NN NOT NULL ,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBL_NN_LGPWD_NN NOT NULL,
    TEL VARCHAR2(20));

--�������� �߰�
ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL NOT NULL);
ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL CONSTRAINT TBL_NN_TEL_NN NOT NULL);
--�������� �̸� ����
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT SYS_C0011064 TO TBL_NN_TEL_NN;
--�������� ����
ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBL_NN_TEL_NN;

UPDATE TABLE_NOTNULL SET TEL='010-1111-1111' WHERE LOGIN_ID='hong1234';
ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL);

--2.UNIQUE: �ߺ����� �ʴ� ��
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));
    
INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('TEST_ID02','PWD01','010-1234-1234');

SELECT *FROM TABLE_UNIQUE;

--�������� Ȯ���ϱ�
SELECT* FROM USER_CONSTRAINTS;

CREATE TABLE TABLE_UNIQUE2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE ,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPWD_NN NOT NULL,
    TEL VARCHAR2(20));
    
 --3.PRIMARTY KEY(NOT NULL + UNIQUE) : �⺻Ű
 CREATE TABLE TABLE_PK(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));
    
SELECT* FROM USER_CONSTRAINTS;
INSERT INTO TABLE_PK(LOGIN_ID,LOGIN_PWD,TEL)
VALUES(NULL,'PWD01','010-1234-1234');

 CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LOGIN_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));
    
--�������Ǹ� ��Ƽ� �ֱ�
CREATE TABLE TABLE_CONSTRAINT(
    ID NUMBER(6),
    NAME VARCHAR2(10),
    ADDR VARCHAR2(20),
    TEL VARCHAR2(20),
    CONSTRAINT TBL_ID_PK PRIMARY KEY(ID),
    CONSTRAINT TBL_TEL_UNQ UNIQUE(TEL)
    );

--4.FOREIGN KEY (�ܷ�Ű) : ���� �ٸ� ���̺� �� ��������
CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));
    
CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK 
    REFERENCES DEPT_FK(DEPTNO)ON DELETE CASCADE);
--ON DELETE CASCADE : �θ�Ű�� ���ŵ� �� �ڽ�Ű�� ���� ����
--ON DELETE SET NULL : �θ�Ű�� ���� �� �� �ڽ�Ű�� ���� NULL�� ����
INSERT INTO DEPT_FK VALUES(50,'DATABASE','SEOUL');

INSERT INTO EMP_FK VALUES(1111,'ȫ�浿','CLERK','7788','2019-02-13',1200,NULL,50);

DELETE FROM DEPT_FK WHERE DEPTNO=50;

SELECT * FROM EMP_FK;

DROP TABLE EMP_FK;
CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK 
    REFERENCES DEPT_FK(DEPTNO)ON DELETE SET NULL);
    
--5.CHECK : ���� ������ �� �ִ� ���� ���� �Ǵ� ���� ����
CREATE TABLE TABLE_CHECK(
   LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGID_PK PRIMARY KEY,
   LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGPD_CK CHECK (LENGTH(LOGIN_PWD)>3),
   TEL VARCHAR2(20));
   
INSERT INTO TABLE_CHECK VALUES('TEST_ID','1234','010-1234-5678');

--6.DEFAULT : �⺻�� ���ϱ�
CREATE TABLE TABLE_DEFAULT(
   LOGIN_ID VARCHAR2(20) CONSTRAINT TBLDF_LOGID_PK PRIMARY KEY,
   LOGIN_PWD VARCHAR2(20)DEFAULT '1234',
   TEL VARCHAR2(20));
   
DESC TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES('TEST_ID',NULL,'010-1234-5678');
INSERT INTO TABLE_DEFAULT VALUES('TEST_ID2','4567','010-1234-5678');
INSERT INTO TABLE_DEFAULT (LOGIN_ID,TEL) VALUES('TEST_ID3','010-1234-5678');
SELECT*FROM TABLE_DEFAULT;