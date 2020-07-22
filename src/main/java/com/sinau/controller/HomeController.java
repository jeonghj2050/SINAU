package com.sinau.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dto.Member;
import com.sinau.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	private MemberService mServ;
	
	private ModelAndView mv;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@GetMapping("/")
	public String home() {
		logger.info("home()");
		
		return "home";
	}
	
	@GetMapping("loginFrm")
	public String loginFrm() {
		
		return "loginFrm";
	}
	
	@GetMapping("joinFrm")
	public String joinFrm() {
		
		return "joinFrm";
	}
	
	@PostMapping("memInsert")
	public ModelAndView memInsert(Member member,
			RedirectAttributes rttr) {
		logger.info("memInsert()");
		
		//서비스에서 처리
		mv = mServ.MemberInsert(member, rttr);
		
		return mv;
	}
	
	
}
