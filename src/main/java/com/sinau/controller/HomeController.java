package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.MemberDao;
import com.sinau.dto.MemberDto;
import com.sinau.service.CommonService;
import com.sinau.service.MemberService;
import com.sinau.service.ServiceCenterService;

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
