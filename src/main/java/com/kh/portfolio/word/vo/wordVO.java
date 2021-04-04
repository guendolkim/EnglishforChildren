package com.kh.portfolio.word.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class wordVO {

	private String word_num;				//WORD_NUM	VARCHAR2(50 BYTE)
	private String new_word;				//NEW_WORD	VARCHAR2(50 BYTE)
	private String old_word;				//OLD_WORD	VARCHAR2(50 BYTE)
	private String remove_word;				//REMOVE_WORD	VARCHAR2(50 BYTE)
	private String word_mean;				//WORD_MEAN	CLOB
	private Timestamp word_cdate;			//WORD_CDATE	TIMESTAMP(6)
}