package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dto.MemberDto;
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
	
	@GetMapping("joinFrm")
	public String joinFrm() {
		
		return "joinFrm";
	}

	
	
	@GetMapping("store")
	public String store() {
		
		return "store/store";
	}
	
	/*
	 * @GetMapping("home") public ModelAndView bo
	 */
}
