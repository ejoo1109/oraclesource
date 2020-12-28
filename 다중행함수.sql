--SUM : �հ�
SELECT sum(sal), sum(distinct sal), sum(all sal) from emp;
--distrinct sal�� �ߺ��� ���� �����ϰ� �հ�
--count : ���� emp ���̺� ������ �˰������
select count(*) from emp;

--�μ� ��ȣ�� 30���� ������ ���ϱ�
select count(*) from emp where deptno=30;

SELECT count(sal), count(distinct sal), count(all sal) from emp;

--max(�ִ밪), min(�ּҰ�)
select max(sal), min(sal) from emp;

--�μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ�
select max(hiredate) from emp where deptno=20;

-- avg : ��� average
select avg(sal) from emp;
select avg(sal) from emp where deptno=30;
select avg(distinct sal) from emp;

--GROUP BY �μ��� ������ ����� �˰� �ʹٸ�?
select avg(sal) from emp where deptno=30;
select avg(sal) from emp where deptno=20;
select avg(sal) from emp where deptno=10;

--GROUP BY: ������� ���ϴ� ���� ���� ���
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY deptno;

--�μ���ȣ�� �߰����� ��� ���ϱ�
SELECT DEPTNO, AVG(COMM) FROM EMP GROUP BY DEPTNO;

--�μ���ȣ, ��å�� �޿��� ��� ���ϱ�
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;

--GROUP BY ���� ���� �ȵǴ� ���� select�� �����ϸ� �ȵ� ex)�̸�
SELECT ename, deptno, avg(sal)
from emp
group by deptno;

--HAVING : GROUP BY ���� ������ �� �� ���
--�� �μ��� ��å�� ��� �޿��� ���ϵ� �� ��� �޿��� 2000�̻��� �׷츸 ���
SELECT DEPTNO,JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--emp ���̺��� �μ��� ��å�� ��� �޿��� 500�̻��� �������
--�μ���ȣ, ��å, �μ��� ��å�� ��� �޿� ���
select deptno, job, avg(sal)
from emp
group by deptno, job having avg(sal) >=500;

select deptno, job, avg(sal)
from emp
where sal <=3000
group by deptno, job having avg(sal) >=2000
order by deptno;

--�ǽ�1)
select deptno, trunc(avg(sal))as avg_sal, max(sal) as max_sal,min(sal) as min_sal,
count(deptno) as cnt
from emp
group by deptno;

--�ǽ�2)
select job,count(job)
from emp
group by job having count(job) >= 3;

--�ǽ�3)
select TO_CHAR(hiredate,'yyyy')as hire_year, deptno,
       count(TO_CHAR(hiredate,'yyyy')) as HIRE_YEAR
from emp
group by deptno,TO_CHAR(hiredate,'yyyy')
order by TO_CHAR(hiredate,'yyyy') desc;

--����
--���� �� �ִ� ��� ������ ��ȸ
SELECT * FROM EMP,DEPT ORDER BY EMPNO;
SELECT COUNT(*) FROM EMP, DEPT ORDER BY EMPNO;--56��
SELECT * FROM DEPT; --4��
SELECT * FROM EMP; --14��
--1)��������(�����) 2�������
SELECT *
FROM EMP,DEPT
WHERE EMP.DEPTNO= DEPT.DEPTNO --������ ����
ORDER BY EMPNO;

SELECT *
FROM EMP E,DEPT D --��Ī����
WHERE E.DEPTNO = D.DEPTNO --������ ����
ORDER BY EMPNO;

SELECT *
FROM EMP E INNER JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO --������ ����
ORDER BY EMPNO;

--�� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
--��� ���̺� �ִ� �ʵ带 ������ �ð����� ��Ȯ�� ���
SELECT EMPNO, ENAME, JOB,D.DEPTNO, DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO= D.DEPTNO --������ ����
ORDER BY EMPNO;

--EMP ���̺�� DEPT ���̺��� �����Ͽ� EMPNO,ENAME,SAL,DEPTNO,
--DNAME, LOC�� ��ȸ�Ѵ�.��, �޿��� 3000 �̻��� ����� ���
SELECT E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = d.deptno AND SAL>=3000;

--EMP ���̺��� ��Ī�� E��, DEPT���̺� ��Ī�� D�� �Ͽ�
--�޿��� 2500�����̰�, �����ȣ�� 9999������ ����� ������ ���
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL<=2500 AND E.EMPNO <= 9999;

--EMP ���̺��� ��Ī�� E��, SALGRADE ���̺� ��Ī�� S�� �Ͽ�
--�� ����� ������ ���Ҿ� ����� ��������� ���
SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--2)��������(��ü����) : ���� ���̺��� �ڱ� �ڽ� ���̺��϶�
SELECT * FROM EMP;
SELECT E1.EMPNO, E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1,EMP E2
WHERE E1.MGR = E2.EMPNO;

--OUTER JOIN (�ܺ�����) : ������ �������� �ʴ� ������ ����
--1) LEFT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2
ON E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1,EMP E2
WHERE E1.MGR = E2.EMPNO(+);

--2) RIGHT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2
ON E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1,EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

--�ǽ�1) �޿��� 2000�ʰ��� ������� �μ� ����, ��������� �Ʒ��� ���� ���
SELECT E.DEPTNO,D.DNAME,E.EMPNO,E.ENAME ,E.SAL
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL > 2000 ORDER BY E.DEPTNO;

SELECT E.DEPTNO,D.DNAME,E.EMPNO,E.ENAME ,E.SAL
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 
WHERE E.SAL > 2000 ORDER BY E.DEPTNO;

--�ǽ�2) �� �μ��� ��� �޿�, �ִ�޿�, �ּұ޿�, ������� ����ϴ� SQL���� �ۼ�
SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL,
MAX(E.SAL) AS MAX_SAL, MIN(E.SAL)AS MIN_SAL, COUNT(D.DNAME)
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
ORDER BY D.DEPTNO;

SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL,
MAX(E.SAL) AS MAX_SAL,MIN(E.SAL)AS MIN_SAL,COUNT(DNAME)
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
ORDER BY D.DEPTNO;
--�ǽ�3) ��� �μ������� ��� ������ �μ���ȣ, ����̸� ������ �����Ͽ� ���
SELECT D.DEPTNO, D.DNAME, E.EMPNO,E.ENAME,E.JOB,E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO;
--�ǽ�4) ��� �μ������� �������, �޿��������, �� ����� ���ӻ���� �����μ���ȣ
--�����ȣ ������ �����Ͽ� ���
SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO,E1.ENAME,E1.MGR,E1.SAL,E1.DEPTNO,
S.LOSAL,S.HISAL,S.GRADE,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1
RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY D1.DEPTNO, E1.EMPNO;

SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO,E1.ENAME,E1.MGR,E1.SAL,E1.DEPTNO,
S.LOSAL,S.HISAL,S.GRADE,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, DEPT D1, SALGRADE S, EMP E2
WHERE E1.DEPTNO(+)=D1.DEPTNO AND E1.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+) 
AND E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;

