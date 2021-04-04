package com.kh.portfolio.book.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class bookVO {

	private String book_num;				//BOOK_NUM	VARCHAR2(20 BYTE)
	private String book_ko_name;			//BOOK_KO_NAME	VARCHAR2(100 BYTE)
	private String book_en_name;			//BOOK_EN_NAME	VARCHAR2(100 BYTE)
	private String book_ko_author;			//BOOK_KO_AUHTHOR	VARCHAR2(30 BYTE)
	private String book_en_author;			//BOOK_EN_AUHTHOR	VARCHAR2(30 BYTE)
	private Long book_level;				//BOOK_LEVEL	NUMBER(2,0)
	private String book_ko_content;			//BOOK_KO_CONTENT	CLOB
	private String book_en_content;			//BOOK_EN_CONTENT	CLOB
	private Timestamp book_cdate;			//BOOK_CDATE	TIMESTAMP(6)
	
	private MultipartFile file;
	private String fsize;					//FSIZE	VARCHAR2(45 BYTE)
	private String fname;					//FNAME	VARCHAR2(45 BYTE)
	private byte[]book_pic;					//BOOKPIC	BLOB
	private String ftype;					//FTYPE	VARCHAR2(50 BYTE)
}
