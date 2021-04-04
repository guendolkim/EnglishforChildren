package com.kh.portfolio.newMember.vo;

import java.sql.Timestamp;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;



@Data
public class newMemberVO {

	private String member_num;			//MEMBER_NUM	VARCHAR2(20 BYTE)
	private String member_email;		//MEMBER_EMAIL	VARCHAR2(50 BYTE)
	private String member_pw;			//MEMBER_PW	VARCHAR2(50 BYTE)
	private String member_nickName;		//MEMBER_NICKNAME	VARCHAR2(50 BYTE)
	private String member_tel;			//MEMBER_TEL	VARCHAR2(30 BYTE)
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate member_birth;		//MEMBER_BIRTH	DATE
	private Timestamp member_cdate;		//MEMBER_CDATE	TIMESTAMP(6)
	private Timestamp member_udate;		//MEMBER_UDATE	TIMESTAMP(6)
	
	private MultipartFile file;
	private byte[] member_pic;//MEMBER_PIC	BLOB
	private String member_fname;//MEMBER_FNAME	VARCHAR2(50 BYTE)
	private String member_ftype;//MEMBER_FTYPE	VARCHAR2(50 BYTE)
	private String member_fsize;//MEMBER_FSIZE	VARCHAR2(50 BYTE)
	
	//view에 display용도
		private String picBase64;
}
