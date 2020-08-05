package com.sinau.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.service.ClassService;

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
}
