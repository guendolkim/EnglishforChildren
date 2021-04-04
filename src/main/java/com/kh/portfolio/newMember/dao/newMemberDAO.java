package com.kh.portfolio.newMember.dao;

import com.kh.portfolio.newMember.vo.newMemberVO;

public interface newMemberDAO {

	/**
	 * 신규회원등록
	 * @return
	 */
	int enrollNewMember(newMemberVO newmemberVO);
	
	/**
	 * 회원가입처리 후 1명 조회(아이디 존재여부 판단도 가능)
	 * @param newmemberVO
	 * @return
	 */
	newMemberVO oneList(String member_email);
	
	/**
	 * 로그인을 위한 회원존재 확인
	 * @param member_email
	 * @return
	 */
	 boolean existMember(String member_email);
	
	
	/**
	 * 회원 로그인 처리
	 * @param member_email
	 * @param member_pw
	 * @return
	 */
	boolean isnewMember(String member_email, String member_pw);
	
	
	
	
}
