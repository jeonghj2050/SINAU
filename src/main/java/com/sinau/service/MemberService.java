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
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;
	
	public ModelAndView loginProc(Member member, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();
		
		String view = null;
		String msg = null;
		
		String get_pw = mDao.getPwd(member.getM_email());
		
		BCryptPasswordEncoder pwdEncoder = 
				new BCryptPasswordEncoder();
		
		//로그인 처리
		if(get_pw != null) {
			if(pwdEncoder.matches(member.getM_pwd(), get_pw)) {
				member = mDao.getMemInfo(member.getM_email());
				session.setAttribute("mb", member);
				
				view = "redirect:home";
			}
			else {
				view = "redirect:loginFrm";
				msg = "패스워드가 맞지 않습니다.";
			}
		}
		else {
			view = "redirect:joinFrm";
			msg = "회원가입 후 이용바랍니다.";
		}
		
		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		return mv;
	}
	
	public ModelAndView MemberInsert(Member member, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;
		
		BCryptPasswordEncoder pwdEncoder = 
				new BCryptPasswordEncoder();
		
		String encpwd = pwdEncoder.encode(member.getM_pwd());
		
		member.setM_pwd(encpwd);
		
		try {
			mDao.memberInsert(member);
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "가입 성공");
		} catch (Exception e) {
			view = "redirect:joinFrm";
			rttr.addFlashAttribute("msg", "아이디 중복");
		}
		
		mv.setViewName(view);
		return mv;
		
	}
	


	
	
	
	
}
