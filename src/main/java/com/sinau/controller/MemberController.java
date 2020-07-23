package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

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

	@GetMapping("mypageOffline")
	public ModelAndView mypageOffline() {
		//임의의 로그인 회원 아이디
		String email="kc@naver.com";

		//로그인 회원이 주문한 내역 중 오프라인 강의 목록을 가져온다.
		mv=mServ.getMyOfflineList(email);

		return mv;
	}

	@GetMapping("mypageUpdate")
	public ModelAndView mypageUpdate() {
		//임의의 로그인 회원 아이디
		String email="kc@naver.com";

		//수정 페이지에 보여질 기존 회원 정보를 가져온다.
		mv=mServ.getMemberInfo(email);

		return mv;
	}
	@PostMapping("mypageUpdate")
	public ModelAndView mypageUpdate(String newPwd) {
		//임의의 로그인 회원 아이디
		String email="kc@naver.com";

		//넘어온 새 비밀번호로 회원의 비밀번호를 수정한다.
		mv=mServ.updateMemberPwd(email,newPwd);

		return mv;
	}

	@GetMapping("mypageOrder")
	public ModelAndView mypageOrder() {
		//임의의 로그인 회원 아이디
		String email="kc@naver.com";
		
		//상품,온라인,오프라인 주문 내역을 검색한다.
		mv=mServ.getAllOrders(email);
		return mv;
	}
}
