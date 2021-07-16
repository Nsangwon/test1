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



