package com.sinau.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.service.ClassService;
import com.sinau.service.YoutubeClassService;

import lombok.extern.java.Log;

@Controller
public class HomeController {
	ModelAndView mv;
	
	@Autowired
	ClassService cServ;
	
	@Autowired
	YoutubeClassService ycServ;
	
	@GetMapping("/")
	public ModelAndView home() {
		
		mv= cServ.onlineList();
		
		return mv;
	}

	@GetMapping("loginFrm")
	public String loginFrm() {

		return "loginFrm";
	}

	@GetMapping("joinFrm")
	public String joinFrm() {

		return "joinFrm";
	}
	
	@GetMapping("servicecenter_main")
	public String servicecenter() {
		
		return "servicecenter/servicecenter_main";
	}
	
	@GetMapping("id")
	public String id() {
		
		return "id";
	}
	
	@GetMapping("pwd")
	public String pwd() {
		
		return "pwd";
	}
	
	
}
