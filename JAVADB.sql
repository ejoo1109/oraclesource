CREATE TABLE USERTBL(
    NO NUMBER(8) CONSTRAINT PK_USERTBL PRIMARY KEY,
    USERNAME NCHAR(4) NOT NULL,
    BIRTHYEAR NUMBER(4) NOT NULL,
    ADDR NCHAR(2) NOT NULL,
    MOBILE NVARCHAR2(13));
    
CREATE SEQUENCE USERTBL_SEQ;

INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'홍길동',1955,'서울','010-1235-4568');
INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'김지우',1965,'부산','010-3568-4568');
INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'손승연',1975,'대구','010-8596-1234');
INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'신동완',1985,'인천','010-7777-8888');
INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'김석호',1995,'안산','010-8888-6954');

SELECT * FROM USERTBL;

COMMIT;
<<<<<<< HEAD

CREATE TABLE board(
	bno number(8),
	name nvarchar2(10) not null, 
	password varchar2(15) not null, 
	title nvachar2(50) not null, 
	content nvarchar2(1000) not null, 
	attach nvarchar2(100), 
	re_ref number(8) not null, 
	re_lev number(8) not null, 
	re_seq number(8) not null, 
	readcount number(8) default 0,
	regdate date default (sysdate)
    );

alter table board add constraint pk_board primary key(bno);

select*from board;

create sequence board_seq;
=======
>>>>>>> 608fcfe182f2a411fc22123d9830ed7c4e8b3e8e
