--������ ���� : �����ͺ��̽� �޸�, ����, �����, ����, ��ü�� ���� ����Ŭ
--��� �ʿ��� �߿��� �����Ͱ� ������ ���

--scott �������� ��밡���� ������ ����
SELECT * FROM DICT;

SELECT * FROM USER_TABLES;

SELECT * FROM ALL_TABLES;

--�� : �������̺� 
CREATE VIEW vm_emp20 as (select empno, ename, job, deptno
                                   from emp
                                 where deptno=20);
                                 
SELECT * FROM VM_EMP20;
--�� Ȯ��
SELECT * FROM USER_VIEWS;

CREATE VIEW VM_EMP30ALL AS SELECT * FROM EMP;

--������ �並 ���ؼ� INSERT �۾�
INSERT INTO VM_EMP30ALL VALUES(7777,'KIM','JUNKI',NULL,'20/10/19',2650,NULL,20);

SELECT * FROM VM_EMP30ALL;
SELECT * FROM EMP;

--��� SELECT�� �����ϵ��� ����
CREATE VIEW VM_EMP_READ AS SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY;

--������ �信 ������ �����Ѱ�?
SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='VN_EMP30ALL';
SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='VM_EMP_READ';

--�並 ����ϴ� ����
--����(���� ���̺��� ������ �ִ� �ΰ��� ���� ����)
SELECT * FROM EMP; -- SAL,COMM
--��������, ���ΰ� ���� ������ ���� ����� �����ؼ� ���

--�ε��� - �����̱� ������ SELECT ���� ȿ���� ����
--SCOTT ������ ������ �ε��� ���� ����
SELECT * FROM USER_INDEXES;

--�⺻Ű ���� => �ڵ��ε����� ��
--�ε��� ����(EMP ���̺��� SAL���� �ε��� ����)
CREATE INDEX IDX_EMP_SQL ON EMP (SAL);

select * from EMP WHERE sal=1250;

create table useTBL(
    userID char(8) NOT NULL PRIMARY KEY,
    userName nvarchar2(10) NOT NULL,
    birthYear number(4) NOT NULL,
    mobile char(3));
    
    SELECT index_name, uniqueness, index_type FROM USER_INDEXES;
    
    select * from user_indexes;
    
--������ : Ư�� ��Ģ�� �´� ���� ���� ���� EX)�Խñ� ��ȣ, ��ǰ ��ȣ, �ֹ� ��ȣ...
--������ ����
CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10 --10�� ����
START WITH 10  --ó�� ���� ����
MAXVALUE 90    --������ ����
MINVALUE 0     --START ������ �۰� ����
NOCYCLE CACHE 2; --�ݺ����� ����, �̸� ������ ������ ����

CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;

--�������� �̿��ؼ� ����
SELECT * FROM DEPT_SEQ_TBL;
INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.NEXTVAL, 'DATABASE', 'SEOUL'); --������ ���ö�����
--������ ����
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

--������ ����� ������ Ȯ���ϱ�
SELECT DEPT_SEQ.CURRVAL FROM DUAL;

--SYNONYM (���Ǿ�) : ���� ��Ī
--���̺�, ��, ������ �� ��ü�鿡�� ��� ����� �� �ִ� �̸� �ο�
CREATE SYNONYM E FOR EMP;

SELECT * FROM E;

DROP SYNONYM E;

--�ǽ�1) ���� SQL���� �ۼ��� ������
--�� EMP���̺�� ���� ������ �����͸� �����ϴ� EMPIDX ���̺��� �����Ͻÿ�.
--�� ������ EMPIDX ���̺��� EMPNO ���� IDX_EMPIDX_EMPNO �ε����� �����Ͻÿ�.
--�� �ε����� �� �����Ǿ����� ������ ���� �並 ���� Ȯ���Ͻÿ�.

CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1<>1;
CREATE INDEX IDX_EMP_EMPNO ON EMPIDX(EMPNO);
SELECT * FROM USER_INDEXES;

--[�ǽ�2] �ǽ�1���� ������ EMPIDX ���̺��� ������ �� �޿��� 1500 �ʰ��� ����鸸 ����ϴ� 
--EMPIDX_OVER15K �並 �����Ͻÿ�. (�����ȣ, ����̸�, ��å,�μ���ȣ,�޿�,�߰����� ���� ������ �ִ�)
CREATE VIEW EMPIDX_OVER15K as select * FROM EMPIDX WHERE SAL > 1500;
SELECT * FROM EMPIDX_OVER15K;

--[�ǽ�3] ���� SQL���� �ۼ��� ������
--�� DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��Ͻÿ�.
--�� ������ DEPTSEQ ���̺��� DEPTNO ���� ����� �������� �Ʒ��� ���õ� Ư���� ���� ������ ���ÿ�.
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;
CREATE SEQUENCE DEPTSEQ_SEQ
INCREMENT BY 1 --10�� ����
START WITH 1  --ó�� ���� ����
MAXVALUE 99    --������ ����
MINVALUE 1     --START ������ �۰� ����
NOCYCLE NOCACHE; --�ݺ����� ����, �̸� ������ ������ ����

select * from USER_SEQUENCES;

INSERT INTO DEPTSEQ VALUES(deptno.NEXTVAL, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ VALUES(deptno.NEXTVAL, 'WEB', 'PUSAN');
INSERT INTO DEPTSEQ VALUES(deptno.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;
--������ ����
DROP SYNONYM DEPTNO;