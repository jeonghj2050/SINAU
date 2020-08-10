package com.sinau.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dto.LikesDto;
import com.sinau.dto.MemberDto;
import com.sinau.dto.PReviewDto;
import com.sinau.dto.WarningDto;
//import com.sinau.dto.ProductListDto;
import com.sinau.service.MemberService;
import com.sinau.service.StoreService;

import lombok.extern.java.Log;

@Controller
@Log
public class StoreController {
	@Autowired
	private MemberService mServ;
	@Autowired
	private StoreService sServ;

	//데이터 전달 객체 
	ModelAndView mv;

	@GetMapping("store")
	public ModelAndView store(String cts_code) {
		log.info("store()");

		//상품 목록을 가져온다.
		mv= sServ.getProductList(cts_code);

		return mv;
	}


	@GetMapping("store_cts")
	public ModelAndView storeCts(String cts_code) {
		log.info("store_cts()");

		//상품 목록을 가져온다.
		mv= sServ.getPList(cts_code);

		return mv;
	}

	@GetMapping("store_info")
	public ModelAndView storeInfo(String p_code) {
		log.info("store_info()");

		//상품 정보를 가져온다.
		mv=sServ.getpInfo(p_code);

		return mv;
	}


	//댓글 추가 및 댓글 목록 처리 메소드
	@PostMapping(value = "reviewInsert",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, PReviewDto> 
	replyInsert(PReviewDto review){
		log.info("reviewInsert - bnum : " 
				+ review.getPrv_p_code());	

		Map<String, PReviewDto> rMap = 
				sServ.rInsert(review);

		return rMap;
	}


	@PostMapping(value = "reviewDelete", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<PReviewDto>> 
	getReviewList(String prv_code){
		log.info("post delete reply");
		int result =0;
		PReviewDto review = new PReviewDto();

		log.info(prv_code);

		Map<String, List<PReviewDto>> rMap =sServ.rvidCheck(prv_code);	


		return rMap;


	}


	@PostMapping(value = "warningInsert", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> WarningInsert(WarningDto wDto) {
		log.info("warningInsert() : " + wDto.getW_m_email());
		Map<String, String> rMap = sServ.wInsert(wDto);

		return rMap;
	}
	


}