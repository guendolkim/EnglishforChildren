package com.kh.portfolio.newMember.svc;

import java.io.IOException;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import com.kh.portfolio.newMember.dao.newMemberDAO;
import com.kh.portfolio.newMember.vo.newMemberVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class newMemberSVCImpl implements newMemberSVC {

	private final newMemberDAO newmemberDAO;
	
	@Override
	public int enrollNewMember(newMemberVO newmemberVO) {
		
		if(newmemberVO.getFile().getSize() > 0) {
			try {
				newmemberVO.setMember_pic(newmemberVO.getFile().getBytes());
				newmemberVO.setMember_fname(newmemberVO.getFile().getOriginalFilename());
				newmemberVO.setMember_ftype(newmemberVO.getFile().getContentType());
				newmemberVO.setMember_fsize(String.valueOf(newmemberVO.getFile().getSize()));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		return newmemberDAO.enrollNewMember(newmemberVO);
	}
	
		//이미지 base64로 변환후 img태그에 적용하기위함
		//Base64의 핵심은 바이너리 데이터를 ASCII코드로 변경하는 인코딩방식
		private String conversionToBase64(byte[] pic) {
			byte[] encoded = Base64.encodeBase64(pic);
			return new String(encoded);
		}

		/**
		 * 로그인을 위한 회원존재 확인
		 * @param member_email
		 * @return
		 */
		@Override
		public boolean existMember(String member_email) {
			// TODO Auto-generated method stub
			return newmemberDAO.existMember(member_email);
		}
		
		/**
		 * 회원 로그인 처리
		 * @param member_email
		 * @param member_pw
		 * @return
		 */
		@Override
		public boolean isnewMember(String member_email, String member_pw) {
			
			
			return newmemberDAO.isnewMember(member_email, member_pw);
	}
		

		/**
		 * 회원가입처리 후 1명 조회(아이디 존재여부 판단도 가능)
		 * @param newmemberVO
		 * @return
		 */
		@Override
		public newMemberVO oneList(String member_email) {
			
			return newmemberDAO.oneList(member_email);
		}
		
		
}
