package com.sinau.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.MemberDao;
import com.sinau.dto.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	private ModelAndView mv;
	
	
	
	public String idCheck(String memail) {
		String result = null;

		try {
			
			//cnt : 중복 id가 있을 경우 1, 없을 경우 0
			int cnt = mDao.idCheck(memail);
			if(cnt == 1) {
				result = "fail";
			}
			else {
				result = "success";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



	public ModelAndView memberInsert(Member member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;
		
		//비밀번호 암호화 처리
		//스프링 시큐리티는 암호화만 해줌.
		//복호화는 안해줌.
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();
		
		//위의 인코더를 사용하여 평문 비밀번호를 
		//암호 비밀번호로 변경
		String encPwd = pwdEncoder.encode(member.getM_pwd());
		//암호화된 비밀번호를 member에 다시 저장
		member.setM_pwd(encPwd);
		
		try {
			//member의 데이터를 DB 저장(insert)
			mDao.memberInsert(member);
			//회원 등록 성공 -> 로그인 화면으로 전환
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "가입 성공");
		} catch (Exception e) {
			// 회원 등록 실패 -> 같은 화면에 실패 메시지 전달
			//e.printStackTrace();
			view = "redirect:joinFrm";
			rttr.addFlashAttribute("msg", "아이디 중복");
		}
		
		mv.setViewName(view);
		return mv;
	}




}
