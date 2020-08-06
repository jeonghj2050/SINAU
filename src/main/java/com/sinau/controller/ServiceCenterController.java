package com.sinau.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.service.ServiceCenterService;

import lombok.extern.java.Log;

@Log
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
	
	@GetMapping("servicecenter_refund")//list?pageNum=3
	public ModelAndView servicecenterrefund() {	

		mv = scServ.getRefundList();
		
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


	//게시글 수정
	@GetMapping("updateFrm") 
	public ModelAndView updateFrm(String q_code,
			RedirectAttributes rttr) { 
		mv = scServ.updateFrm(q_code, rttr);

		return mv; 
	}

	@PostMapping("boardUpdate")
	public String boardUpdate(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		String view = scServ.boardUpdate(multi, rttr);

		return view;
	}

	@GetMapping("delete")
	public String deleteBoard(String q_code, RedirectAttributes rttr) {
		String view = scServ.deleteBoard(q_code, rttr); 
		return view;
	}

	@GetMapping(value = "fdelete", 
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String fileDelete(String fname, HttpServletRequest req) {
		log.info(fname);
		String result = scServ.fileDelete(fname);
		
		return result;
	}
	
	@GetMapping("download")
	public void fileDownload(String sysFileName,
			HttpServletRequest req,
			HttpServletResponse resp) {
		log.info("download() - sysFileName : " 
				+ sysFileName);

		scServ.fileDown(sysFileName, req, resp);
	}
	 
	



}
