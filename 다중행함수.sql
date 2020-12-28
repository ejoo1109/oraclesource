--SUM : 합계
SELECT sum(sal), sum(distinct sal), sum(all sal) from emp;
--distrinct sal에 중복된 숫자 제거하고 합계
--count : 개수 emp 테이블에 개수가 알고싶을때
select count(*) from emp;

--부서 번호가 30번인 직원수 구하기
select count(*) from emp where deptno=30;

SELECT count(sal), count(distinct sal), count(all sal) from emp;

--max(최대값), min(최소값)
select max(sal), min(sal) from emp;

--부서번호가 20인 사원의 입사일 중 가장 최근 입사일 구하기
select max(hiredate) from emp where deptno=20;

-- avg : 평균 average
select avg(sal) from emp;
select avg(sal) from emp where deptno=30;
select avg(distinct sal) from emp;

--GROUP BY 부서별 월급의 평균을 알고 싶다면?
select avg(sal) from emp where deptno=30;
select avg(sal) from emp where deptno=20;
select avg(sal) from emp where deptno=10;

--GROUP BY: 결과값을 원하는 열로 묶어 출력
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY deptno;

--부서번호별 추가수당 평균 구하기
SELECT DEPTNO, AVG(COMM) FROM EMP GROUP BY DEPTNO;

--부서번호, 직책별 급여의 평균 구하기
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;

--GROUP BY 절에 포함 안되는 열을 select에 포함하면 안됨 ex)이름
SELECT ename, deptno, avg(sal)
from emp
group by deptno;

--HAVING : GROUP BY 절에 조건을 줄 때 사용
--각 부서의 직책별 평균 급여를 구하되 그 평균 급여가 2000이상인 그룹만 출력
SELECT DEPTNO,JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--emp 테이블의 부서별 직책의 평균 급여가 500이상인 사원들의
--부서번호, 직책, 부서별 직책의 평균 급여 출력
select deptno, job, avg(sal)
from emp
group by deptno, job having avg(sal) >=500;

select deptno, job, avg(sal)
from emp
where sal <=3000
group by deptno, job having avg(sal) >=2000
order by deptno;

--실습1)
select deptno, trunc(avg(sal))as avg_sal, max(sal) as max_sal,min(sal) as min_sal,
count(deptno) as cnt
from emp
group by deptno;

--실습2)
select job,count(job)
from emp
group by job having count(job) >= 3;

--실습3)
select TO_CHAR(hiredate,'yyyy')as hire_year, deptno,
       count(TO_CHAR(hiredate,'yyyy')) as HIRE_YEAR
from emp
group by deptno,TO_CHAR(hiredate,'yyyy')
order by TO_CHAR(hiredate,'yyyy') desc;

--조인
--나올 수 있는 모든 조합을 조회
SELECT * FROM EMP,DEPT ORDER BY EMPNO;
SELECT COUNT(*) FROM EMP, DEPT ORDER BY EMPNO;--56행
SELECT * FROM DEPT; --4행
SELECT * FROM EMP; --14행
--1)내부조인(등가조인) 2가지방법
SELECT *
FROM EMP,DEPT
WHERE EMP.DEPTNO= DEPT.DEPTNO --조인의 기준
ORDER BY EMPNO;

SELECT *
FROM EMP E,DEPT D --별칭선언
WHERE E.DEPTNO = D.DEPTNO --조인의 기준
ORDER BY EMPNO;

SELECT *
FROM EMP E INNER JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO --조인의 기준
ORDER BY EMPNO;

--두 테이블에 같은 이름의 필드가 존재하는 경우
--어느 테이블에 있는 필드를 가지고 올것인지 정확히 명시
SELECT EMPNO, ENAME, JOB,D.DEPTNO, DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO= D.DEPTNO --조인의 기준
ORDER BY EMPNO;

--EMP 테이블과 DEPT 테이블을 조인하여 EMPNO,ENAME,SAL,DEPTNO,
--DNAME, LOC를 조회한다.단, 급여가 3000 이상인 사원만 출력
SELECT E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = d.deptno AND SAL>=3000;

--EMP 테이블의 별칭을 E로, DEPT테이블 별칭을 D로 하여
--급여가 2500이하이고, 사원번호가 9999이하인 사원의 정보를 출력
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL<=2500 AND E.EMPNO <= 9999;

--EMP 테이블의 별칭을 E로, SALGRADE 테이블 별칭을 S로 하여
--각 사원의 정보와 더불어 사원의 등급정보를 출력
SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--2)셀프조인(자체조인) : 조인 테이블이 자기 자신 테이블일때
SELECT * FROM EMP;
SELECT E1.EMPNO, E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1,EMP E2
WHERE E1.MGR = E2.EMPNO;

--OUTER JOIN (외부조인) : 조건을 만족하지 않는 데이터 추출
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

--실습1) 급여가 2000초과인 사원들의 부서 정보, 사원정보를 아래와 같이 출력
SELECT E.DEPTNO,D.DNAME,E.EMPNO,E.ENAME ,E.SAL
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL > 2000 ORDER BY E.DEPTNO;

SELECT E.DEPTNO,D.DNAME,E.EMPNO,E.ENAME ,E.SAL
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 
WHERE E.SAL > 2000 ORDER BY E.DEPTNO;

--실습2) 각 부서별 평균 급여, 최대급여, 최소급여, 사원수를 출력하는 SQL문을 작성
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
--실습3) 모든 부서정보와 사원 정보를 부서번호, 사원이름 순으로 정렬하여 출력
SELECT D.DEPTNO, D.DNAME, E.EMPNO,E.ENAME,E.JOB,E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO;
--실습4) 모든 부서정보와 사원정보, 급여등급정보, 각 사원의 직속상관의 정보부서번호
--사원번호 순으로 정렬하여 출력
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

