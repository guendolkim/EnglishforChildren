package com.kh.portfolio.newMember.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.newMember.vo.newMemberVO;

import lombok.RequiredArgsConstructor;



@RequiredArgsConstructor
@Repository
public class newMemberDAOImpl implements newMemberDAO {

	
	final JdbcTemplate jt;
	
	
	/**
	 * 신규회원등록
	 * @return
	 */
	@Override
	public int enrollNewMember(newMemberVO newmemberVO) {
		
		StringBuilder sql = new StringBuilder();
		

		sql.append("INSERT INTO newmember ( ");
		sql.append("    member_num, ");
		sql.append("    member_email, ");
		sql.append("    member_nickname, ");
		sql.append("    member_pw, ");
		sql.append("    member_tel, ");
		sql.append("    member_birth, ");
		sql.append("    member_pic, ");
		sql.append("    member_fname, ");
		sql.append("    member_ftype, ");
		sql.append("    member_fsize ");
		sql.append(") VALUES ( ");
		sql.append("    'member_'||MEMBER_NUM.nextval, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ? ");
		sql.append(") ");
		
		
		
		return jt.update(sql.toString(),newmemberVO.getMember_email(),newmemberVO.getMember_nickName(),
										newmemberVO.getMember_pw(),newmemberVO.getMember_tel(), 
										newmemberVO.getMember_birth(), 
										newmemberVO.getMember_pic(),
										newmemberVO.getMember_fname(),
										newmemberVO.getMember_ftype(),
										newmemberVO.getMember_fsize());
	}
	/**
	 * 회원가입처리 후 1명 조회(아이디 존재여부 판단도 가능)
	 * @param newmemberVO
	 * @return
	 */
	@Override
	public newMemberVO oneList(String member_email) {
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from newmember ");
		sql.append("    where member_email = ? ");
		
		newMemberVO newmemberVO = jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<newMemberVO>(newMemberVO.class),member_email);
		
		return newmemberVO;
	}
	
	/**
	 * 로그인을 위한 회원존재 확인
	 * @param member_email
	 * @return
	 */
	@Override
	public boolean existMember(String member_email) {
		boolean result = false;
		String sql ="select count(*) cnt from newmember where member_id = ? ";
		Integer cnt = jt.queryForObject(sql, Integer.class ,member_email);
		result = (cnt == 1) ? true : false;		
		return result;
	}
	
	
	/**
	 * 회원 로그인 처리
	 * @param member_email
	 * @param member_pw
	 * @return
	 */
	@Override
	public boolean isnewMember(String member_email, String member_pw) {
		boolean result = false;
		String sql ="select count(*) cnt from newmember where member_email = ? and member_pw = ?";
		
		int cnt = jt.queryForObject(sql, Integer.class ,member_email,member_pw);
//		Integer cnt = jt.queryForObject(sql, Integer.class, member_email);
		result = (cnt == 1) ? true : false;		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
