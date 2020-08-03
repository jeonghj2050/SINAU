package com.sinau.controller;

import javax.activation.CommandMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dto.QuestionDto;
import com.sinau.service.ServiceCenterService;


@Controller
public class ServiceCenterController {
	
	private ModelAndView mv;
	
	@Autowired
	private ServiceCenterService scServ;
	
	@GetMapping("servicecenter_write")//list?pageNum=3
	public String servicecenterwrite() {	

		return "servicecenter/servicecenter_write";
				
	}

	@GetMapping("servicecenter_question")//list?pageNum=3
	public ModelAndView servicecenterquestion() {

		mv = scServ.getQnaList();		

		return mv;
	}
	//writeFrm에서 들어온 데이터 처리 메소드
	//action uri는 "boardWrite"
	@PostMapping("boardInsert")
	public String boardInsert
	(MultipartHttpServletRequest multi, 
			RedirectAttributes rttr) {
		String view = scServ.boardInsert(multi, rttr);
		
		
		return view;
	}
	
	
	
	
	
}
