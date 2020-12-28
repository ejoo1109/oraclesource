--������ �޿����� ���� �޿��� �޴� ������� ���
--������ �޿� �˾Ƴ���
SELECT SAL FROM EMP WHERE ENAME='JONES';

--���� �޿���� ����ϱ�
SELECT * FROM EMP WHERE SAL > 2975;
--��������:������ �ȿ� �ٸ� �������� �����ϰ� �ִ� ����
--������ ��������:�÷������ �ϳ��� ������ ������ ��� >,<,=,<=,>=,��������: <>,^=,!=
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='JONES');

--����̸��� ALLEN�� ����� �߰����纸�� ���� �޴� ����� ���
SELECT * FROM EMP WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME='ALLEN');

--����̸��� WARD�� ����� �Ի��Ϻ��� ���� �Ի��� ����� ���
SELECT * FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME='WARD');

--20�� �μ��� ���� ��� �� ��ü����� ��� �޿����� ���� �޿��� �޴� ������
SELECT *
FROM EMP
WHERE DEPTNO = 20 AND SAL > (SELECT AVG(SAL) FROM EMP);

--20�� �μ��� ���� ��� �� ��ü����� ��� �޿����� ���� �޿��� �޴� ����� ���� ���
--�μ���, ������ġ ���
SELECT E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 20 AND SAL > (SELECT AVG(SAL) FROM EMP);

--������ ��������
--�������� ����� 2���̻� ������ ����� ������ ���������� ������ ���Ұ�
--������ �������ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
--SELECT * FROM EMP WHERE SAL >= (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO); (X)
SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

--IN
SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--ANY(SOME)
-- = ANY : IN�� �������� ���� ����, ��, IN�� �� ���� �����
SELECT * FROM EMP WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * FROM EMP WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM EMP WHERE SAL < ANY (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

SELECT * FROM EMP WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);

--30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM EMP WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);

--ALL : ���� ������ ����� ��� �����ϴ� ���������� �����Ҷ�
--�μ���ȣ�� 30���� ������� �ּ� �޿����� �� ���� �޿��� �޴»�����
SELECT * FROM EMP WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

--EXISTS : IN�� ����� ����, �� IN���� ������ �����
--�������� ����� �����ϸ� �������� ����� ���
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=20);
SELECT * FROM EMP WHERE NOT EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=20);

SELECT EMPNO, DEPTNO
FROM EMP
WHERE EXISTS (SELECT DEPTNO FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO=DEPT.DEPTNO);

SELECT EMPNO, DEPTNO
FROM EMP
WHERE NOT EXISTS (SELECT DEPTNO FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO=DEPT.DEPTNO);

--�ǽ�1)��ü ��� �� ALLEN�� ���� ��å�� ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT E.JOB,E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO AND e.job IN (SELECT JOB FROM EMP WHERE ENAME='ALLEN');

--�ǽ�2)��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �������, �μ�����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�
--(��, ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϱ�)
SELECT E.EMPNO,E.ENAME,D.DEPTNO, E.HIREDATE,D.LOC,E.SAL,S.GRADE
FROM EMP E, SALGRADE S , DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;

--���� �� �������� : ���������� SELECT ���� ���� �÷��� ������ ������ ���
SELECT * FROM EMP WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

--FROM���� ����ϴ� ��������(�ζ��� ��)
SELECT E.EMPNO, E.ENAME,D.DEPTNO,D.DNAME,D.LOC
FROM(SELECT * FROM EMP WHERE DEPTNO=10) E,(SELECT * FROM DEPT) D
WHERE E.DEPTNO = D.DEPTNO;

--SELECT ���� ����ϴ� �������� -��Į�� ��������

--�ǽ�1)10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� �������, 
--�μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT E.EMPNO, E.ENAME,E.JOB,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.JOB NOT IN (SELECT DISTINCT JOB FROM EMP WHERE DEPTNO=30)
AND E.DEPTNO=10;

--�ǽ�2)��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������, �޿���� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�
--(��, ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� 
--�����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.)
SELECT EMPNO,ENAME,SAL,(SELECT GRADE FROM SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL) AS GRADE
FROM EMP
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');

SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB='SALESMAN');