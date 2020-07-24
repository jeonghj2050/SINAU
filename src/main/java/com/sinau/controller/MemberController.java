package com.sinau.controller;

import java.awt.color.CMMException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dto.MyCouponDto;
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

	@GetMapping("like")
	public ModelAndView like() {
		//임의의 로그인 회원 아이디
		String email="kc@naver.com";

		//상품,온라인, 오프라인 좋아요 내역을 검색한다.
		mv=mServ.getAllLikes(email);
		return mv;
	}

	@GetMapping("mypageCoupon")
	public ModelAndView mypageCoupon() {
		//임의의 로그인 회원 아이디
		String email="kc@naver.com";
		
		//회원의 쿠폰 목록을 가져온다.
		mv=mServ.getCouponList(email);
		
		return mv;
	}
	
	//쿠폰 등록을 위한 비동기 처리 메소드
	@PostMapping(value = "mypageCoupon",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<MyCouponDto>> mypageCoupon(String email,String cp_code){
		//쿠폰 등록 후 쿠폰 목록을 다시 반환
		//댓글 등록 후 댓글 리스트를 반환하기 위한 메소드
		System.out.println(cp_code);
		Map<String, List<MyCouponDto>> cpList=mServ.inputCoupon(email,cp_code);
	
		return cpList;
	}
	
	//주문 취소하는 메소드
//	@GetMapping('/resetOrder')
}
