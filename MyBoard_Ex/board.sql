CREATE TABLE reply(
rno NUMBER PRIMARY KEY,
bno NUMBER NOT NULL,
replytext VARCHAR2(900) NOT NULL,
replyer VARCHAR2(15)NOT NULL,
regdate DATE DEFAULT SYSDATE,
updatedate DATE DEFAULT SYSDATE,
CONSTRAINT reply_fk_bno FOREIGN KEY(bno) REFERENCES board(bno)
)

SELECT * from board where upper('asd')like upper(?)
ORDER by bno DESC


select count(bno) from board where title like '%||test||%'

SELECT count(bno) FROM board where title = '비온다1'

SELECT * FROM reply

drop TABLE reply

create table board(
bno NUMBER PRIMARY key,
title VARCHAR2(60) NOT NULL,
content VARCHAR2(3000) NOT NULL,
writer VARCHAR2(15) NOT NULL,
readcnt NUMBER default 0,
regdate date  default sysdate,
updatedate date  default sysdate
)

CREATE TABLE board(
bno NUMBER PRIMARY KEY,
title VARCHAR2(60) NOT NULL,
content VARCHAR2(3000) NOT NULL,
writer VARCHAR2(15) NOT NULL,
readcnt NUMBER DEFAULT 0,
regdate DATE DEFAULT SYSDATE,
updatedate DATE DEFAULT SYSDATE
)

VAL - 벨루 약자
시컨스 생성 board_seq - 보드 테이블에 시컨스
CREATE SEQUENCE board_seq

insert into board(bno,title, content, writer) values(board_seq.NEXTVAL,'title1','content2','kim')
select * from board

delete from board

drop SEQUENCE board_seq

CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 100
MAXVALUE 1000000000
NOCYCLE

board_seq.CURRVAL
- 현재 값 

CREATE TABLE member(
	userId VARCHAR2(12), 
	userPw VARCHAR2(12) NOT NULL, 
	userName VARCHAR2(30) NOT NULL,
	email VARCHAR2(100), 
	regdate DATE DEFAULT SYSDATE,
	updateDate DATE DEFAULT SYSDATE,
	CONSTRAINT member_pk_userId PRIMARY KEY(userId)
); 

insert into MEMBER (userId, userPw,userName,email) values ('m001','m001','kim','a@a.com')




