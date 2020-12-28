-- hr ������ ������ �ִ� ��� ���̺� ����
select * from tab;

--employees ���̺� ��ü ������ȸ
SELECT * FROM employees;

--employees ���̺��� first_name, last_name, job_id�� ��ȸ
SELECT first_name, last_name,job_id FROM employees;
--����1)
--�����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
SELECT last_name, department_id from employees WHERE employee_id=176;
--������ 12000 �̻�(>=) �Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT last_name, salary FROM employees WHERE salary >=12000;
--������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT last_name, salary FROM employees WHERE salary < 5000 OR salary > 12000;

--����)
--20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ������� ��ȸ
SELECT last_name, department_id  
FROM employees 
WHERE department_id in(20,50) ORDER by last_name, department_id;

--Ŀ�̼��� ���� ��� ������� LAST_NAME,����(salary��),Ŀ�̼� ��ȸ�ϱ�.��,������ ������ Ŀ�̼ǿ������ΰ�� ���
SELECT last_name,salary,commision_pct 
FROM employees
WHERE eommission_pct>0 ORDER BY salary DESC, commission_pct DESC;

--������ 2500,3500,7000�� �ƴϸ�, ������ SA_REP�̳� ST_CLERK �� ����� ��ȸ
SELECT * FROM employees 
WHERE salary NOT IN(2500,3500,7000) and job_id IN('sa_rep''st_clerk');

--2008/02/20~2008/05/01 ���̿� ���� ������� LAST_NAME,�����ȣ,������� ��ȸ.��,������� ������������ ����
SELECT last_name, employee_id, hire_date
from employees
where hire_date >= '2008-02-20' and hire_date <='2008-05-01'order by hire_date DESC;

--2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� �����Ͽ� ���
SELECT last_name,hire_date 
from employees 
WHERE hire_date >='2004-01-01' and hire_date <= '2004-12-31' ORDER BY hire_date;

--between ���
--������ 5000���� 12000�� ������ �ְ�, 20�� or 50�� �μ��� �ٹ��ϴ� ������� ������ ��ȸ�Ͽ� 
--������������ ���� last_name,salary)
SELECT last_name,salary
FROM employees
WHERE department_id in (20,50) and salary between 5000 and 12000 order by salary;

--2004�⵵�� ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� ��������
--�������� �����Ͽ� ���
SELECT last_name, hire_date
FROM employees
WHERE hire_date between '2004-01-01' and '2004-12-31' order by hire_date;

-- ������ 5000~12000 ���� �̿��� ������� last_name, salary ��ȸ
SELECT last_name,salary
FROM employees
WHERE salary NOT BETWEEN 5000 and 12000;

--LIKE ����
--2004�⵵�� ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� ��������
--�������� �����Ͽ� ���
SELECT last_name,hire_date 
FROM employees 
WHERE hire_date LIKE '04%' ORDER BY hire_date;

--last_name �� u�� ���ԵǴ� ������� ��� �� last_name ��ȸ
SELECT employee_id, last_name
FROM employees
WHERE last_name LIKE '%u%';
--last_name �� �׹�° ���ڰ� a�� ������� last_name ��ȸ
SELECT last_name 
FROM employees
WHERE last_name LIKE '___a%';
--last_name �� a Ȥ�� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name
--�������� �������� ����
SELECT last_name 
FROM employees
WHERE last_name LIKE '%a%' or last_name LIKE '%e%' ORDER BY last_name;
--last_name�� a�� e���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name
--�������� �������� ����
SELECT last_name 
FROM employees
WHERE last_name LIKE '%a%e%' or last_name LIKE '%e%a%' ORDER BY last_name;

--IS NULL����
--�Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
SELECT last_name,job_id
FROM employees 
WHERE manager_id IS null;
--ST_CLERK�� JOB_ID�� ���� ����� ���� �μ� ID ��ȸ. �μ� ��ȣ�� NULL�� �� ����
SELECT distinct department_id
FROM employees 
WHERE job_id NOT IN('st_clerk') and department_id is not null;
--COMMISSON_PCT�� NULL�� �ƴ� ����� �߿��� COMMISSION=SALARY * COMMISSION_PCT
--�� ���Ͽ� EMPLOYEE_ID, FIRST_NAME, JOB_ID�� ������ȸ
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID,SALARY * COMMISSION_PCT as commision
FROM employees
WHERE commission_pct is not null;

--[�ǽ�]���ڿ� �Լ�
--1.first_name�� Curtis�� ����� first_name, last_name, email, phone_number,
--job_id�� ��ȸ�Ѵ�. ��, job_id�� ����� �ҹ��ڷ� ��µǵ��� �Ѵ�.
SELECT first_name, last_name, email, phone_number,LOWER(job_id)
FROM employees
WHERE first_name = 'Curtis';

--2.�μ���ȣ�� 70,80,90�� ������� employee_id, first_name, hire_date,job_id�� 
--��ȸ�Ѵ�. ��, job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�.
SELECT employee_id, first_name, hire_date,REPLACE(job_id,'IT_PROG','���α׷���')
FROM employees
WHERE department_id IN (60,70,80,90);

--3.job_id�� ad_prs, pu_clerk�� ������� employee_id, first_name, last_name,
--department_id, job_id�� ��ȸ�Ͻÿ�, ��, ������� first_name�� last_name�� �����Ͽ� ���
SELECT employee_id, CONCAT(first_name,CONCAT(' ',last_name)),department_id, job_id
FROM employees
WHERE job_id IN('AD_PRS','PU_CLERK');

--�ǽ�4) �μ�80�� �� ����� ���� ���� ������ ������ ǥ���Ͻÿ�.
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

--������ �Լ� ����
--ȸ�系�� �ִ� ���� �� �ּ� ���� ���̸� ��ȸ
select max(salary) - min(salary) from employees; 
--�Ŵ����� �ٹ��ϴ� ������� �ο��� ��ȸ
select count(distinct manager_id) as �Ŵ��� from employees;

--�μ��� ������ ���� ���Ͽ� �μ���ȣ�� ������������ ���
select count(employee_id), department_id
from employees
group by department_id
order by department_id;

--�μ��� �޿��� ��� ������ ����ϰ�, ��տ����� ������ �������� �Ѵ�.
--�μ���ȣ�� ������������ ����
select department_id, round (avg(salary),0)
from employees
group by department_id
order by department_id;

--������ ������ ���� ������� ��ȸ
select job_id, count(employee_id)
from employees
group by job_id;

--JOIN�ǽ�
--�ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��ڸ� ã�� HIRE_DATE, LAST_NAME,
--MANAGER_ID�� ����Ͻÿ�(EMPLOYEES SELF JOIN) =>37��
SELECT E1.HIRE_DATE, E1.LAST_NAME, E1.HIRE_DATE AS ���Ի���,
       E1.MANAGER_ID, E2.HIRE_DATE AS �Ŵ����Ի���
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID AND E1.HIRE_DATE < E2.HIRE_DATE;

--�����̸��� T�� �����ϴ� ������ ��� ������� ���,LAST_NAME,�μ���ȣ ��ȸ
--(EMPLOYEES �� DEPARTMENT_ID�� DEPARTMENTS�� DEPARTMENT_ID������
--DEPARTMENTS �� LOCATION_ID�� LOCATIONS�� LOCATION_ID����) =>2��
SELECT EMPLOYEE_ID, LAST_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E , DEPARTMENTS D, LOCATIONS L
WHERE e.department_id=d.department_id AND D.LOCATION_ID = L.LOCATION_ID AND CITY LIKE 'T%';

--��ġ ID�� 1700�� ������ ������� EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY��ȸ
--(EMPLOYEES�� DEPARTMENTS ����) => 18��
SELECT EMPLOYEE_ID, LAST_NAME, D.DEPARTMENT_ID,SALARY
FROM EMPLOYEES E , DEPARTMENTS D
WHERE e.department_id=d.department_id AND D.LOCATION_ID =1700;


--DEPARTMENT_NAME, LOCATION_ID, �� �μ��� �����, �� �μ��� ��� ���� ��ȸ
--(EMPLOYEES, DAPARTMENT ����) =>11��
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, COUNT(EMPLOYEE_ID),ROUND(AVG(SALARY),2)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE e.department_id = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, D.LOCATION_ID;


--EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� DEPARTMENT_ID, LAST_NAME, JOB_ID ��ȸ
--(EMPLOYEES, DAPARTMENT ����)
SELECT LAST_NAME, D.DEPARTMENT_ID,JOB_ID
FROM EMPLOYEES E , DEPARTMENTS D
WHERE e.department_id=d.department_id AND D.DEPARTMENT_NAME ='Executive';


--������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID��ȸ
--(EMPLOYEES, JOB_HISTORY ����)
SELECT E.EMPLOYEE_ID, E.JOB_ID
FROM EMPLOYEES E,JOB_HISTORY J
WHERE E.EMPLOYEE_ID = J.EMPLOYEE_ID AND E.JOB_ID = J.JOB_ID;

--�� ����� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ�
--��� ������� LAST_NAME�� ��ȸ
--(EMPLOYEES SELF JOIN) 
SELECT E1.DEPARTMENT_ID,E1.FIRST_NAME||' '||E1.LAST_NAME AS NAME
FROM EMPLOYEES E1,EMPLOYEES E2
WHERE E1.DEPARTMENT_ID=E2.DEPARTMENT_ID AND E1.HIRE_DATE < E2.HIRE_DATE 
AND E1.SALARY < E2.SALARY;

--�������� �ǽ�

--ȸ����ü��� �������� �� ���� �޴� ������� LAST_NAME, SALARY ��ȸ
SELECT LAST_NAME, SALARY
FROM employees
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);
--LAST_NAME�� u�� ���Ե� ������ ���� �μ��� �ٹ��ϴ� ������� EMPLOYEE_ID,LAST_NAME��ȸ
SELECT EMPLOYEE_ID,LAST_NAME
FROM employees
WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES WHERE LAST_NAME LIKE '%u%');

--NOT EXISTS �����ڸ� ����Ͽ� �Ŵ����� �ƴ� ��� �̸��� ��ȸ
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES e1
WHERE NOT EXISTS (SELECT distinct manager_id 
                  from EMPLOYEES e2 WHERE e1.EMPLOYEE_id=e2.manager_id);
                  
SELECT FIRST_NAME, LAST_NAME 
FROM EMPLOYEES e1
WHERE e1.employee_id NOT IN (SELECT distinct manager_id 
                  from EMPLOYEES e2 WHERE e1.EMPLOYEE_id=e2.manager_id);

--�ε��� Ȯ��
CREATE TABLE INDEXTBL AS
SELECT DISTINCT first_name, last_name, hire_date
FROM employees;

SELECT * FROM INDEXTBL WHERE first_name = 'Jack';

--������ ���̽����� �˻��� ��� ������ index ���
--�ε��� ��� ���ο� ���� ���̺� �˻� �����
--Table Full Scan, Index Scan ���� ����

--�ε��� ����
CREATE INDEX IDX_indextbl_firstname ON indextbl(first_name);

--�ε��� ����
DROP INDEX IDX_indextbl_firstname;

SELECT * FROM IDX_EMP_SQL;
