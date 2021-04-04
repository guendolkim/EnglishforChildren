package com.kh.portfolio.newMember;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.portfolio.newMember.svc.newMemberSVC;
import com.kh.portfolio.newMember.vo.newMemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member")
@Controller
public class newMemberController {

	private final newMemberSVC newmemberSVC;
	
	/**
	 *회원가입페이지 이동
	 * @return
	 */
	@GetMapping("/enrollNewMemberForm")
	public String enrollNewMemberForm() {
		
		return "/member/enroll";
	}
	/**
	 * 회원가입처리
	 * @param newmemberVO
	 * @return
	 */
	@PostMapping("/enrollNewMember")
	public String enrollNewmember(newMemberVO newmemberVO) {
		
		int result = 0;
		String viewName = null;
		
		result = newmemberSVC.enrollNewMember(newmemberVO);
		
		if(result == 1) {
			viewName = "/member/enroll_ok";
			log.info("okokokok");
		}else {
			viewName = "/member/enroll";
		}
		
		return viewName;
	}
	//-------------------------------로그인 & 아웃 처리---------------------------------
	
	//로그인
	@GetMapping("/loginForm")
	public String loginForm() {
		
		return "/member/loginForm";
	}
	
	
	
	@PostMapping("/login")
	public String login(
			@RequestParam("member_email") String member_email,
			@RequestParam("member_pw") String member_pw,
			Model model, HttpSession session) {
		
		//로그인 성공, 실패시 보여줄 페이지를 저장하는 변수
		String view = null;
		
		log.info("idasasa:"+member_email);
		log.info("pw:"+member_pw);
		
		//1회원이면
		if(newmemberSVC.existMember(member_email)) {
			
			if(newmemberSVC.isnewMember(member_email, member_pw)) {
				session.setAttribute("member", newmemberSVC.oneList(member_email));
				
				view = "index";
			}else {
				model.addAttribute("svr_msg", "가입하지 않거나, 잘못된 비밀번호입니다.");
				view = "/member/loginForm";
			}
		}else {
			model.addAttribute("svr+msg", "가입되지 않은 아이디입니다.");
			view = "/member/loginForm";
		}		
		return view;
	}
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		//세션정보 제거
		session.invalidate();
		
		return "redirect:/";
	}
	
}
