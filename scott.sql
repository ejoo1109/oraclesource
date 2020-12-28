-- scott 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- emp 테이블의 구조를 조회
DESC emp;

-- emp 테이블의 모든 내용 조회
SELECT * FROM emp;

-- emp 테이블의 특정 필드만 조회
SELECT ename, job, sal FROM emp;

--중복 레코드 제거한 후 조회 : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais (별칭): AS -원래 값은 변경되지 않고 출력할때만 변경해서 보여줌
SELECT empno AS 사원번호 FROM emp;

SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as 사원이름, job as "직 책" from emp;

-- ORDER BY : 정렬하여 조회

-- 하나의 열로 기준을 주어 오름차순(ASC) 조회
SELECT ename, sal FROM emp ORDER BY sal;

-- 하나의 열로 기준을 주어 내림차순 조회
SELECT ename, sal FROM emp ORDER BY sal DESC;

--전체 데이터 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

--부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순조회
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

SELECT empno AS EMPLOYEE_NO,ename AS EMPLOYEE_NAME,job, mgr AS MANAGER, 
hiredate,sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

--WHERE : 조회를 할 때 기준 주기
--부서번호가 30번인 사원 조회
SELECT * FROM emp WHERE deptno = 30;

--사원번호가 7782인 사원 조회
SELECT * FROM emp WHERE empno = 7782;

--부서번호가 30이고 사원의 직책이 SALESMAN 정보 조회
--데이터 타입이 VARCHAR 인경우 조회시 ' '로 조회
--두개의 조건일땐 and로 데이터 추가
--두개의 조건이 다를때 OR로 구분
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
--사원번호가 7499이고, 부서번호가 30인 정보조회
SELECT * FROM emp WHERE empno=7499 AND deptno = 30;

--부서번호가 30이거나, 사원 직책이 CLERK 정보 조회
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';
--부서번호가 20이거나, 사원 직책이 SALESMAN 정보 조회
SELECT * FROM emp WHERE deptno= 20 OR job='SALESMAN';

--연산자를 이용한 조회
--산술연산자 : sal*12한 금액이 36000인 데이터 조회
SELECT * FROM emp WHERE sal*12=36000;
--관계연산자: >,<,>=,<=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;
--(알파벳 f보다 뒤)
SELECT * FROM emp WHERE ename >= 'F';
--논리연산자 : AND, OR
--급여가 2500이상이고, 직업이 ANALYST인 사원정보 조회
SELECT * FROM emp WHERE sal>=2500 and job='ANALYST';
--직무가 MANAGER, SALESMAN, CLERK인 사원정보 조회
SELECT * FROM emp WHERE job='MANAGER' or job='SALESMAN' or job='CLERK';

--등가연산자 : 양쪽항목이 같은지 검사 
--SAL이 3000이 아닌 사원정보 출력
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal^=3000;

--IN 연산자
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');
SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

--IN사용해서 부서번호가 10,20번인 사원정보 조회
SELECT *FROM emp WHERE deptno IN(10,20);

--BETWEEN A AND B
--1)급여가 2000이상 3000 이하인 사원정보 조회
SELECT * FROM emp WHERE sal >=2000 and sal<=3000;
SELECT * FROM emp WHERE sal between 2000 and 3000;

--2)급여가 2000이상 3000 이하가 아닌 사원정보 조회
SELECT * FROM emp WHERE sal not between 2000 and 3000;

--LIKE : 문자열 검색 사용(S로 시작하는~,H로 끝나는~,가운데에 T가 있으면)대소문자구분
--1) 사원이름이 S로 시작하는 모든 사원정보 조회하기
SELECT * FROM emp WHERE ename LIKE 'S%'; 

--2) 사원이름의 두번째 글자가 L인 사원만 조회
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) 사원이름의 AM이 포함되어 있는 사원만 조회
SELECT * FROM emp WHERE ename LIKE '%AM%';

--4) 사원이름의 AM이 포함되어 있는 않는 사원만 조회
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

--IS NULL
SELECT * FROM emp WHERE comm = null; (X)
SELECT * FROM emp WHERE comm IS null;

--MGR(매니저ID)이 NULL인 사원정보 조회
SELECT * FROM emp WHERE mgr IS null;
--MGR(매니저ID)이 NULL이 아닌 사원정보 조회
SELECT * FROM emp WHERE mgr IS NOT null;

--집합연산자 : 합집합(UNION), 교집합(INTERSECT), 차집합(MINUS)
--DEPTNO가 10인 테이블과 DEPTNO가 20인 결과를 구해서 합해서 보여주기
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION ALL
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

--부서번호가 10이 아닌 사원들의 정보 조회
SELECT  empno, ename, sal, deptno FROM emp
MINUS
SELECT  empno, ename, sal, deptno FROM emp WHERE deptno=10;

--부서번호가 10인 사원정보 조회
SELECT  empno, ename, sal, deptno FROM emp
INTERSECT
SELECT  empno, ename, sal, deptno FROM emp WHERE deptno=10;

--20,30번 부서에 근무하고 있는 사원 중 SAL이 2000 초과인 사원을 다음 두가지
--방식의 SELECT문을 사용하여, 사원번호, 이름, 급여, 부서번호를 출력하는
--SQL 문 작성하기

--집합연산자 사용하지 않는 방식
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN(20,30) and sal>2000;
--집합연산자를 사용하는 방식
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

--오라클 함수
--1)문자함수 : UPPER, LOWER, INITCAP, LENGTH, LENGTHB
--ename을 upper, lower, initcap으로 변환하여 조회
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

--DUAL 테이블 이용(SYS가 소유하고 있는 테이블로 임시연산이나 함수의 결과값 확인하는 용도)
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

--직책 이름이 6글자 이상인 사원들의 정보 추출
SELECT * FROM emp WHERE length(job) >=6;

--문자열 함수 : substr(몇번째에서,몇개) 1이 기준
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) FROM emp;
-- -LENGTH(job)= -5 (시작위치가 오른쪽기준으로 -1씩 증가)
SELECT job, SUBSTR(job,-LENGTH(job)), SUBSTR(job, -LENGTH(job),2),SUBSTR(job,-3)
FROM emp;
--문자열 함수 : INSTR(특정문자 위치 찾기)
SELECT INSTR('HELLO,ORACLE!','L')AS INSTR_1,
       INSTR('HELLO,ORACLE!','L',5)AS INSTR_2,
       INSTR('HELLO,ORACLE!','L',2,2)AS INSTR_3
FROM dual;

--문자열 함수: REPLACE (찾아서 바꾸기)-조회한 결과만 바꿔서 보여줌
SELECT REPLACE ('이것이 oracle이다','이것이','This is')
FROM dual;
SELECT '010-1234-45678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678','-',' ')AS REPLACE_1,
    REPLACE('010-1234-5678','-')AS REPLACE_2
FROM dual;

--문자열 함수 : CONCAT(연결)
--empno, ename을 연결하여 조회
SELECT CONCAT(empno,ename), CONCAT(empno, CONCAT(':',ename))
FROM emp
WHERE ename='SCOTT';

--|| : 연결의 의미로 사용됨
SELECT empno||ename, empno || ':'||ename
FROM emp
WHERE ename='SCOTT';

--문자열 함수 : TRIM(공백제거), LTRIM(왼쪽공백만제거), RTRIM(오른쪽 공백만제거)
SELECT '    이것이   ',TRIM('    이것이    ')
FROM dual;

--문자열 함수 : REVERSE-거꾸로 출력
SELECT REVERSE('Oracle') FROM dual;

--2.숫자함수 : ROUND(반올림), TRUNC(버림), CEIL(입력된 숫저와 가까운 큰 정수),
--FLOOR(입력된 숫자와 가까운 작은 정수), MOD(나머지)
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

--3.날짜함수 : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

--날짜데이터는 연산이 가능함 : 날짜데이터 + 1,-1,날짜 데이터-날짜데이터
--날짜데이터 + 날짜데이터는 불가
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM dual;

--날짜함수 : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM dual;

--입사10주년이 되는 사원들 조회
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate, 120) FROM emp;

--입사38년 미만인 사원 조회
SELECT* FROM emp WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

--날짜함수 : MONTHS_BETWEEN(두 날짜 사이의 차이)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT empno, ename, hiredate, SYSDATE,MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTH1,
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

--날짜함수 : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE,'월요일'),LAST_DAY(SYSDATE)
FROM dual;

--4.형변환 함수 : TO_CHAR(날짜, 숫자데이터를 문자로 변환), 
--              TO_NUMER(문자데이터를 숫자로 변환)
--               TO_DATE(문자 데이터를 날짜로 변환)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'MM') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'MON') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'DD') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'DAY') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS 현재날짜 FROM dual;

--오늘날짜를 년/월/일/ 24시간으로 표현
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS PM') AS 현재날짜시간 FROM dual;

SELECT 1300-TO_NUMBER('1500'),TO_NUMBER('1300')+1500 FROM dual;
--SELECT 1300-TO_NUMBER('1,300')-TO_NUMBER('1,500') FROM dual;(X)
--TO_NUMBER는 콤마 인식을 못하기 때문에 999,999를 넣어 숫자형 타입을 나타냄
--9,0(숫자의 한자리를 의미함),9빈자리를 채우지 않는형태,0빈자리를 채우는 형태
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

--1981년 6월1일 이후에 입사한 사원정보 조회
SELECT *
FROM emp 
WHERE hiredate > TO_DATE ('1981-06-01','YYYY-MM-DD');

SELECT TO_DATE ('2019-12-20')-TO_DATE('2019-10-20') FROM dual;

--NULL처리 함수 : NVL, NVL2
SELECT empno, ename, sal, comm, sal+comm FROM emp;
SELECT empno, ename, sal, comm, sal+comm, nvl(comm,0),sal+nvl(comm,0)
FROM emp;

SELECT empno, ename, sal, comm, nvl2(comm,'O','X'),
       nvl2(comm,sal*12+comm,sal*12)as annsal
FROM emp;

--DECODE 함수와 CASE문
--job이 manager, salesman,analyst 경우에 각각의 다른 비율을 적용하고 싶다면?
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
                               WHEN COMM IS NULL THEN '해당사항없음'
                               WHEN COMM =0 THEN '수당없음'
                               WHEN COMM >0 THEN '수당 : ' || COMM
                               END AS COMM_TEXT FROM EMP;
                        
--실습1)emp 테이블에서 사원들의 월 평균 근무일수는 21.5일이다. 하루 근무시간을 8시간으로 봤을때 
--사원들의 하루급여(day_pay)와 시급(TIME_PAY)를 계산하여 결과를 출력한다
--단, 하루급여는 소수점 셋째자리에서 버리고 시급은 두번째 소수점에서 반올림한다.

SELECT empno,ename,sal,round((sal/21.5),2)as day_pay,
round((sal/21.5/8),1)as time_pay
from emp;
                
--실습2)emp테이블에서 사원들은 입사일(hiredate)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다
--사원들이 정직원이 되는 날짜(R_JOB)을 YYYY-MM-DD형식으로 아래와 같이 출력하시오
--단, 추가수당(COMM)이 없는 사원의 추가수당은 N/A로 출력하시오
SELECT empno,ename,hiredate,next_day(add_months(hiredate,3),'월요일') as r_job,
nvl(to_char(comm),'n/a')as comm
from emp;

--실습3)
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
                       
--실행 결과를 화면에 출력
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;
/

--변수 선언 : 변수명 타입;
--          변수명 타입 := 값; 
DECLARE
    V_EMPNO NUMBER(4) :=7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_ENAME);
END;
/

--상수;
DECLARE
    V_TAX CONSTANT NUMBER(1) :=3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/
--변수의 기본값 지정
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '|| V_DEPTNO);
END;
/

--변수에 NULL값 저장 막기
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

--자료형
--스칼라형 : 오라클 데이터베이스에서 사용하는 자료형 + Boolean
--참조형 : 다른 테이블의 컬럼 자료형이나, 하나의 행 구조를 참조

--특정 테이블의 컬럼 자료형 참조
DECLARE
-- DEPT 테이블의 DEPTNO 와 같은 자료형 사용
    V_DEPTNO DEPT.DEPTNO%TYPE :=50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

--DEPT 테이블의 구조와 같은 자료형 사용
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

--조건문

--IF
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER,2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER 홀수');
    END IF;
END;
/

--IF ~ ELSE
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER,2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER 홀수');
    ELSE
        DBMS_OUTPUT.PUT_LINE('V_NUMBER 짝수');
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

--반복문

--LOOP : 기본 반복문
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
      DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '|| V_NUM);
      V_NUM := V_NUM+1;
         EXIT WHEN V_NUM > 4; -- 반복문 종료
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER :=0;
BEGIN
     LOOP
      DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '|| V_NUM);
      V_NUM := V_NUM+1;
      IF V_NUM >4 THEN
         EXIT;
         END IF;-- 반복문 종료
    END LOOP;
END;
/

--WHILE
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    WHILE V_NUM < 4 LOOP
      DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '|| V_NUM);
      V_NUM := V_NUM+1;
    END LOOP;
END;
/

--FOR문
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR I IN 0..4 LOOP --시작값..종료값
      DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '|| I);
    END LOOP;
END;
/
--FOR REVERSE
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR I IN REVERSE 0..4 LOOP 
      DBMS_OUTPUT.PUT_LINE('현재 I : '|| I);
    END LOOP;
END;
/
--CONTINUE 다음의 문장을 실행할건지 결정
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR I IN 0..4 LOOP
        CONTINUE WHEN MOD(I,2) = 1;
      DBMS_OUTPUT.PUT_LINE('현재 I : '|| I);
    END LOOP;
END;
/

--[실습] 1~10까지 출력하기
BEGIN
    FOR I IN 0..10 LOOP
      DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/
--[실습] 1~10까지 홀수만 출력
BEGIN
    FOR I IN 0..10 LOOP
        IF I MOD 2=1 THEN
      DBMS_OUTPUT.PUT_LINE(I);
      END IF;
    END LOOP;
END;
/

--[실습]
--DEPT 테이블의 DEPTNO와 자료형이 같은 변수 V_DEPTNO를 선언한다.
--그리고 V_DEPTNO 변수 값에 10,20,30,40을 대입했을 때 다음과 같이 부서
--이름을 출력하는 프로그램을 작성하기, 단, 부서 번호가 10,20,30,40이 아니면 N/A로 출력하기
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
--레코드(자바의 클래스 개념) : 자료형이 각기 다른 데이터를 하나의 변수에 저장
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
--레코드를 사용한 INSERT

--테이블 생성(DEPT 테이블 복사)
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

--업데이트를 통한 INSERT

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

--레코드를 포함하는 레코드
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

--컬렉션 : 자료형이 같은 여러 데이터 저장 (배열, LIST...)
--연관배열, 중첩테이블, varray

--연관배열 : KEY, VALUE 

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

--레코드를 활용한 연관배열
DECLARE
    --레코드 정의:서로 다른타입을 한번에 담기위해 사용
   TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE
     );
     --연관배열 정의
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

--컬렉션 메서드 사용하기
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    
    TEXT_ARR ITAB_EX;
BEGIN
    TEXT_ARR(1) := '1ST DATA';
    TEXT_ARR(2) := '2ST DATA';
    TEXT_ARR(3) := '3ST DATA';
    TEXT_ARR(50) := '50ST DATA';
    --COUNT :전체개수, FIRST : 첫번째 값, LAST :마지막값, PRIOR: 50번 앞쪽에 있는 값,NEXT: 50번 다음에 있는 값
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.COUNT : ' || TEXT_ARR.COUNT); 
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.FIRST : ' || TEXT_ARR.FIRST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.LAST : ' || TEXT_ARR.LAST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.PRIOR(50) : ' || TEXT_ARR.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.NEXT(50) : ' || TEXT_ARR.NEXT(50));
END;
/
--실습
--EMP 테이블과 같은 열 구조를 가지는 빈 테이블 EMP_RECORD를 생성하는 SQL문 작성
--EMP_RECORD 테이블에 레코드를 사용하여 새로운 사원 정보를 다음과 같이 삽입하는 PL/SQL 문 작성

--테이블 생성(DEPT 테이블 복사)
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

--실습2:EMP 테이블을 구성하는 모든 열을 저장할 수 있는 레코드를 활용하여 연관 배열을 작성해 보기
--EMP%ROWTYPE : 참조형으로 불러들임
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

--커서 : SQL문 실행시 결과를 저장한 메모리 공간(PRIVATE SQL AREA)의 포인터
-- 단일 행 데이터를 저장하는 커서
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --명시적 커서 선언
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = 40;
BEGIN
    --커서열기
    OPEN C1;
    
    --커서로부터 읽어온 데이터 사용(FETCH)
    FETCH C1 INTO V_DEPT_ROW;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    
    --커서 닫기
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

--여러 행이 조회되는 경우 커서
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --명시적 커서 선언
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
BEGIN
    --커서열기
    OPEN C1;
    
    LOOP
        --커서로부터 읽어온 데이터 사용(FETCH)
        FETCH C1 INTO V_DEPT_ROW;
        
        --커서의 모든 행을 읽어오기 위해 지정
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);

    END LOOP;
    --커서 닫기
    CLOSE C1;
END;
/
--FOR문을 사용한 커서
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --명시적 커서 선언
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
BEGIN
    --커서 FOR LOOP 시작(자동 OPEN, FETCH, CLOSE)
    FOR C1_REC IN C1 LOOP
  
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || C1_REC.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || C1_REC.LOC);
    END LOOP;
END;
/

--커서에 파라미터 사용
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --명시적 커서 선언
    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = P_DEPTNO;
BEGIN
    --커서열기
    OPEN C1(10);
        LOOP
            --커서로부터 읽어온 데이터 사용(FETCH)
            FETCH C1 INTO V_DEPT_ROW;            
            --커서의 모든 행을 읽어오기 위해 지정
            EXIT WHEN C1%NOTFOUND;            
            DBMS_OUTPUT.PUT_LINE('10번부서 DEPTNO : ' || V_DEPT_ROW.DEPTNO
            ||'DNAME : ' || V_DEPT_ROW.DNAME||'LOC : ' || V_DEPT_ROW.LOC);
    
        END LOOP;
    --커서 닫기
    CLOSE C1;
        OPEN C1(20);
        LOOP
            --커서로부터 읽어온 데이터 사용(FETCH)
            FETCH C1 INTO V_DEPT_ROW;            
            --커서의 모든 행을 읽어오기 위해 지정
            EXIT WHEN C1%NOTFOUND;            
            DBMS_OUTPUT.PUT_LINE('20번부서 DEPTNO : ' || V_DEPT_ROW.DEPTNO
            ||'DNAME : ' || V_DEPT_ROW.DNAME||'LOC : ' || V_DEPT_ROW.LOC);
        END LOOP;
    --커서 닫기
    CLOSE C1;
END;
/
DECLARE
    --사용자가 입력한 부서번호를 저장하는 변수
    V_DEPTNO DEPT.DEPTNO%TYPE;
     --명시적 커서 선언
    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT WHERE DEPTNO = P_DEPTNO;
BEGIN
    V_DEPTNO := &INPUT_DEPTNO;
     --커서 FOR LOOP 시작(자동 OPEN, FETCH, CLOSE)
    FOR C1_REC IN C1(V_DEPTNO) LOOP
         DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO ||
        'DNAME : ' || C1_REC.DNAME||'LOC : ' || C1_REC.LOC);
    END LOOP;
END;
/

--묵시적 커서 : 커서 사용을 선언하지 않음(DML 명령어나 SELECT INTO 실행될 때 자동으로 생성 및 처리)
BEGIN
    UPDATE dept_record SET DNAME = 'DATABASE'
    WHERE DEPTNO=50;
    
    DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);
    
    IF(SQL%FOUND) THEN
      DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : TRUE');
    ELSE
      DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : FALSE');
    END IF;
    
    IF(SQL%ISOPEN) THEN
      DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : TRUE');
    ELSE
      DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : FALSE');
    END IF;    
    
END;
/
--예외(오류)
--컴파일 오류/런타임 오류
SET SERVEROUTPUT ON;
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
        WHERE DEPTNO=10;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 수치 또는 값 오류 발생');
END;
/

--예외종류(INTERRAL EXCEPTION(내부예외) / USER-DEFINED EXCEPTION (사용자정의예외))
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
        WHERE DEPTNO=10;
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 요구보다 많은 행 추출 오류 발생');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 수치 또는 값 오류 발생');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 사전 정의 외 오류 발생');
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
        DBMS_OUTPUT.PUT_LINE('예외처리 - 사전 정의 외 오류 발생');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE)); --SQL CODE(오류번호)
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);--SQLERRM(오류메세지)
END;
/
--실습:명시적 커서를 사용하여 EMP 테이블의 전체 데이터를 조회환 후 커서 안의 데이터가 다음과 같이 
--출력되도록 PL/SQL문 작성하기
--1.LOOP를 사용한 방식
--2.FOR LOOP를 사용한 방식

--1.LOOP 사용한 방식
DECLARE 
    --커서 데이터가 입력될 변수 선언
    V_EMP_ROW EMP%ROWTYPE;
    --커서 선언
    CURSOR C1 IS
        SELECT *  FROM EMP;
BEGIN
    --커서열기
    OPEN C1;
    LOOP
    --커서로부터 읽어온 데이터 사용
    FETCH C1 INTO V_EMP_ROW;
    --커서의 모든 행을 읽어오기 위한 속성 지정
    EXIT WHEN C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP_ROW.EMPNO ||
        ' ENAME : ' || V_EMP_ROW.ENAME || ' JOB : ' || V_EMP_ROW.JOB ||
        ' SAL : ' || V_EMP_ROW.SAL || ' DEPTNO : ' || V_EMP_ROW.DEPTNO);
    END LOOP;
    --커서닫기
    CLOSE C1;
END;
/
--2.FOR문사용
DECLARE 
    --커서 선언
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
--여태까지는 익명블럭 : 이름 없음, 저장할 수 없음, 실행할 때마다 컴파일, 공유 불가, 다른 응용프로그램에서 호출 안됨
--저장 서브 프로그램 : 이름 지정, 저장가능, 저장할때 한번만 컴파일, 공유가능, 호출 가능
--1.저장 프로시저 생성
CREATE OR REPLACE PROCEDURE PRO_NOPARAM --이 이름이 없다면 생성하는 조건
IS 
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

--저장한걸 호출할때
EXECUTE PRO_NOPARAM;

--PL/SQL 블록에서 프로시저 실행하려면
BEGIN
    pro_noparam;
END;
/

--프로시저 삭제하기
DROP PROCEDURE PRO_NOPARAM;

--프로시저의 파라미터 지정(매개값 받을수 있음) : IN, OUT, IN OUT
--IN파라미터(기본형)
CREATE OR REPLACE PROCEDURE PRO_NOPARAM_IN --이 이름이 없다면 생성하는 조건
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
--3.4에는 이미 기본값이 입력되어 있기 때문에 오류발생 X
EXECUTE PRO_NOPARAM_IN(1,2); 
--변수 개수 오류
EXECUTE PRO_NOPARAM_IN(1);

--OUT 모드 파라미터(프로시저 실행 후 호출한 프로그램으로 값 반환)
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
--다른 PL/SQL 블럭에서 프로시저 사용
DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    PRO_PARAM_OUT(7788,V_ENAME,V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || V_SAL);
END;
/

-- IN OUT 프로시저 : IN, OUT 기능을 동시에 수행
CREATE OR REPLACE PROCEDURE PRO_PARAM_INOUT
(
    INOUT_NO IN OUT NUMBER
    )
IS
BEGIN
    INOUT_NO := INOUT_NO * 2;
END;
/

--IN OUT 사용
DECLARE
    NO NUMBER;
BEGIN
    NO := 5;
    PRO_PARAM_INOUT(NO);
    DBMS_OUTPUT.PUT_LINE('NO : ' || NO);
END;
/

--JAVADB에서 실행
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

EXECUTE REGISTER_USER('대조영','1196','부산','010-1234-4567');
select * from usertbl;

--실습: 프로시저 생성 (SCOTT로 접속)
--1. DEPT 테이블의 부서번호(DEPTNO)를 입력 값으로 받은 후 부서번호(DEPTNO), 부서이름(DNAME),지역(LOC)을 출력하는
--프로시저 PRO_DEPT_IN 작성

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

--실습2. PL/SQL
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE;
    V_DNAME DEPT.DNAME%TYPE;
    V_LOC DEPT.LOC%TYPE;
BEGIN
    V_DEPTNO := 10;
    PRO_DEPT_IN(V_DEPTNO,V_DNAME,V_LOC);
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' || V_DEPTNO);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || V_DNAME);
    DBMS_OUTPUT.PUT_LINE('지역 : ' || V_LOC);
END;
/

--트리거 : 데이터베이스 안의 특정상황이나 동작, 즉 이벤트가 발생할 때 자동으로 실행시키는 기능

--BEFORE 트리거 
--트리거를 적용할 테이블 생성
CREATE TABLE EMP_TRG AS SELECT * FROM EMP;

--EMP_TRG에 DML구문(컴퓨터상 날짜가 주말이라면 사원정보를 수정 불가) 사용시 트리거 발생시키기
--RAISE_APPLICATION_ERROR : 사용자 정의 예외
--예외지정코드는 -20000~20999 범위의 숫자를 사용
CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
BEFORE
--EMP_TRG에 트리거 연결
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('토','일') THEN
        IF INSERTING THEN
        RAISE_APPLICATION_ERROR(-20000,'주말 사원정보 추가 불가');
        ELSIF UPDATING THEN
            RAISE_APPLICATION_ERROR(-20001,'주말 사원정보 수정 불가');
        ELSIF DELETING THEN
            RAISE_APPLICATION_ERROR(-20002,'주말 사원정보 삭제 불가');
        ELSE
            RAISE_APPLICATION_ERROR(-20003,'주말 사원정보 변경 불가');
        END IF;
    END IF;
END;
/

SELECT * FROM EMP_TRG;

UPDATE EMP_TRG
SET SAL = 3000
WHERE EMPNO=7788;

--트리거 : AFTER
--EMP_TRG 테이블에 DML 명령어가 실행될 경우 테이블에 수행된 DML 명령어의 
--종류, DML을 실행시킨 사용자, DML 명령어가 수행된 날짜와 시간 저장
--트리거 발생후 LOG기록 남기게
CREATE TABLE EMP_TRG_LOG(
    TABLENAME VARCHAR2(10),
    DML_TYPE VARCHAR2(10),
    EMPNO NUMBER(4),
    USER_NAME VARCHAR2(30),
    CHANGE_DATE DATE);

CREATE OR REPLACE TRIGGER TRG_EMP_LOG
AFTER
INSERT OR DELETE OR UPDATE ON EMP_TRG
FOR EACH ROW --DML 문장에 의해 영향받는 행별로 실행

BEGIN
    IF INSERTING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'INSERT', :NEW.EMPNO, 
        --SYSCONTEXT:현재 데이터베이스 접속자
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


--트리거 조회
SELECT *
FROM USER_TRIGGERS;

--트리거 삭제
DROP TRIGGER TRG_EMP_LOG;

--트리거 변경 (잠시 비활성화 시키기) ENABLE OR DISABLE
ALTER TRIGGER TRG_EMP_NODML_WEEKEND DISABLE;

