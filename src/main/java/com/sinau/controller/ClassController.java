package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.service.ClassService;

import lombok.extern.java.Log;

@Controller
@Log
public class ClassController {
	
	@Autowired
	private ClassService cServ;
	ModelAndView mv;
	
	@GetMapping("list")
	public ModelAndView classList(Integer cateNum) {
	log.info("classList()");
	
//	mv = cServ.getClassList(cateNum);
	
	return mv;
	}

}
