package com.sinau.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.java.Log;

@Controller
public class HomeController {

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
	
	@GetMapping("youtube") 
	public String youtube() {
		
		return "youtube/youtube_main";
	}
}
