
CREATE TABLE attach(
   filename VARCHAR2(300) NOT NULL,
   bno NUMBER NOT NULL,
   regdate DATE DEFAULT SYSDATE,
   CONSTRAINT fk_attach_bno FOREIGN KEY(bno) REFERENCES board(bno)
)

select * from attach

delete from attach


CREATE TABLE attach(
	filename varchar2(300) not null.
	bno number not null,
	regdate DATE default sysdate,
	constraint fk_attach_bno foreign key(bno) references board(bno)
)