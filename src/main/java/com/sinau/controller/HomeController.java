package com.sinau.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.service.ClassService;
import com.sinau.service.YoutubeClassService;


@Controller
public class HomeController {
	ModelAndView mv;
	
	@Autowired
	ClassService cServ;
	
	@Autowired
	YoutubeClassService ycServ;
	
	@GetMapping("/")
	public ModelAndView home() {
		
		mv = cServ.gettotalList();
		
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
	
	@GetMapping("classcontents")
	public ModelAndView classcontents(String totalcode) {
		mv = new ModelAndView();
		
		if(totalcode.contains("onc")) {
			String onc_code = totalcode;
			mv = cServ.getOnlineInfo(onc_code);
		}else if (totalcode.contains("ofc")) {
			String ofc_code = totalcode;
			mv = cServ.getOffInfo(ofc_code);
		}
		
		return mv;
	}
}
