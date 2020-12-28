--데이터 사전 : 데이터베이스 메모리, 성능, 사용자, 권한, 객체와 같은 오라클
--운영에 필요한 중요한 데이터가 보관된 장소

--scott 계정에서 사용가능한 데이터 사전
SELECT * FROM DICT;

SELECT * FROM USER_TABLES;

SELECT * FROM ALL_TABLES;

--뷰 : 가상테이블 
CREATE VIEW vm_emp20 as (select empno, ename, job, deptno
                                   from emp
                                 where deptno=20);
                                 
SELECT * FROM VM_EMP20;
--뷰 확인
SELECT * FROM USER_VIEWS;

CREATE VIEW VM_EMP30ALL AS SELECT * FROM EMP;

--생성된 뷰를 통해서 INSERT 작업
INSERT INTO VM_EMP30ALL VALUES(7777,'KIM','JUNKI',NULL,'20/10/19',2650,NULL,20);

SELECT * FROM VM_EMP30ALL;
SELECT * FROM EMP;

--뷰는 SELECT만 가능하도록 생성
CREATE VIEW VM_EMP_READ AS SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY;

--생성된 뷰에 수정이 가능한가?
SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='VN_EMP30ALL';
SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='VM_EMP_READ';

--뷰를 사용하는 목적
--보안(원본 테이블이 가지고 있는 민감한 정보 제한)
SELECT * FROM EMP; -- SAL,COMM
--서브쿼리, 조인과 같은 복잡한 쿼리 결과를 저장해서 사용

--인덱스 - 색인이기 때문에 SELECT 문에 효능을 높임
--SCOTT 계정이 소유한 인덱스 정보 보기
SELECT * FROM USER_INDEXES;

--기본키 생성 => 자동인덱스가 됨
--인덱스 생성(EMP 테이블의 SAL열에 인덱스 생성)
CREATE INDEX IDX_EMP_SQL ON EMP (SAL);

select * from EMP WHERE sal=1250;

create table useTBL(
    userID char(8) NOT NULL PRIMARY KEY,
    userName nvarchar2(10) NOT NULL,
    birthYear number(4) NOT NULL,
    mobile char(3));
    
    SELECT index_name, uniqueness, index_type FROM USER_INDEXES;
    
    select * from user_indexes;
    
--시퀀스 : 특정 규칙에 맞는 연속 숫자 생성 EX)게시글 번호, 상품 번호, 주문 번호...
--시퀀스 생성
CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10 --10씩 증가
START WITH 10  --처음 시작 숫자
MAXVALUE 90    --마지막 숫자
MINVALUE 0     --START 값보다 작게 설정
NOCYCLE CACHE 2; --반복하지 않음, 미리 생성할 것인지 여부

CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;

--시퀀스를 이용해서 삽입
SELECT * FROM DEPT_SEQ_TBL;
INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.NEXTVAL, 'DATABASE', 'SEOUL'); --에러가 나올때까지
--시퀀스 수정
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

--마지막 발행된 시퀀스 확인하기
SELECT DEPT_SEQ.CURRVAL FROM DUAL;

--SYNONYM (동의어) : 공식 별칭
--테이블, 뷰, 시퀀스 등 객체들에게 대신 사용할 수 있는 이름 부여
CREATE SYNONYM E FOR EMP;

SELECT * FROM E;

DROP SYNONYM E;

--실습1) 다음 SQL문을 작성해 보세요
--① EMP테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 생성하시오.
--② 생성한 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스를 생성하시오.
--③ 인덱스가 잘 생성되었는지 데이터 사전 뷰를 통해 확인하시오.

CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1<>1;
CREATE INDEX IDX_EMP_EMPNO ON EMPIDX(EMPNO);
SELECT * FROM USER_INDEXES;

--[실습2] 실습1에서 생성한 EMPIDX 테이블의 데이터 중 급여가 1500 초과인 사원들만 출력하는 
--EMPIDX_OVER15K 뷰를 생성하시오. (사원번호, 사원이름, 직책,부서번호,급여,추가수당 열을 가지고 있다)
CREATE VIEW EMPIDX_OVER15K as select * FROM EMPIDX WHERE SAL > 1500;
SELECT * FROM EMPIDX_OVER15K;

--[실습3] 다음 SQL문을 작성해 보세요
--① DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성하시오.
--② 생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를 아래에 제시된 특성에 맞춰 생성해 보시오.
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;
CREATE SEQUENCE DEPTSEQ_SEQ
INCREMENT BY 1 --10씩 증가
START WITH 1  --처음 시작 숫자
MAXVALUE 99    --마지막 숫자
MINVALUE 1     --START 값보다 작게 설정
NOCYCLE NOCACHE; --반복하지 않음, 미리 생성할 것인지 여부

select * from USER_SEQUENCES;

INSERT INTO DEPTSEQ VALUES(deptno.NEXTVAL, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ VALUES(deptno.NEXTVAL, 'WEB', 'PUSAN');
INSERT INTO DEPTSEQ VALUES(deptno.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;
--시퀀스 삭제
DROP SYNONYM DEPTNO;