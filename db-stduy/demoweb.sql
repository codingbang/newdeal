﻿
CREATE TABLE member
(
	memberid varchar2 (20) not null primary key,
	passwd varchar2(100) not null,
	email varchar2 (50) not null,
	regdate date default(sysdate),	
	active char (1) default ('1'),
	usertype varchar2 (20) default ('user')
);

CREATE TABLE upload
(
	uploadno number not null primary key,
	title varchar2 (100) not null,
	uploader varchar2 (20) not null, --member table reference
	content varchar2 (1000) null,
	readcount number default (0),
	regdate date default (SYSDATE),
	deleted char(1) default ('0')
);

ALTER TABLE upload 
ADD CONSTRAINT fk_member_upload
FOREIGN KEY (uploader) REFERENCES member (memberid);

CREATE SEQUENCE upload_sequence;

CREATE TABLE uploadfile
(
	uploadfileno number not null primary key,
	uploadno number not null, -- upload table reference
	savedfilename varchar2 (100) not null,
	userfilename varchar2 (100) not null,
	downloadcount number default (0),
	CONSTRAINT fk_upload_uploadfile 
	FOREIGN KEY (uploadno) REFERENCES upload (uploadno)	
);

CREATE SEQUENCE uploadfile_sequence;

CREATE TABLE board
(
	boardno number not null primary key,
	title varchar2 (100) not null,
	writer varchar2 (20) not null,			--member table reference
	content varchar2 (2000) not null,
	regdate date default (SYSDATE),
	readcount number default (0),
	deleted char (1) default ('0'),
	
	groupno number not null,
	step number not null,
	depth number default (0)
);

ALTER TABLE board
ADD CONSTRAINT fk_member_board
FOREIGN KEY (writer) REFERENCES member (memberid);

CREATE SEQUENCE board_sequence;

CREATE TABLE boardcomment
(
	commentno number not null primary key,
	boardno number not null, -- board table reference
	writer varchar2 (20) not null, -- member table reference
	content varchar2 (500) not null,
	regdate date default (sysdate)
);

ALTER TABLE boardcomment
ADD CONSTRAINT fk_board_comment
FOREIGN KEY (boardno) REFERENCES board (boardno);

ALTER TABLE boardcomment
ADD CONSTRAINT fk_member_comment
FOREIGN KEY (writer) REFERENCES member (memberid);

CREATE SEQUENCE boardcomment_sequence;

select * from member;
select * from board;
select * from boardcomment;
select * from upload;
select * from uploadfile;

delete boardcomment where boardno=1;
commit;

desc boardcomment;

