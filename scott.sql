-- scott ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- emp ���̺��� ������ ��ȸ
DESC emp;

-- emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;

--�ߺ� ���ڵ� ������ �� ��ȸ : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais (��Ī): AS -���� ���� ������� �ʰ� ����Ҷ��� �����ؼ� ������
SELECT empno AS �����ȣ FROM emp;

SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

SELECT ename as ����̸�, job as "�� å" from emp;

-- ORDER BY : �����Ͽ� ��ȸ

-- �ϳ��� ���� ������ �־� ��������(ASC) ��ȸ
SELECT ename, sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename, sal FROM emp ORDER BY sal DESC;

--��ü ������ ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

--�μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ����������ȸ
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

SELECT empno AS EMPLOYEE_NO,ename AS EMPLOYEE_NAME,job, mgr AS MANAGER, 
hiredate,sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

--WHERE : ��ȸ�� �� �� ���� �ֱ�
--�μ���ȣ�� 30���� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

--�����ȣ�� 7782�� ��� ��ȸ
SELECT * FROM emp WHERE empno = 7782;

--�μ���ȣ�� 30�̰� ����� ��å�� SALESMAN ���� ��ȸ
--������ Ÿ���� VARCHAR �ΰ�� ��ȸ�� ' '�� ��ȸ
--�ΰ��� �����϶� and�� ������ �߰�
--�ΰ��� ������ �ٸ��� OR�� ����
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
--�����ȣ�� 7499�̰�, �μ���ȣ�� 30�� ������ȸ
SELECT * FROM emp WHERE empno=7499 AND deptno = 30;

--�μ���ȣ�� 30�̰ų�, ��� ��å�� CLERK ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';
--�μ���ȣ�� 20�̰ų�, ��� ��å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno= 20 OR job='SALESMAN';

--�����ڸ� �̿��� ��ȸ
--��������� : sal*12�� �ݾ��� 36000�� ������ ��ȸ
SELECT * FROM emp WHERE sal*12=36000;
--���迬����: >,<,>=,<=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;
--(���ĺ� f���� ��)
SELECT * FROM emp WHERE ename >= 'F';
--�������� : AND, OR
--�޿��� 2500�̻��̰�, ������ ANALYST�� ������� ��ȸ
SELECT * FROM emp WHERE sal>=2500 and job='ANALYST';
--������ MANAGER, SALESMAN, CLERK�� ������� ��ȸ
SELECT * FROM emp WHERE job='MANAGER' or job='SALESMAN' or job='CLERK';

--������� : �����׸��� ������ �˻� 
--SAL�� 3000�� �ƴ� ������� ���
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal^=3000;

--IN ������
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');
SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

--IN����ؼ� �μ���ȣ�� 10,20���� ������� ��ȸ
SELECT *FROM emp WHERE deptno IN(10,20);

--BETWEEN A AND B
--1)�޿��� 2000�̻� 3000 ������ ������� ��ȸ
SELECT * FROM emp WHERE sal >=2000 and sal<=3000;
SELECT * FROM emp WHERE sal between 2000 and 3000;

--2)�޿��� 2000�̻� 3000 ���ϰ� �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE sal not between 2000 and 3000;

--LIKE : ���ڿ� �˻� ���(S�� �����ϴ�~,H�� ������~,����� T�� ������)��ҹ��ڱ���
--1) ����̸��� S�� �����ϴ� ��� ������� ��ȸ�ϱ�
SELECT * FROM emp WHERE ename LIKE 'S%'; 

--2) ����̸��� �ι�° ���ڰ� L�� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) ����̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '%AM%';

--4) ����̸��� AM�� ���ԵǾ� �ִ� �ʴ� ����� ��ȸ
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

--IS NULL
SELECT * FROM emp WHERE comm = null; (X)
SELECT * FROM emp WHERE comm IS null;

--MGR(�Ŵ���ID)�� NULL�� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS null;
--MGR(�Ŵ���ID)�� NULL�� �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NOT null;

--���տ����� : ������(UNION), ������(INTERSECT), ������(MINUS)
--DEPTNO�� 10�� ���̺�� DEPTNO�� 20�� ����� ���ؼ� ���ؼ� �����ֱ�
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION ALL
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

--�μ���ȣ�� 10�� �ƴ� ������� ���� ��ȸ
SELECT  empno, ename, sal, deptno FROM emp
MINUS
SELECT  empno, ename, sal, deptno FROM emp WHERE deptno=10;

--�μ���ȣ�� 10�� ������� ��ȸ
SELECT  empno, ename, sal, deptno FROM emp
INTERSECT
SELECT  empno, ename, sal, deptno FROM emp WHERE deptno=10;

--20,30�� �μ��� �ٹ��ϰ� �ִ� ��� �� SAL�� 2000 �ʰ��� ����� ���� �ΰ���
--����� SELECT���� ����Ͽ�, �����ȣ, �̸�, �޿�, �μ���ȣ�� ����ϴ�
--SQL �� �ۼ��ϱ�

--���տ����� ������� �ʴ� ���
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN(20,30) and sal>2000;
--���տ����ڸ� ����ϴ� ���
SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>2000
MINUS
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>2000 AND deptno=20
MINUS
SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>2000 and deptno=30;

--����Ŭ �Լ�
--1)�����Լ� : UPPER, LOWER, INITCAP, LENGTH, LENGTHB
--ename�� upper, lower, initcap���� ��ȯ�Ͽ� ��ȸ
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

--DUAL ���̺� �̿�(SYS�� �����ϰ� �ִ� ���̺�� �ӽÿ����̳� �Լ��� ����� Ȯ���ϴ� �뵵)
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;

--��å �̸��� 6���� �̻��� ������� ���� ����
SELECT * FROM emp WHERE length(job) >=6;

--���ڿ� �Լ� : substr(���°����,�) 1�� ����
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) FROM emp;
-- -LENGTH(job)= -5 (������ġ�� �����ʱ������� -1�� ����)
SELECT job, SUBSTR(job,-LENGTH(job)), SUBSTR(job, -LENGTH(job),2),SUBSTR(job,-3)
FROM emp;
--���ڿ� �Լ� : INSTR(Ư������ ��ġ ã��)
SELECT INSTR('HELLO,ORACLE!','L')AS INSTR_1,
       INSTR('HELLO,ORACLE!','L',5)AS INSTR_2,
       INSTR('HELLO,ORACLE!','L',2,2)AS INSTR_3
FROM dual;

--���ڿ� �Լ�: REPLACE (ã�Ƽ� �ٲٱ�)-��ȸ�� ����� �ٲ㼭 ������
SELECT REPLACE ('�̰��� oracle�̴�','�̰���','This is')
FROM dual;
SELECT '010-1234-45678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678','-',' ')AS REPLACE_1,
    REPLACE('010-1234-5678','-')AS REPLACE_2
FROM dual;

--���ڿ� �Լ� : CONCAT(����)
--empno, ename�� �����Ͽ� ��ȸ
SELECT CONCAT(empno,ename), CONCAT(empno, CONCAT(':',ename))
FROM emp
WHERE ename='SCOTT';

--|| : ������ �ǹ̷� ����
SELECT empno||ename, empno || ':'||ename
FROM emp
WHERE ename='SCOTT';

--���ڿ� �Լ� : TRIM(��������), LTRIM(���ʰ��鸸����), RTRIM(������ ���鸸����)
SELECT '    �̰���   ',TRIM('    �̰���    ')
FROM dual;

--���ڿ� �Լ� : REVERSE-�Ųٷ� ���
SELECT REVERSE('Oracle') FROM dual;

--2.�����Լ� : ROUND(�ݿø�), TRUNC(����), CEIL(�Էµ� ������ ����� ū ����),
--FLOOR(�Էµ� ���ڿ� ����� ���� ����), MOD(������)
SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678,0) AS ROUND_1,
       ROUND(1234.5678,1) AS ROUND_2,
       ROUND(1234.5678,-1) AS ROUND_MINUS,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM dual;

SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678,0) AS TRUNC_1,
       TRUNC(1234.5678,1) AS TRUNC_2,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS,
       TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM dual;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM dual;

SELECT MOD(15,6),MOD(10,2), MOD(11,2) FROM dual;

--3.��¥�Լ� : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

--��¥�����ʹ� ������ ������ : ��¥������ + 1,-1,��¥ ������-��¥������
--��¥������ + ��¥�����ʹ� �Ұ�
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM dual;

--��¥�Լ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM dual;

--�Ի�10�ֳ��� �Ǵ� ����� ��ȸ
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate, 120) FROM emp;

--�Ի�38�� �̸��� ��� ��ȸ
SELECT* FROM emp WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

--��¥�Լ� : MONTHS_BETWEEN(�� ��¥ ������ ����)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT empno, ename, hiredate, SYSDATE,MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTH1,
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

--��¥�Լ� : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE,'������'),LAST_DAY(SYSDATE)
FROM dual;

--4.����ȯ �Լ� : TO_CHAR(��¥, ���ڵ����͸� ���ڷ� ��ȯ), 
--              TO_NUMER(���ڵ����͸� ���ڷ� ��ȯ)
--               TO_DATE(���� �����͸� ��¥�� ��ȯ)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'MM') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'MON') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'DD') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'DAY') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS ���糯¥ FROM dual;

--���ó�¥�� ��/��/��/ 24�ð����� ǥ��
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS PM') AS ���糯¥�ð� FROM dual;

SELECT 1300-TO_NUMBER('1500'),TO_NUMBER('1300')+1500 FROM dual;
--SELECT 1300-TO_NUMBER('1,300')-TO_NUMBER('1,500') FROM dual;(X)
--TO_NUMBER�� �޸� �ν��� ���ϱ� ������ 999,999�� �־� ������ Ÿ���� ��Ÿ��
--9,0(������ ���ڸ��� �ǹ���),9���ڸ��� ä���� �ʴ�����,0���ڸ��� ä��� ����
SELECT TO_NUMBER('1,300,200','999,999,999')-TO_NUMBER('1,500,200','999,999,999') FROM dual;

SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
     TO_CHAR(SAL, 'L999,999') AS SAL_L,
     TO_CHAR(SAL,'$999,999.00') AS SAL_1,
     TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
     TO_CHAR(SAL, '000999999.99') AS SAL_3,
     TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM emp;

SELECT TO_DATE('2020-11-05','YYYY/MM/DD')AS TODATE1,
       TO_DATE('20201105','YYYY-MM-DD')AS TODATE2 FROM dual;

--1981�� 6��1�� ���Ŀ� �Ի��� ������� ��ȸ
SELECT *
FROM emp 
WHERE hiredate > TO_DATE ('1981-06-01','YYYY-MM-DD');

SELECT TO_DATE ('2019-12-20')-TO_DATE('2019-10-20') FROM dual;

--NULLó�� �Լ� : NVL, NVL2
SELECT empno, ename, sal, comm, sal+comm FROM emp;
SELECT empno, ename, sal, comm, sal+comm, nvl(comm,0),sal+nvl(comm,0)
FROM emp;

SELECT empno, ename, sal, comm, nvl2(comm,'O','X'),
       nvl2(comm,sal*12+comm,sal*12)as annsal
FROM emp;

--DECODE �Լ��� CASE��
--job�� manager, salesman,analyst ��쿡 ������ �ٸ� ������ �����ϰ� �ʹٸ�?
SELECT empno, ename, job, sal, DECODE(job,
                                      'MANAGER', SAL*1.1,
                                      'SALESMAN', SAL*1.05,
                                      'ANALYST', SAL,
                                      SAL*1.03) AS UPSAL 
FROM emp;

SELECT empno, ename, job, sal, CASE job
                               WHEN 'MANAGER' THEN SAL*1.1
                               WHEN 'SALESMAN' THEN SAL*1.05
                               WHEN 'ANALYST' THEN SAL
                               ELSE  SAL*1.03
                               END AS UPSAL 
FROM emp;
SELECT empno, ename, job, sal, CASE
                               WHEN COMM IS NULL THEN '�ش���׾���'
                               WHEN COMM =0 THEN '�������'
                               WHEN COMM >0 THEN '���� : ' || COMM
                               END AS COMM_TEXT FROM EMP;
                        
--�ǽ�1)emp ���̺��� ������� �� ��� �ٹ��ϼ��� 21.5���̴�. �Ϸ� �ٹ��ð��� 8�ð����� ������ 
--������� �Ϸ�޿�(day_pay)�� �ñ�(TIME_PAY)�� ����Ͽ� ����� ����Ѵ�
--��, �Ϸ�޿��� �Ҽ��� ��°�ڸ����� ������ �ñ��� �ι�° �Ҽ������� �ݿø��Ѵ�.

SELECT empno,ename,sal,round((sal/21.5),2)as day_pay,
round((sal/21.5/8),1)as time_pay
from emp;
                
--�ǽ�2)emp���̺��� ������� �Ի���(hiredate)�� �������� 3������ ���� �� ù �����Ͽ� �������� �ȴ�
--������� �������� �Ǵ� ��¥(R_JOB)�� YYYY-MM-DD�������� �Ʒ��� ���� ����Ͻÿ�
--��, �߰�����(COMM)�� ���� ����� �߰������� N/A�� ����Ͻÿ�
SELECT empno,ename,hiredate,next_day(add_months(hiredate,3),'������') as r_job,
nvl(to_char(comm),'n/a')as comm
from emp;

--�ǽ�3)
SELECT SUBSTR(TO_CHAR(MGR),1,2) FROM EMP;

SELECT EMPNO,ENAME,MGR,
       DECODE(SUBSTR(TO_CHAR(MGR),1,2),
        NULL,'0000',
        '75','5555',
        '76','6666',
        '77','7777',
        '78','8888',
        TO_CHAR(MGR)) AS CHG_MGR
FROM EMP;
                       
--���� ����� ȭ�鿡 ���
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;
/

--���� ���� : ������ Ÿ��;
--          ������ Ÿ�� := ��; 
DECLARE
    V_EMPNO NUMBER(4) :=7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_ENAME);
END;
/

--���;
DECLARE
    V_TAX CONSTANT NUMBER(1) :=3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/
--������ �⺻�� ����
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '|| V_DEPTNO);
END;
/

--������ NULL�� ���� ����
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '|| V_DEPTNO);
END;
/

--DEFALUT + NOT NULL
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '|| V_DEPTNO);
END;
/

--�ڷ���
--��Į���� : ����Ŭ �����ͺ��̽����� ����ϴ� �ڷ��� + Boolean
--������ : �ٸ� ���̺��� �÷� �ڷ����̳�, �ϳ��� �� ������ ����

--Ư�� ���̺��� �÷� �ڷ��� ����
DECLARE
-- DEPT ���̺��� DEPTNO �� ���� �ڷ��� ���
    V_DEPTNO DEPT.DEPTNO%TYPE :=50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

--DEPT ���̺��� ������ ���� �ڷ��� ���
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

--���ǹ�

--IF
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER,2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER Ȧ��');
    END IF;
END;
/

--IF ~ ELSE
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER,2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER Ȧ��');
    ELSE
        DBMS_OUTPUT.PUT_LINE('V_NUMBER ¦��');
    END IF;
END;
/
--IF ~ ELSIF ~ ELSE

DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >=90 THEN
        DBMS_OUTPUT.PUT_LINE('A');
    ELSIF V_SCORE >=80 THEN
        DBMS_OUTPUT.PUT_LINE('B');
    ELSIF V_SCORE >=70 THEN
        DBMS_OUTPUT.PUT_LINE('C');
    ELSIF V_SCORE >=60 THEN
        DBMS_OUTPUT.PUT_LINE('D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    END IF;
END;
/

--CASE
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
      WHEN 10 THEN
        DBMS_OUTPUT.PUT_LINE('A');
      WHEN 9 THEN
        DBMS_OUTPUT.PUT_LINE('B');
      WHEN 8 THEN
        DBMS_OUTPUT.PUT_LINE('C');
      WHEN 7 THEN
        DBMS_OUTPUT.PUT_LINE('D');
      ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    END CASE;
END;

--�ݺ���

--LOOP : �⺻ �ݺ���
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
      DBMS_OUTPUT.PUT_LINE('���� V_NUM : '|| V_NUM);
      V_NUM := V_NUM+1;
         EXIT WHEN V_NUM > 4; -- �ݺ��� ����
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER :=0;
BEGIN
     LOOP
      DBMS_OUTPUT.PUT_LINE('���� V_NUM : '|| V_NUM);
      V_NUM := V_NUM+1;
      IF V_NUM >4 THEN
         EXIT;
         END IF;-- �ݺ��� ����
    END LOOP;
END;
/

--WHILE
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    WHILE V_NUM < 4 LOOP
      DBMS_OUTPUT.PUT_LINE('���� V_NUM : '|| V_NUM);
      V_NUM := V_NUM+1;
    END LOOP;
END;
/

--FOR��
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR I IN 0..4 LOOP --���۰�..���ᰪ
      DBMS_OUTPUT.PUT_LINE('���� V_NUM : '|| I);
    END LOOP;
END;
/
--FOR REVERSE
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR I IN REVERSE 0..4 LOOP 
      DBMS_OUTPUT.PUT_LINE('���� I : '|| I);
    END LOOP;
END;
/
--CONTINUE ������ ������ �����Ұ��� ����
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR I IN 0..4 LOOP
        CONTINUE WHEN MOD(I,2) = 1;
      DBMS_OUTPUT.PUT_LINE('���� I : '|| I);
    END LOOP;
END;
/

--[�ǽ�] 1~10���� ����ϱ�
BEGIN
    FOR I IN 0..10 LOOP
      DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/
--[�ǽ�] 1~10���� Ȧ���� ���
BEGIN
    FOR I IN 0..10 LOOP
        IF I MOD 2=1 THEN
      DBMS_OUTPUT.PUT_LINE(I);
      END IF;
    END LOOP;
END;
/

--[�ǽ�]
--DEPT ���̺��� DEPTNO�� �ڷ����� ���� ���� V_DEPTNO�� �����Ѵ�.
--�׸��� V_DEPTNO ���� ���� 10,20,30,40�� �������� �� ������ ���� �μ�
--�̸��� ����ϴ� ���α׷��� �ۼ��ϱ�, ��, �μ� ��ȣ�� 10,20,30,40�� �ƴϸ� N/A�� ����ϱ�
--10:ACCOUNTING, 20:RESEARCH, 30:SALES, 40: DECLARE
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE :=0;
BEGIN
    IF V_DEPTNO =10 THEN 
      DBMS_OUTPUT.PUT_LINE('DNAME : ACCOUNTING');
     ELSIF V_DEPTNO =20 THEN 
      DBMS_OUTPUT.PUT_LINE('DNAME : RESEARCH'); 
     ELSIF V_DEPTNO =30 THEN 
      DBMS_OUTPUT.PUT_LINE('DNAME : SALES'); 
     ELSIF V_DEPTNO =40 THEN 
      DBMS_OUTPUT.PUT_LINE('DNAME : OPERATIONS'); 
     ELSE 
      DBMS_OUTPUT.PUT_LINE('DNAME : N/A'); 
   END IF;
END;
/
--���ڵ�(�ڹ��� Ŭ���� ����) : �ڷ����� ���� �ٸ� �����͸� �ϳ��� ������ ����
DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUBER(2) NOT NULL := 99;
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 99;
    DEPT_REC.DNAME := 'DATABASE';
    DEPT_REC.LOC := 'SEOUL';
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_REC.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT_REC.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_REC.LOC);
END;
/
--���ڵ带 ����� INSERT

--���̺� ����(DEPT ���̺� ����)
CREATE TABLE DEPT_RECORD 
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_RECORD;


DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 99;
    DEPT_REC.DNAME := 'DATABASE';
    DEPT_REC.LOC := 'SEOUL';
    
    INSERT INTO DEPT_RECORD
    VALUES DEPT_REC;
END;
/

--������Ʈ�� ���� INSERT

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 50;
    DEPT_REC.DNAME := 'JSP';
    DEPT_REC.LOC := 'PUSAN';
    
    UPDATE DEPT_RECORD
    SET ROW = DEPT_REC
    WHERE DEPTNO = 99;
END;
/
SELECT * FROM DEPT_RECORD;

--���ڵ带 �����ϴ� ���ڵ�
DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
    TYPE REC_EMP IS RECORD(
    EMPNO EMP.EMPNO%TYPE,
    ENAME EMP.ENAME%TYPE,
    DINFO REC_DEPT
    );
    EMP_REC REC_EMP;
BEGIN
    SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    INTO EMP_REC.EMPNO, EMP_REC.ENAME, EMP_REC.DINFO.DEPTNO, EMP_REC.DINFO.DNAME,
        EMP_REC.DINFO.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.EMPNO = 7788;
    DBMS_OUTPUT.PUT_LINE('EMPNO : '|| EMP_REC.EMPNO);
    DBMS_OUTPUT.PUT_LINE('ENAME : '|| EMP_REC.ENAME);
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| EMP_REC.DINFO.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : '|| EMP_REC.DINFO.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : '|| EMP_REC.DINFO.LOC);
            
END;
/

--�÷��� : �ڷ����� ���� ���� ������ ���� (�迭, LIST...)
--�����迭, ��ø���̺�, varray

--�����迭 : KEY, VALUE 

DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    
    TEXT_ARR ITAB_EX;
BEGIN
    TEXT_ARR(1) := '1ST DATA';
    TEXT_ARR(2) := '2ST DATA';
    TEXT_ARR(3) := '3ST DATA';
    TEXT_ARR(4) := '4ST DATA';
    
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(1) : ' || TEXT_ARR(1));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(2) : ' || TEXT_ARR(2));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(3) : ' || TEXT_ARR(3));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(4) : ' || TEXT_ARR(4));
END;
/

--���ڵ带 Ȱ���� �����迭
DECLARE
    --���ڵ� ����:���� �ٸ�Ÿ���� �ѹ��� ������� ���
   TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE
     );
     --�����迭 ����
     --INT ARR[]={}, ACCOUNT ARR[]
   TYPE ITAB_DEPT IS TABLE OF REC_DEPT INDEX BY PLS_INTEGER;
   
   DEPT_ARR ITAB_DEPT;
   IDX PLS_INTEGER :=0;
BEGIN
    FOR I IN(SELECT DEPTNO, DNAME FROM DEPT) LOOP
        IDX := IDX +1;
        DEPT_ARR(IDX).DEPTNO := I.DEPTNO;
        DEPT_ARR(IDX).DNAME := I.DNAME;
        
        DBMS_OUTPUT.PUT_LINE(DEPT_ARR(IDX).DEPTNO || ' : ' || DEPT_ARR(IDX).DNAME);
    END LOOP;
END;
/

--�÷��� �޼��� ����ϱ�
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    
    TEXT_ARR ITAB_EX;
BEGIN
    TEXT_ARR(1) := '1ST DATA';
    TEXT_ARR(2) := '2ST DATA';
    TEXT_ARR(3) := '3ST DATA';
    TEXT_ARR(50) := '50ST DATA';
    --COUNT :��ü����, FIRST : ù��° ��, LAST :��������, PRIOR: 50�� ���ʿ� �ִ� ��,NEXT: 50�� ������ �ִ� ��
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.COUNT : ' || TEXT_ARR.COUNT); 
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.FIRST : ' || TEXT_ARR.FIRST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.LAST : ' || TEXT_ARR.LAST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.PRIOR(50) : ' || TEXT_ARR.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.NEXT(50) : ' || TEXT_ARR.NEXT(50));
END;
/
--�ǽ�
--EMP ���̺�� ���� �� ������ ������ �� ���̺� EMP_RECORD�� �����ϴ� SQL�� �ۼ�
--EMP_RECORD ���̺� ���ڵ带 ����Ͽ� ���ο� ��� ������ ������ ���� �����ϴ� PL/SQL �� �ۼ�

--���̺� ����(DEPT ���̺� ����)
CREATE TABLE EMP_RECORD 
AS SELECT * FROM EMP
WHERE 1<>1;

DECLARE
    TYPE EMP_RECORD IS RECORD(
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        JOB EMP.JOB%TYPE,
        MGR EMP.MGR%TYPE,
        HIREDATE EMP.HIREDATE%TYPE,
        SAL EMP.SAL%TYPE,
        COMM EMP.COMM%TYPE,
        DEPTNO EMP.DEPTNO%TYPE
    );
    EMP_REC EMP_RECORD;
BEGIN
    EMP_REC.EMPNO := 6699;
    EMP_REC.ENAME := 'JOHN';
    EMP_REC.JOB := 'SALESMAN';
    EMP_REC.MGR := 7902;
    EMP_REC.HIREDATE:='07/11/05';
    EMP_REC.SAL :=1500;
    EMP_REC.COMM :=NULL;
    EMP_REC.DEPTNO :=10;
    INSERT INTO EMP_RECORD VALUES EMP_REC;
END;
/
SELECT * FROM EMP_RECORD;

--�ǽ�2:EMP ���̺��� �����ϴ� ��� ���� ������ �� �ִ� ���ڵ带 Ȱ���Ͽ� ���� �迭�� �ۼ��� ����
--EMP%ROWTYPE : ���������� �ҷ�����
DECLARE
   TYPE ITAB_EMP IS TABLE OF EMP%ROWTYPE INDEX BY PLS_INTEGER;
   
   EMP_ARR ITAB_EMP;
   IDX PLS_INTEGER :=0;
BEGIN
    FOR I IN(SELECT * FROM EMP) LOOP
        IDX := IDX +1;
        EMP_ARR(IDX).EMPNO := I.EMPNO;
        EMP_ARR(IDX).ENAME := I.ENAME;
        EMP_ARR(IDX).JOB := I.JOB;
        EMP_ARR(IDX).MGR := I.MGR;
        EMP_ARR(IDX).HIREDATE := I.HIREDATE;
        EMP_ARR(IDX).SAL := I.SAL;
        EMP_ARR(IDX).COMM := I.COMM;
        EMP_ARR(IDX).DEPTNO := I.DEPTNO;
        
        DBMS_OUTPUT.PUT_LINE(EMP_ARR(IDX).EMPNO ||':'|| EMP_ARR(IDX).ENAME ||':'||
        EMP_ARR(IDX).JOB ||':'|| EMP_ARR(IDX).MGR ||':'||EMP_ARR(IDX).HIREDATE ||':'||
        EMP_ARR(IDX).SAL ||':'||EMP_ARR(IDX).COMM||':'||EMP_ARR(IDX).DEPTNO);
    END LOOP;
END;
/

--Ŀ�� : SQL�� ����� ����� ������ �޸� ����(PRIVATE SQL AREA)�� ������
-- ���� �� �����͸� �����ϴ� Ŀ��
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --����� Ŀ�� ����
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = 40;
BEGIN
    --Ŀ������
    OPEN C1;
    
    --Ŀ���κ��� �о�� ������ ���(FETCH)
    FETCH C1 INTO V_DEPT_ROW;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    
    --Ŀ�� �ݱ�
    CLOSE C1;
END;
/

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;

BEGIN
        SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
        FROM DEPT
        WHERE DEPTNO = 40;

    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);

END;
/

--���� ���� ��ȸ�Ǵ� ��� Ŀ��
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --����� Ŀ�� ����
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
BEGIN
    --Ŀ������
    OPEN C1;
    
    LOOP
        --Ŀ���κ��� �о�� ������ ���(FETCH)
        FETCH C1 INTO V_DEPT_ROW;
        
        --Ŀ���� ��� ���� �о���� ���� ����
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);

    END LOOP;
    --Ŀ�� �ݱ�
    CLOSE C1;
END;
/
--FOR���� ����� Ŀ��
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --����� Ŀ�� ����
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
BEGIN
    --Ŀ�� FOR LOOP ����(�ڵ� OPEN, FETCH, CLOSE)
    FOR C1_REC IN C1 LOOP
  
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || C1_REC.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || C1_REC.LOC);
    END LOOP;
END;
/

--Ŀ���� �Ķ���� ���
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --����� Ŀ�� ����
    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = P_DEPTNO;
BEGIN
    --Ŀ������
    OPEN C1(10);
        LOOP
            --Ŀ���κ��� �о�� ������ ���(FETCH)
            FETCH C1 INTO V_DEPT_ROW;            
            --Ŀ���� ��� ���� �о���� ���� ����
            EXIT WHEN C1%NOTFOUND;            
            DBMS_OUTPUT.PUT_LINE('10���μ� DEPTNO : ' || V_DEPT_ROW.DEPTNO
            ||'DNAME : ' || V_DEPT_ROW.DNAME||'LOC : ' || V_DEPT_ROW.LOC);
    
        END LOOP;
    --Ŀ�� �ݱ�
    CLOSE C1;
        OPEN C1(20);
        LOOP
            --Ŀ���κ��� �о�� ������ ���(FETCH)
            FETCH C1 INTO V_DEPT_ROW;            
            --Ŀ���� ��� ���� �о���� ���� ����
            EXIT WHEN C1%NOTFOUND;            
            DBMS_OUTPUT.PUT_LINE('20���μ� DEPTNO : ' || V_DEPT_ROW.DEPTNO
            ||'DNAME : ' || V_DEPT_ROW.DNAME||'LOC : ' || V_DEPT_ROW.LOC);
        END LOOP;
    --Ŀ�� �ݱ�
    CLOSE C1;
END;
/
DECLARE
    --����ڰ� �Է��� �μ���ȣ�� �����ϴ� ����
    V_DEPTNO DEPT.DEPTNO%TYPE;
     --����� Ŀ�� ����
    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT WHERE DEPTNO = P_DEPTNO;
BEGIN
    V_DEPTNO := &INPUT_DEPTNO;
     --Ŀ�� FOR LOOP ����(�ڵ� OPEN, FETCH, CLOSE)
    FOR C1_REC IN C1(V_DEPTNO) LOOP
         DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO ||
        'DNAME : ' || C1_REC.DNAME||'LOC : ' || C1_REC.LOC);
    END LOOP;
END;
/

--������ Ŀ�� : Ŀ�� ����� �������� ����(DML ��ɾ SELECT INTO ����� �� �ڵ����� ���� �� ó��)
BEGIN
    UPDATE dept_record SET DNAME = 'DATABASE'
    WHERE DEPTNO=50;
    
    DBMS_OUTPUT.PUT_LINE('���ŵ� ���� �� : ' || SQL%ROWCOUNT);
    
    IF(SQL%FOUND) THEN
      DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : TRUE');
    ELSE
      DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : FALSE');
    END IF;
    
    IF(SQL%ISOPEN) THEN
      DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : TRUE');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : FALSE');
    END IF;    
    
END;
/
--����(����)
--������ ����/��Ÿ�� ����
SET SERVEROUTPUT ON;
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
        WHERE DEPTNO=10;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('����ó�� - ��ġ �Ǵ� �� ���� �߻�');
END;
/

--��������(INTERRAL EXCEPTION(���ο���) / USER-DEFINED EXCEPTION (��������ǿ���))
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
        WHERE DEPTNO=10;
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('����ó�� - �䱸���� ���� �� ���� ���� �߻�');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('����ó�� - ��ġ �Ǵ� �� ���� �߻�');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('����ó�� - ���� ���� �� ���� �߻�');
END;
/

DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
        WHERE DEPTNO=10;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('����ó�� - ���� ���� �� ���� �߻�');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE)); --SQL CODE(������ȣ)
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);--SQLERRM(�����޼���)
END;
/
--�ǽ�:����� Ŀ���� ����Ͽ� EMP ���̺��� ��ü �����͸� ��ȸȯ �� Ŀ�� ���� �����Ͱ� ������ ���� 
--��µǵ��� PL/SQL�� �ۼ��ϱ�
--1.LOOP�� ����� ���
--2.FOR LOOP�� ����� ���

--1.LOOP ����� ���
DECLARE 
    --Ŀ�� �����Ͱ� �Էµ� ���� ����
    V_EMP_ROW EMP%ROWTYPE;
    --Ŀ�� ����
    CURSOR C1 IS
        SELECT *  FROM EMP;
BEGIN
    --Ŀ������
    OPEN C1;
    LOOP
    --Ŀ���κ��� �о�� ������ ���
    FETCH C1 INTO V_EMP_ROW;
    --Ŀ���� ��� ���� �о���� ���� �Ӽ� ����
    EXIT WHEN C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP_ROW.EMPNO ||
        ' ENAME : ' || V_EMP_ROW.ENAME || ' JOB : ' || V_EMP_ROW.JOB ||
        ' SAL : ' || V_EMP_ROW.SAL || ' DEPTNO : ' || V_EMP_ROW.DEPTNO);
    END LOOP;
    --Ŀ���ݱ�
    CLOSE C1;
END;
/
--2.FOR�����
DECLARE 
    --Ŀ�� ����
    CURSOR C1 IS
        SELECT *  FROM EMP;
BEGIN
   FOR C1_REC IN C1 LOOP
   
        DBMS_OUTPUT.PUT_LINE('EMPNO : ' || C1_REC.EMPNO ||
        ' ENAME : ' || C1_REC.ENAME || ' JOB : ' ||C1_REC.JOB ||
        ' SAL : ' || C1_REC.SAL || ' DEPTNO : ' || C1_REC.DEPTNO);
    END LOOP;
END;
/
--���±����� �͸�� : �̸� ����, ������ �� ����, ������ ������ ������, ���� �Ұ�, �ٸ� �������α׷����� ȣ�� �ȵ�
--���� ���� ���α׷� : �̸� ����, ���尡��, �����Ҷ� �ѹ��� ������, ��������, ȣ�� ����
--1.���� ���ν��� ����
CREATE OR REPLACE PROCEDURE PRO_NOPARAM --�� �̸��� ���ٸ� �����ϴ� ����
IS 
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

--�����Ѱ� ȣ���Ҷ�
EXECUTE PRO_NOPARAM;

--PL/SQL ��Ͽ��� ���ν��� �����Ϸ���
BEGIN
    pro_noparam;
END;
/

--���ν��� �����ϱ�
DROP PROCEDURE PRO_NOPARAM;

--���ν����� �Ķ���� ����(�Ű��� ������ ����) : IN, OUT, IN OUT
--IN�Ķ����(�⺻��)
CREATE OR REPLACE PROCEDURE PRO_NOPARAM_IN --�� �̸��� ���ٸ� �����ϴ� ����
(
    PARAM1 IN NUMBER,
    PARAM2 NUMBER,
    PARAM3 NUMBER :=3,
    PARAM4 NUMBER DEFAULT 2
)
IS 
BEGIN
    DBMS_OUTPUT.PUT_LINE('PARAM1 : ' || PARAM1);
    DBMS_OUTPUT.PUT_LINE('PARAM2 : ' || PARAM2);
    DBMS_OUTPUT.PUT_LINE('PARAM3 : ' || PARAM3);
    DBMS_OUTPUT.PUT_LINE('PARAM4 : ' || PARAM4);
END;
/

EXECUTE PRO_NOPARAM_IN(1,2,7,8);
--3.4���� �̹� �⺻���� �ԷµǾ� �ֱ� ������ �����߻� X
EXECUTE PRO_NOPARAM_IN(1,2); 
--���� ���� ����
EXECUTE PRO_NOPARAM_IN(1);

--OUT ��� �Ķ����(���ν��� ���� �� ȣ���� ���α׷����� �� ��ȯ)
CREATE OR REPLACE PROCEDURE PRO_PARAM_OUT
(
    IN_EMPNO IN EMP.EMPNO%TYPE,
    OUT_ENAME OUT EMP.ENAME%TYPE,
    OUT_SAL OUT EMP.SAL%TYPE
)
IS
BEGIN
    SELECT ENAME, SAL INTO OUT_ENAME, OUT_SAL
    FROM EMP
    WHERE EMPNO = IN_EMPNO;
END;
/
--�ٸ� PL/SQL ������ ���ν��� ���
DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    PRO_PARAM_OUT(7788,V_ENAME,V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || V_SAL);
END;
/

-- IN OUT ���ν��� : IN, OUT ����� ���ÿ� ����
CREATE OR REPLACE PROCEDURE PRO_PARAM_INOUT
(
    INOUT_NO IN OUT NUMBER
    )
IS
BEGIN
    INOUT_NO := INOUT_NO * 2;
END;
/

--IN OUT ���
DECLARE
    NO NUMBER;
BEGIN
    NO := 5;
    PRO_PARAM_INOUT(NO);
    DBMS_OUTPUT.PUT_LINE('NO : ' || NO);
END;
/

--JAVADB���� ����
CREATE OR REPLACE PROCEDURE REGISTER_USER
(
    NAME NVARCHAR2,
    YEAR NUMBER,
    ADDR NCHAR,
    MOBILE NVARCHAR2
)
IS
BEGIN
    INSERT INTO USERTBL(NO, USERNAME, BIRTHYEAR, ADDR, MOBILE)
    VALUES(USERTBL_SEQ.NEXTVAL, NAME, YEAR, ADDR, MOBILE);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(NAME || YEAR || ADDR || MOBILE);
END;
/

EXECUTE REGISTER_USER('������','1196','�λ�','010-1234-4567');
select * from usertbl;

--�ǽ�: ���ν��� ���� (SCOTT�� ����)
--1. DEPT ���̺��� �μ���ȣ(DEPTNO)�� �Է� ������ ���� �� �μ���ȣ(DEPTNO), �μ��̸�(DNAME),����(LOC)�� ����ϴ�
--���ν��� PRO_DEPT_IN �ۼ�

CREATE OR REPLACE PROCEDURE PRO_DEPT_IN
(
    INOUT_DEPTNO IN OUT DEPT.DEPTNO%TYPE,
    OUT_DNAME OUT DEPT.DNAME%TYPE,
    OUT_LOC OUT DEPT.LOC%TYPE
)
IS
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO INOUT_DEPTNO, OUT_DNAME, OUT_LOC
    FROM DEPT
    WHERE DEPTNO = INOUT_DEPTNO;
END;
/

--�ǽ�2. PL/SQL
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE;
    V_DNAME DEPT.DNAME%TYPE;
    V_LOC DEPT.LOC%TYPE;
BEGIN
    V_DEPTNO := 10;
    PRO_DEPT_IN(V_DEPTNO,V_DNAME,V_LOC);
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || V_DEPTNO);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || V_DNAME);
    DBMS_OUTPUT.PUT_LINE('���� : ' || V_LOC);
END;
/

--Ʈ���� : �����ͺ��̽� ���� Ư����Ȳ�̳� ����, �� �̺�Ʈ�� �߻��� �� �ڵ����� �����Ű�� ���

--BEFORE Ʈ���� 
--Ʈ���Ÿ� ������ ���̺� ����
CREATE TABLE EMP_TRG AS SELECT * FROM EMP;

--EMP_TRG�� DML����(��ǻ�ͻ� ��¥�� �ָ��̶�� ��������� ���� �Ұ�) ���� Ʈ���� �߻���Ű��
--RAISE_APPLICATION_ERROR : ����� ���� ����
--���������ڵ�� -20000~20999 ������ ���ڸ� ���
CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
BEFORE
--EMP_TRG�� Ʈ���� ����
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('��','��') THEN
        IF INSERTING THEN
        RAISE_APPLICATION_ERROR(-20000,'�ָ� ������� �߰� �Ұ�');
        ELSIF UPDATING THEN
            RAISE_APPLICATION_ERROR(-20001,'�ָ� ������� ���� �Ұ�');
        ELSIF DELETING THEN
            RAISE_APPLICATION_ERROR(-20002,'�ָ� ������� ���� �Ұ�');
        ELSE
            RAISE_APPLICATION_ERROR(-20003,'�ָ� ������� ���� �Ұ�');
        END IF;
    END IF;
END;
/

SELECT * FROM EMP_TRG;

UPDATE EMP_TRG
SET SAL = 3000
WHERE EMPNO=7788;

--Ʈ���� : AFTER
--EMP_TRG ���̺� DML ��ɾ ����� ��� ���̺� ����� DML ��ɾ��� 
--����, DML�� �����Ų �����, DML ��ɾ ����� ��¥�� �ð� ����
--Ʈ���� �߻��� LOG��� �����
CREATE TABLE EMP_TRG_LOG(
    TABLENAME VARCHAR2(10),
    DML_TYPE VARCHAR2(10),
    EMPNO NUMBER(4),
    USER_NAME VARCHAR2(30),
    CHANGE_DATE DATE);

CREATE OR REPLACE TRIGGER TRG_EMP_LOG
AFTER
INSERT OR DELETE OR UPDATE ON EMP_TRG
FOR EACH ROW --DML ���忡 ���� ����޴� �ະ�� ����

BEGIN
    IF INSERTING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'INSERT', :NEW.EMPNO, 
        --SYSCONTEXT:���� �����ͺ��̽� ������
        SYS_CONTEXT('USERENV','SESSION_USER'),SYSDATE); 
    ELSIF UPDATING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'UPDATE', :OLD.EMPNO, 
        SYS_CONTEXT('USERENV','SESSION_USER'),SYSDATE);       
    ELSIF DELETING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'DELETE', :OLD.EMPNO, 
        SYS_CONTEXT('USERENV','SESSION_USER'),SYSDATE);     
    END IF;
END;
/

INSERT INTO EMP_TRG VALUES(9990, 'TESTEMP','CLERK',7788,TO_DATE('2018-03-03','YYYY-MM-DD'),
                        1200,NULL,20);
                        
SELECT * FROM EMP_TRG;
SELECT * FROM EMP_TRG_LOG;

UPDATE EMP_TRG
SET SAL =1300
WHERE MGR =7788;


--Ʈ���� ��ȸ
SELECT *
FROM USER_TRIGGERS;

--Ʈ���� ����
DROP TRIGGER TRG_EMP_LOG;

--Ʈ���� ���� (��� ��Ȱ��ȭ ��Ű��) ENABLE OR DISABLE
ALTER TRIGGER TRG_EMP_NODML_WEEKEND DISABLE;

