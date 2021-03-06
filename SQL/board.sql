--------------------------------------------------------
--  DELETE 
--------------------------------------------------------
DROP TABLE RBOARD_VOTE;
DROP TABLE RBOARD;
DROP TABLE BOARD_UPLOAD_FILE;
DROP TABLE BOARD;
DROP TABLE BOARD_CATEGORY;

DROP SEQUENCE  BOARD_BNUM_SEQ  ;
DROP SEQUENCE  BOARD_CATEGORY_CID_SEQ;
DROP SEQUENCE  BOARD_UPLOAD_FILE_SQL;
DROP SEQUENCE  RBOARD_RNUM_SEQ;
--------------------------------------------------------
--  CREATE SEQUENCE
--------------------------------------------------------
CREATE SEQUENCE  BOARD_BNUM_SEQ  ;
CREATE SEQUENCE  BOARD_CATEGORY_CID_SEQ;
CREATE SEQUENCE  BOARD_UPLOAD_FILE_SQL;
CREATE SEQUENCE  RBOARD_RNUM_SEQ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------
CREATE TABLE BOARD 
(BNUM NUMBER(10,0), 
BCATEGORY NUMBER(10,0), 
BTITLE VARCHAR2(150), 
BID VARCHAR2(40), 
BNICKNAME VARCHAR2(30), 
BCDATE TIMESTAMP (6) DEFAULT systimestamp, 
BUDATE TIMESTAMP (6) DEFAULT systimestamp, 
BHIT NUMBER(5,0) DEFAULT 0, 
BCONTENT CLOB, 
BGROUP NUMBER(5,0), 
BSTEP NUMBER(5,0), 
BINDENT NUMBER(5,0), 
COL1 VARCHAR2(30), 
COL2 VARCHAR2(30), 
COL3 VARCHAR2(30)
) ;

COMMENT ON COLUMN BOARD.BNUM IS '게시글번호';
COMMENT ON COLUMN BOARD.BCATEGORY IS '분류카테고리';
COMMENT ON COLUMN BOARD.BTITLE IS '제목';
COMMENT ON COLUMN BOARD.BID IS '작성자ID';
COMMENT ON COLUMN BOARD.BNICKNAME IS '별칭';
COMMENT ON COLUMN BOARD.BCDATE IS '작성일';
COMMENT ON COLUMN BOARD.BUDATE IS '수정일';
COMMENT ON COLUMN BOARD.BHIT IS '조회수';
COMMENT ON COLUMN BOARD.BCONTENT IS '본문내용';
COMMENT ON COLUMN BOARD.BGROUP IS '답글그룹';
COMMENT ON COLUMN BOARD.BSTEP IS '답변글의 단계';
COMMENT ON COLUMN BOARD.BINDENT IS '답변글의 들여쓰기';
COMMENT ON COLUMN BOARD.COL1 IS '임시1';
COMMENT ON COLUMN BOARD.COL2 IS '임시2'; 
COMMENT ON COLUMN BOARD.COL3 IS '임시3';
--------------------------------------------------------
--  DDL for Table BOARD_CATEGORY
--------------------------------------------------------
CREATE TABLE BOARD_CATEGORY 
(CID NUMBER(10,0), 
CNAME VARCHAR2(60),
USE_YN CHAR(1)
) ;
COMMENT ON COLUMN BOARD_CATEGORY.CID IS '분류코드';
COMMENT ON COLUMN BOARD_CATEGORY.CNAME IS '분류명';
--------------------------------------------------------
--  DDL for Table BOARD_UPLOAD_FILE
--------------------------------------------------------
CREATE TABLE BOARD_UPLOAD_FILE 
(FID NUMBER(10,0), 
BNUM NUMBER(10,0), 
FNAME VARCHAR2(150), 
FSIZE VARCHAR2(45), 
FTYPE VARCHAR2(100), 
FDATA BLOB, 
CDATE TIMESTAMP (6) DEFAULT systimestamp, 
UDATE TIMESTAMP (6) DEFAULT systimestamp, 
COLUMN1 VARCHAR2(20), 
COLUMN2 VARCHAR2(20)
);

COMMENT ON COLUMN BOARD_UPLOAD_FILE.FID IS '파일아이디';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.BNUM IS '게시글번호';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.FNAME IS '파일명';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.FSIZE IS '파일크기';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.FTYPE IS '파일유형';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.FDATA IS '첨부파일';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.CDATE IS '작성일';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.UDATE IS '수정일';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.COLUMN1 IS '임시1';
COMMENT ON COLUMN BOARD_UPLOAD_FILE.COLUMN2 IS '임시2';
--------------------------------------------------------
--  DDL for Table RBOARD
--------------------------------------------------------
CREATE TABLE RBOARD 
(	RNUM NUMBER(10,0), 
BNUM NUMBER(10,0), 
RID VARCHAR2(40), 
RNICKNAME VARCHAR2(30), 
RCDATE TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
RUDATE TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
RCONTENT CLOB, 
RGOOD NUMBER(5,0), 
RBAD NUMBER(5,0), 
RGROUP NUMBER(5,0), 
RSTEP NUMBER(5,0), 
RINDENT NUMBER(5,0), 
PRNUM NUMBER(10,0), 
PRID VARCHAR2(40), 
PRNICKNAME VARCHAR2(30), 
COLUMN1 VARCHAR2(20), 
COLUMN2 VARCHAR2(20), 
COLUMN3 VARCHAR2(20)
) ;

COMMENT ON COLUMN RBOARD.RNUM IS '댓글번호';
COMMENT ON COLUMN RBOARD.BNUM IS '최초원글';
COMMENT ON COLUMN RBOARD.RID IS '댓글작성자ID';
COMMENT ON COLUMN RBOARD.RNICKNAME IS '댓글작성자별칭';
COMMENT ON COLUMN RBOARD.RCDATE IS '작성일시';
COMMENT ON COLUMN RBOARD.RUDATE IS '수정일시';
COMMENT ON COLUMN RBOARD.RCONTENT IS '댓글본문내용';
COMMENT ON COLUMN RBOARD.RGOOD IS '선호';
COMMENT ON COLUMN RBOARD.RBAD IS '비선호';
COMMENT ON COLUMN RBOARD.RGROUP IS '댓글그룹';
COMMENT ON COLUMN RBOARD.RSTEP IS '댓글 단계';
COMMENT ON COLUMN RBOARD.RINDENT IS '댓글 들여쓰기';
COMMENT ON COLUMN RBOARD.PRNUM IS '부모댓글번호';
COMMENT ON COLUMN RBOARD.PRID IS '부모댓글아이디';
COMMENT ON COLUMN RBOARD.PRNICKNAME IS '부대댓글작성자(별칭)';
COMMENT ON COLUMN RBOARD.COLUMN1 IS '임시1';
COMMENT ON COLUMN RBOARD.COLUMN2 IS '임시2';
COMMENT ON COLUMN RBOARD.COLUMN3 IS '임시3';
--------------------------------------------------------
--  DDL for Table RBOARD_VOTE
--------------------------------------------------------
CREATE TABLE RBOARD_VOTE 
(RNUM NUMBER(10,0), 
BNUM NUMBER(10,0), 
RID VARCHAR2(40), 
VOTE VARCHAR2(10), 
CDATE DATE DEFAULT SYSTIMESTAMP, 
UDATE DATE DEFAULT SYSTIMESTAMP, 
COLUMN1 VARCHAR2(20)
) ;
COMMENT ON COLUMN RBOARD_VOTE.RNUM IS '댓글번호';
COMMENT ON COLUMN RBOARD_VOTE.BNUM IS '최초원글';
COMMENT ON COLUMN RBOARD_VOTE.RID IS '댓글아이디';
COMMENT ON COLUMN RBOARD_VOTE.VOTE IS 'GOOD:호감''BAD'':비호감';
COMMENT ON COLUMN RBOARD_VOTE.CDATE IS '투표일시';
COMMENT ON COLUMN RBOARD_VOTE.UDATE IS '투표일시';
COMMENT ON COLUMN RBOARD_VOTE.COLUMN1 IS '임시1';
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------
ALTER TABLE BOARD ADD CONSTRAINT BOARD_PK PRIMARY KEY (BNUM) ;
ALTER TABLE BOARD MODIFY (BNUM NOT NULL );
--------------------------------------------------------
--  Constraints for Table RBOARD
--------------------------------------------------------
ALTER TABLE RBOARD ADD CONSTRAINT RBOARD_PK PRIMARY KEY (RNUM) ;
ALTER TABLE RBOARD MODIFY (RNUM NOT NULL );
ALTER TABLE RBOARD MODIFY (BNUM NOT NULL );
ALTER TABLE RBOARD MODIFY (RID NOT NULL );
ALTER TABLE RBOARD MODIFY (RCDATE NOT NULL );
ALTER TABLE RBOARD MODIFY (RCONTENT NOT NULL );
--------------------------------------------------------
--  Constraints for Table BOARD_CATEGORY
--------------------------------------------------------
ALTER TABLE BOARD_CATEGORY ADD CONSTRAINT BOARD_CATEGORY_PK PRIMARY KEY (CID) ;
ALTER TABLE BOARD_CATEGORY ADD CONSTRAINT BOARD_CATEGORY CHECK (USE_YN in('남','여')) ENABLE;
ALTER TABLE BOARD_CATEGORY MODIFY (CID NOT NULL );
ALTER TABLE BOARD_CATEGORY MODIFY (CNAME NOT NULL );
ALTER TABLE BOARD_CATEGORY ADD UNIQUE (CNAME);
--------------------------------------------------------
--  Constraints for Table RBOARD_VOTE
--------------------------------------------------------
ALTER TABLE RBOARD_VOTE ADD CONSTRAINT RBOARD_VOTE_PK PRIMARY KEY (RNUM, BNUM, RID) ;
ALTER TABLE RBOARD_VOTE MODIFY (RNUM NOT NULL );
ALTER TABLE RBOARD_VOTE MODIFY (BNUM NOT NULL );
ALTER TABLE RBOARD_VOTE MODIFY (RID NOT NULL );
ALTER TABLE RBOARD_VOTE MODIFY (VOTE NOT NULL );
ALTER TABLE RBOARD_VOTE MODIFY (CDATE NOT NULL );
--------------------------------------------------------
--  Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------
ALTER TABLE BOARD_UPLOAD_FILE ADD CONSTRAINT BOARD_UPLOADE_FILE_PK PRIMARY KEY (FID) ;
ALTER TABLE BOARD_UPLOAD_FILE MODIFY (FID NOT NULL );
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------
ALTER TABLE BOARD ADD CONSTRAINT BOARD_FK1 FOREIGN KEY (BID)
  REFERENCES MEMBER (MEMBER_ID) ;
ALTER TABLE BOARD ADD CONSTRAINT BOARD_FK2 FOREIGN KEY (BCATEGORY)
  REFERENCES BOARD_CATEGORY (CID) ;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------
ALTER TABLE BOARD_UPLOAD_FILE ADD CONSTRAINT BOARD_UPLOADE_FILE_FK1 FOREIGN KEY (BNUM)
  REFERENCES BOARD (BNUM) ON DELETE CASCADE ;
--------------------------------------------------------
--  Ref Constraints for Table RBOARD
--------------------------------------------------------
ALTER TABLE RBOARD ADD CONSTRAINT RBOARD_FK1 FOREIGN KEY (BNUM)
  REFERENCES BOARD (BNUM) ;
ALTER TABLE RBOARD ADD CONSTRAINT RBOARD_FK2 FOREIGN KEY (RID)
  REFERENCES MEMBER (MEMBER_ID) ;
ALTER TABLE RBOARD ADD CONSTRAINT RBOARD_FK3 FOREIGN KEY (PRNUM)
  REFERENCES RBOARD (RNUM) ;  
--------------------------------------------------------
--  Ref Constraints for Table RBOARD_VOTE
--------------------------------------------------------
ALTER TABLE RBOARD_VOTE ADD CONSTRAINT RBOARD_VOTE_FK1 FOREIGN KEY (RNUM)
  REFERENCES RBOARD (RNUM) ON DELETE CASCADE ;
ALTER TABLE RBOARD_VOTE ADD CONSTRAINT RBOARD_VOTE_FK2 FOREIGN KEY (RID)
  REFERENCES MEMBER (MEMBER_ID) ;
