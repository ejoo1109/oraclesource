CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

--JOB이 MANAGER인 데이터 삭제하기
DELETE FROM EMP_TEMP2 WHERE JOB='MANAGER';

ROLLBACK;

DELETE EMP_TEMP2;

--EMP_TEMP2 테이블의 사원 중에서 급여가 5000 이상인 사원 삭제

DELETE FROM EMP_TEMP2 WHERE SAL >=5000;

--급여등급이 3등급 사이에 있는 30번 부서의 사원들만 삭제
DELETE FROM EMP_TEMP2 WHERE EMPNO IN (SELECT E.EMPNO FROM EMP_TEMP2 E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 3 AND DEPTNO=30);
ROLLBACK;
--DELETE FROM EMP_EMP2 WHERE EMPNO IN (7001,7002,7003);

--실습1) 실습을 위하여 기존 테이블을 이용하여 테이블을 생성한다.
--① EMP 테이블의 내용을 이용하여 EXAM_EMP 생성
--② DEPT 테이블의 내용을 이용하여 EXAM_DEPT 생성
--③ SALGRADE 테이블의 내용을 이용하여 EXAM_SALGRADE 생성


CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

--실습2) 다음의 정보를 EXAM_EMP 테이블에 입력하시오.
INSERT INTO EXAM_EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50);
INSERT INTO EXAM_EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50);
INSERT INTO EXAM_EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL,60);
INSERT INTO EXAM_EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60);
INSERT INTO EXAM_EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7205,'TEST_USER5','CLERK',7201,'2016-07-201',2600,NULL,70);
INSERT INTO EXAM_EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL,70);
INSERT INTO EXAM_EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL,80);
INSERT INTO EXAM_EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,NULL,80);

SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO FROM EXAM_EMP;

--실습3) EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다 
--많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL 문 작성하기
UPDATE EXAM_EMP
SET DEPTNO =70
WHERE SAL > (SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO=50);

--실습4)EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 
--늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는 SQL 문 작성하기
UPDATE EXAM_EMP
SET SAL = SAL*1.1,DEPTNO=80
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO=60);

--실습5)EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
DELETE FROM EXAM_EMP WHERE  EMPNO IN (SELECT EMPNO FROM EXAM_EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=5);

SELECT * FROM EXAM_EMP;

