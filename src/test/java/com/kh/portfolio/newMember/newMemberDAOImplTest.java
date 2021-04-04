package com.kh.portfolio.newMember;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.newMember.dao.newMemberDAO;
import com.kh.portfolio.newMember.vo.newMemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class newMemberDAOImplTest {

	@Autowired
	newMemberDAO newmemberDAO;
	
	@Autowired
	JdbcTemplate jt;
	
	@Test
//	@Disabled
	void enrollNewMember()	{
		
		newMemberVO newmemberVO = new newMemberVO();
		
		newmemberVO.setMember_email("test2@test.com");
		newmemberVO.setMember_pw("test123");
		newmemberVO.setMember_nickName("happday2");
		newmemberVO.setMember_tel("010-0000-0002");
		
		int result = newmemberDAO.enrollNewMember(newmemberVO);
		
		log.info("cnt" + result);
	}
	
	@Test
	void oneList() {
		String member_num = "member_1";
		newMemberVO newmemberVO = newmemberDAO.oneList(member_num);
		
		log.info(newmemberVO.toString());
	}
}
