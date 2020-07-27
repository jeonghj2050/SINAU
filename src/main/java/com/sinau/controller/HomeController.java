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
	
	@Autowired
	private MemberService mServ;
	
	private ModelAndView mv;
	
	@Autowired
	private CommonService cServ;
	@Autowired
	private ServiceCenterService scServ;
	

	
	@GetMapping("/")
	public String home() {
		
		/* mv=cServ.getClassList(); */
		
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

	@GetMapping("servicecenter_main")//list?pageNum=3
	public ModelAndView servicecenter(Integer pageNum) {
		System.out.println("dfsdnfafdfljfhdljcjc;jkdfl");

		mv = scServ.getQnaList(pageNum);		

		return mv;
	}
	
	@GetMapping("store")
	public String store() {
		
		return "store/store";
	}
	
	/*
	 * @GetMapping("home") public ModelAndView bo
	 */
}
