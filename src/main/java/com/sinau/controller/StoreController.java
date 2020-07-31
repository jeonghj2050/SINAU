package com.sinau.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dto.PReviewDto;
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
		public Map<String, List<PReviewDto>> 
		replyInsert(PReviewDto review){
			log.info("reviewInsert - bnum : " 
					+ review.getPrv_p_code());	

			Map<String, List<PReviewDto>> rMap = 
					sServ.rInsert(review);

			return rMap;
		}
}
