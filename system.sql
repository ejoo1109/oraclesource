-- scott 계정 암호 지정/계정 해제

alter user scott identified by tiger account unlock;

-- hr 계정 암호 지정/계정 해제
alter user hr identified by 12345 account unlock;

--데이터 사전
--dba_: system, sys만 볼 수 있음(db관리를 위한 정보)
select * from dba_tables;

--SCOTT에게 CREATE VIEW 권한 부여
--DCL
GRANT CREATE VIEW TO SCOTT;
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

--새로운 사용자 생성(=새로운 스키마(데이터베이스) 생성)
CREATE USER TEST IDENTIFIED BY 12345;

--접속 권한 부여(개별 권한 부여)
GRANT CREATE SESSION TO TEST;

--여러 작업의 권한을 가지고 있는 부여
GRANT CONNECT, RESOURCE TO TEST;

--TEST2 사용자 생성(아무권한이 없는 사용자생성)
CREATE USER TEST2 IDENTIFIED BY 12345;
--권한부여
GRANT CREATE SESSION TO TEST2;
GRANT CONNECT, RESOURCE TO TEST2;
GRANT CREATE TABLE TO TEST2; --테이블을 생성할수 있는 권한부여

--권한 취소
REVOKE CREATE TABLE FROM TEST2;

--비밀번호 변경
ALTER USER TEST2 IDENTIFIED BY 54321;
--사용자 삭제
--DROP USER TEST2 (사용자가 가진 객체가 아무것도 없을때)
DROP USER TEST2 CASCADE; --사용자와 객체(테이블,INDEX,VIEW..) 모두 삭제

--수업에서 사용할 사용자생성
CREATE USER JAVADB IDENTIFIED BY 12345;
GRANT CONNECT, RESOURCE TO JAVADB;