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
	
	
	
	@GetMapping("offline_info")
	public String offlineInfo() {
		
		return "offline/offline_info";
	}
	
	@GetMapping("offline_apply")
	public String offlineApply() {
		
		return "offline/offline_apply";
	}
	
	@GetMapping("payment")
	public String payment() {
		
		return "payment/payment";
	}
	
	@GetMapping("completion_pay")
	public String completionPay() {
		
		return "payment/completion_pay";
	}
	
	@GetMapping("offline_cate1")
	public String offlineCate1() {
		
		return "offline/offline_cate_1";
	}

	
	//오프라인 카테고리에 따라 강의 목록 가져오는 메소드
	@GetMapping("offline")
	public ModelAndView offline() {
		log.info("offline()");
		
		mv = cServ.getOffList();
		
		return mv;
	}
	
	//코드에 따라 강의 정보를 가져오는 메소드
	@GetMapping("offclass")
	public ModelAndView offClass(String offcode) {
		log.info("offcode : " + offcode);
		
		//DB에서 offcode(오프라인 강의 코드)에 해당하는 게시글 정보를 가져와서 model에 추가
		
		mv = cServ.getClass(offcode);
		
		return mv;
	}

}
