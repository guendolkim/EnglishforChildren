package com.kh.portfolio.newMember;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.newMember.svc.newMemberSVC;
import com.kh.portfolio.newMember.vo.newMemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class newMemberSVCImplTest {

	@Autowired
	newMemberSVC newmemberSVC;
	
	
	
	@Test
	void enroll() {
		newMemberVO newmemberVO = new newMemberVO();
		
		newmemberVO.setMember_email("test3@test.com");
		newmemberVO.setMember_pw("test123");
		newmemberVO.setMember_nickName("happday23");
		newmemberVO.setMember_tel("010-0000-0003");
		
		int result = newmemberSVC.enrollNewMember(newmemberVO);
		
		log.info("cnt" + result);
	}
	
}
