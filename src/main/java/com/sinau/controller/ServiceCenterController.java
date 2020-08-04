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

	
	@PostMapping("boardWrite")
	public String boardWrite
	(MultipartHttpServletRequest multi, 
			RedirectAttributes rttr) {
		String view = scServ.boardInsert(multi, rttr);
		
		
		return view;
	}
	
	@GetMapping("contents") 
	public ModelAndView boardContents(String q_code) {
	 
		//DB에서 bnum(게시글 번호)에 해당하는 게시글 //정보를 가져와서 model에 추가. mv =
		mv=scServ.getContents(q_code);
	
		return mv; 
	}
	 
	
	
	
	
	
	
	
}
