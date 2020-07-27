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
import com.sinau.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	private ClassService cServ;
	private ModelAndView mv;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	
	@GetMapping("offline")
	public String offline() {
		logger.info("offline()");
		
		return "offline";
	}
}
