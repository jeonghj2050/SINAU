package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.service.ServiceCenterService;
import com.sinau.service.YoutubeClassService;

@Controller
public class YoutubeController {
	
	private ModelAndView mv;
	
	@Autowired
	private YoutubeClassService ycServ;
	
	@GetMapping("youtuber") 
	public ModelAndView youtube() {
		
		mv= ycServ.getYcList();
		
		return mv;
	}
	
	
	@GetMapping("ycontents") 
	public ModelAndView boardContents(String y_code) {

		//DB에서 bnum(게시글 번호)에 해당하는 게시글 //정보를 가져와서 model에 추가. mv =
		mv=ycServ.getContents(y_code);

		return mv; 
	}

	
	
	
	
	
	
	
	
}
