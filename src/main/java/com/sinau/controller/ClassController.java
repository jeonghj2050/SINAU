package com.sinau.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dto.LikesDto;
import com.sinau.service.ClassService;

import lombok.extern.java.Log;

@Controller
@Log
public class ClassController {
	ModelAndView mv;
	@Autowired
	ClassService cServ = new ClassService();
	
//	@GetMapping("online")
//	public ModelAndView online() {
//		
//		mv = cServ.getCategories();
//		
//		return mv;
//	}
	
	@GetMapping("online")
	public ModelAndView online() {
		
		mv = cServ.getOnList();
		
		return mv;
	}
	
	@GetMapping("onlineInfo")
	public ModelAndView onlineInfo(String onc_code) {
		log.info("1111111111111"+onc_code);
		mv = cServ.getOnlineInfo(onc_code);
		
		return mv;
	}
	
	@PostMapping(value = "likes", produces = "application/json; charset = utf-8")
	@ResponseBody
	public LikesDto likeAjax(String onc_code,String l_cts_code){
		log.info(onc_code + l_cts_code);

		LikesDto likes = cServ.updateLikes(onc_code,l_cts_code);
	
		return likes;
	}
	     
	@PostMapping(value = "dislikes", produces = "application/json; charset = utf-8")
	@ResponseBody
	public LikesDto dislikeAjax(String onc_code, String l_cts_code){
		log.info(onc_code+ l_cts_code);

		LikesDto dislikes = cServ.updatedisLikes(onc_code, l_cts_code);
	
		return dislikes;
	}
	
	@GetMapping("classroom")
<<<<<<< HEAD
	public ModelAndView classroom() {
		
		mv = cServ.classroom(null, null);
=======
	public ModelAndView classroom(String onc_code) {
		
		mv = cServ.classroom(onc_code);
>>>>>>> parent of f495396... Merge branch 'master' into eunkyung
		
		return mv;
	}
}












