package com.sinau.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dto.OnlineClassDto;
import com.sinau.service.MemberService;

import lombok.extern.java.Log;

@Controller
@Log
public class MemberController {
	ModelAndView mv;
	@Autowired
	MemberService mServ=new MemberService();
	
	@GetMapping("/mypage")
	public ModelAndView mypage() {
		//임의의 로그인 회원 아이디
		String email="kc@naver.com";
		//로그인 회원의 구분에 따라 다른 view를 넘긴다.
		String m_group=mServ.getLoginMemberGroup(email);
		
		//로그인 회원이 주문한 내역 중 온라인 강의 목록을 가져온다.
		mv=mServ.getMyOnlineList(email,m_group);
		
		return mv;
	}
}
