-- hr 계정이 가지고 있는 모든 테이블 보기
select * from tab;

--employees 테이블 전체 내용조회
SELECT * FROM employees;

--employees 테이블의 first_name, last_name, job_id만 조회
SELECT first_name, last_name,job_id FROM employees;
--문제1)
--사원번호가 176인 사람의 LAST_NAME와 부서번호 조회
SELECT last_name, department_id from employees WHERE employee_id=176;
--연봉이 12000 이상(>=) 되는 직원들의 LAST_NAME 및 연봉 조회
SELECT last_name, salary FROM employees WHERE salary >=12000;
--연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
SELECT last_name, salary FROM employees WHERE salary < 5000 OR salary > 12000;

--문제)
--20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순으로 조회
SELECT last_name, department_id  
FROM employees 
WHERE department_id in(20,50) ORDER by last_name, department_id;

--커미션을 버는 모든 사원들의 LAST_NAME,연봉(salary만),커미션 조회하기.단,연봉의 역순및 커미션역순으로결과 출력
SELECT last_name,salary,commision_pct 
FROM employees
WHERE eommission_pct>0 ORDER BY salary DESC, commission_pct DESC;

--연봉이 2500,3500,7000이 아니며, 직업이 SA_REP이나 ST_CLERK 인 사람들 조회
SELECT * FROM employees 
WHERE salary NOT IN(2500,3500,7000) and job_id IN('sa_rep''st_clerk');

--2008/02/20~2008/05/01 사이에 고용된 사원들의 LAST_NAME,사원번호,고용일자 조회.단,고용일자 내림차순으로 정렬
SELECT last_name, employee_id, hire_date
from employees
where hire_date >= '2008-02-20' and hire_date <='2008-05-01'order by hire_date DESC;

--2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순 정렬하여 출력
SELECT last_name,hire_date 
from employees 
WHERE hire_date >='2004-01-01' and hire_date <= '2004-12-31' ORDER BY hire_date;

--between 사용
--연봉이 5000에서 12000의 범위에 있고, 20번 or 50번 부서에 근무하는 사람들의 연봉을 조회하여 
--오름차순으로 정렬 last_name,salary)
SELECT last_name,salary
FROM employees
WHERE department_id in (20,50) and salary between 5000 and 12000 order by salary;

--2004년도에 고용된 모든 사람들의 last_name 및 고용일을 조회하여 입사일 기준으로
--오름차순 정렬하여 출력
SELECT last_name, hire_date
FROM employees
WHERE hire_date between '2004-01-01' and '2004-12-31' order by hire_date;

-- 연봉이 5000~12000 범위 이외의 사람들의 last_name, salary 조회
SELECT last_name,salary
FROM employees
WHERE salary NOT BETWEEN 5000 and 12000;

--LIKE 연습
--2004년도에 고용된 모든 사람들의 last_name 및 고용일을 조회하여 입사일 기준으로
--오름차순 정렬하여 출력
SELECT last_name,hire_date 
FROM employees 
WHERE hire_date LIKE '04%' ORDER BY hire_date;

--last_name 에 u가 포함되는 사원들의 사번 및 last_name 조회
SELECT employee_id, last_name
FROM employees
WHERE last_name LIKE '%u%';
--last_name 에 네번째 글자가 a인 사람들의 last_name 조회
SELECT last_name 
FROM employees
WHERE last_name LIKE '___a%';
--last_name 에 a 혹은 e 글자가 있는 사원들의 last_name을 조회하여 last_name
--기준으로 오름차순 정렬
SELECT last_name 
FROM employees
WHERE last_name LIKE '%a%' or last_name LIKE '%e%' ORDER BY last_name;
--last_name에 a와 e글자가 있는 사원들의 last_name을 조회하여 last_name
--기준으로 오름차순 정렬
SELECT last_name 
FROM employees
WHERE last_name LIKE '%a%e%' or last_name LIKE '%e%a%' ORDER BY last_name;

--IS NULL연습
--매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
SELECT last_name,job_id
FROM employees 
WHERE manager_id IS null;
--ST_CLERK인 JOB_ID를 가진 사원이 없는 부서 ID 조회. 부서 번호가 NULL인 값 제외
SELECT distinct department_id
FROM employees 
WHERE job_id NOT IN('st_clerk') and department_id is not null;
--COMMISSON_PCT가 NULL이 아닌 사원들 중에서 COMMISSION=SALARY * COMMISSION_PCT
--를 구하여 EMPLOYEE_ID, FIRST_NAME, JOB_ID와 같이조회
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID,SALARY * COMMISSION_PCT as commision
FROM employees
WHERE commission_pct is not null;

--[실습]문자열 함수
--1.first_name이 Curtis인 사람의 first_name, last_name, email, phone_number,
--job_id를 조회한다. 단, job_id의 결과는 소문자로 출력되도록 한다.
SELECT first_name, last_name, email, phone_number,LOWER(job_id)
FROM employees
WHERE first_name = 'Curtis';

--2.부서번호가 70,80,90인 사람들의 employee_id, first_name, hire_date,job_id를 
--조회한다. 단, job_id가 it_prog인 사원의 경우 프로그래머로 변경하여 출력한다.
SELECT employee_id, first_name, hire_date,REPLACE(job_id,'IT_PROG','프로그래머')
FROM employees
WHERE department_id IN (60,70,80,90);

--3.job_id가 ad_prs, pu_clerk인 사원들의 employee_id, first_name, last_name,
--department_id, job_id를 조회하시오, 단, 사원명은 first_name과 last_name을 연결하여 출력
SELECT employee_id, CONCAT(first_name,CONCAT(' ',last_name)),department_id, job_id
FROM employees
WHERE job_id IN('AD_PRS','PU_CLERK');

--실습4) 부서80의 각 사원에 대해 적용 가능한 세율을 표시하시오.
SELECT LAST_NAME, SALARY,
CASE
WHEN SALARY <2000 THEN 0
WHEN (SALARY <4000) THEN 0.09
WHEN (SALARY <6000) THEN 0.2
WHEN (SALARY <8000) THEN 0.3
WHEN (SALARY <10000) THEN 0.4
WHEN (SALARY <12000) THEN 0.42
WHEN (SALARY <14000) THEN 0.44
ELSE 0.45
END AS TAX_RATE
FROM EMPLOYEES;

SELECT LAST_NAME, SALARY, 
DECODE(TRUNC(SALARY/2000,0),
 0,0.00,
 1,0.09,
 2,0.20,
 3,0.30,
 4,0,40,
 5,0.42,
 6,0.44,
 0.45)AS TAX_RATE
 FROM EMPLOYEES WHERE DEPARTMENT_ID=80;

--다중행 함수 연습
--회사내의 최대 연봉 및 최소 연봉 차이를 조회
select max(salary) - min(salary) from employees; 
--매니저로 근무하는 사원들의 인원수 조회
select count(distinct manager_id) as 매니저 from employees;

--부서별 직원의 수를 구하여 부서번호의 오름차순으로 출력
select count(employee_id), department_id
from employees
group by department_id
order by department_id;

--부서별 급여의 평균 연봉을 출력하고, 평균연봉은 정수만 나오도록 한다.
--부서번호별 오름차순으로 정렬
select department_id, round (avg(salary),0)
from employees
group by department_id
order by department_id;

--동일한 직업을 가진 사원수를 조회
select job_id, count(employee_id)
from employees
group by job_id;

--JOIN실습
--자신의 담당 매니저의 고용일보다 빠른 입사자를 찾아 HIRE_DATE, LAST_NAME,
--MANAGER_ID를 출력하시오(EMPLOYEES SELF JOIN) =>37행
SELECT E1.HIRE_DATE, E1.LAST_NAME, E1.HIRE_DATE AS 내입사일,
       E1.MANAGER_ID, E2.HIRE_DATE AS 매니저입사일
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID AND E1.HIRE_DATE < E2.HIRE_DATE;

--도시이름이 T로 시작하는 지역에 사는 사원들의 사번,LAST_NAME,부서번호 조회
--(EMPLOYEES 의 DEPARTMENT_ID와 DEPARTMENTS의 DEPARTMENT_ID연결후
--DEPARTMENTS 의 LOCATION_ID와 LOCATIONS의 LOCATION_ID조인) =>2행
SELECT EMPLOYEE_ID, LAST_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E , DEPARTMENTS D, LOCATIONS L
WHERE e.department_id=d.department_id AND D.LOCATION_ID = L.LOCATION_ID AND CITY LIKE 'T%';

--위치 ID가 1700인 동일한 사원들의 EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY조회
--(EMPLOYEES와 DEPARTMENTS 조인) => 18행
SELECT EMPLOYEE_ID, LAST_NAME, D.DEPARTMENT_ID,SALARY
FROM EMPLOYEES E , DEPARTMENTS D
WHERE e.department_id=d.department_id AND D.LOCATION_ID =1700;


--DEPARTMENT_NAME, LOCATION_ID, 각 부서별 사원수, 각 부서별 평균 연봉 조회
--(EMPLOYEES, DAPARTMENT 조인) =>11행
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, COUNT(EMPLOYEE_ID),ROUND(AVG(SALARY),2)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE e.department_id = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, D.LOCATION_ID;


--EXECUTIVE 부서에 근무하는 모든 사원들의 DEPARTMENT_ID, LAST_NAME, JOB_ID 조회
--(EMPLOYEES, DAPARTMENT 조인)
SELECT LAST_NAME, D.DEPARTMENT_ID,JOB_ID
FROM EMPLOYEES E , DEPARTMENTS D
WHERE e.department_id=d.department_id AND D.DEPARTMENT_NAME ='Executive';


--기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID조회
--(EMPLOYEES, JOB_HISTORY 조인)
SELECT E.EMPLOYEE_ID, E.JOB_ID
FROM EMPLOYEES E,JOB_HISTORY J
WHERE E.EMPLOYEE_ID = J.EMPLOYEE_ID AND E.JOB_ID = J.JOB_ID;

--각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는
--모든 사원들의 LAST_NAME을 조회
--(EMPLOYEES SELF JOIN) 
SELECT E1.DEPARTMENT_ID,E1.FIRST_NAME||' '||E1.LAST_NAME AS NAME
FROM EMPLOYEES E1,EMPLOYEES E2
WHERE E1.DEPARTMENT_ID=E2.DEPARTMENT_ID AND E1.HIRE_DATE < E2.HIRE_DATE 
AND E1.SALARY < E2.SALARY;

--서브쿼리 실습

--회사전체평균 연봉보다 더 많이 받는 사원들의 LAST_NAME, SALARY 조회
SELECT LAST_NAME, SALARY
FROM employees
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);
--LAST_NAME에 u가 포함된 사원들과 동일 부서에 근무하는 사원들의 EMPLOYEE_ID,LAST_NAME조회
SELECT EMPLOYEE_ID,LAST_NAME
FROM employees
WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES WHERE LAST_NAME LIKE '%u%');

--NOT EXISTS 연산자를 사용하여 매니저가 아닌 사원 이름을 조회
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES e1
WHERE NOT EXISTS (SELECT distinct manager_id 
                  from EMPLOYEES e2 WHERE e1.EMPLOYEE_id=e2.manager_id);
                  
SELECT FIRST_NAME, LAST_NAME 
FROM EMPLOYEES e1
WHERE e1.employee_id NOT IN (SELECT distinct manager_id 
                  from EMPLOYEES e2 WHERE e1.EMPLOYEE_id=e2.manager_id);

--인덱스 확인
CREATE TABLE INDEXTBL AS
SELECT DISTINCT first_name, last_name, hire_date
FROM employees;

SELECT * FROM INDEXTBL WHERE first_name = 'Jack';

--데이터 베이스에서 검색의 향상 때문에 index 사용
--인덱스 사용 여부에 따라 테이블 검색 방식을
--Table Full Scan, Index Scan 으로 구분

--인덱스 생성
CREATE INDEX IDX_indextbl_firstname ON indextbl(first_name);

--인덱스 삭제
DROP INDEX IDX_indextbl_firstname;

SELECT * FROM IDX_EMP_SQL;
