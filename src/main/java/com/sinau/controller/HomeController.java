package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.MemberDao;
import com.sinau.dto.Member;
import com.sinau.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService mServ;
	
	private ModelAndView mv;
	

	
	@GetMapping("/")
	public String home() {
		
		return "home";
	}
	
	@GetMapping("loginFrm")
	public String loginFrm() {
		
		return "loginFrm";
	}
	
	@GetMapping("group")
	public String group() {
		
		return "group";
	}
	
	@GetMapping("joinFrm")
	public String joinFrm() {
		
		return "joinFrm";
	}
	
	@GetMapping(value = "idCheck",
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(String memail) {
		
		String result = mServ.idCheck(memail);
		
		return result;
	}

	
	@PostMapping("memberInsert") 
	public ModelAndView memInsert(Member member,
			 RedirectAttributes rttr) { 
	mv = mServ.memberInsert(member, rttr);
	 
	return mv;
	}
	 
	
	
}
