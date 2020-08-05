package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dto.OrderDto;
import com.sinau.service.ClassService;

import lombok.extern.java.Log;

@Controller
@Log
public class ClassController {

	@Autowired
	private ClassService cServ;
	ModelAndView mv;
	
	
	
	
	//코드에 따라 강의 정보를 가져오는 메소드
	@GetMapping("info")
	public ModelAndView offClass(String ofc_code) {
		log.info("ofc_code : " + ofc_code);
		
		//DB에서 offcode(오프라인 강의 코드)에 해당하는 게시글 정보를 가져와서 model에 추가
		
		mv = cServ.getOffInfo(ofc_code);
		
		return mv;
	}
	
	//카테고리 코드에 따라 강의 리스트를 가져오는 메소드
		@GetMapping("cate")
		public ModelAndView offCate(String cts_code) {
			log.info("cts_code : " + cts_code);
			
			mv = cServ.getOffCateList(cts_code);
			
			
			return mv;
		}
		
	//오프라인 카테고리에 따라 강의 목록 가져오는 메소드
	@GetMapping("offline")
	public ModelAndView offline() {
		log.info("offlineInfo()");
		mv = cServ.getOffList();
		
		
		return mv;
	}
	
	
	//강좌 상세 화면에서 회원 m_email를 포함한채 강좌 ofc_code에 해당하는 scList 출력하는 메소드 
	@GetMapping("apply")
	public ModelAndView offApply(String ofc_code, String m_email) {
		log.info("offlineApply()" + ofc_code + m_email);
		mv = cServ.getOffApply(ofc_code, m_email);
		
		
		
		return mv;
	}

	
	@GetMapping("payment")
	public ModelAndView payment(String ofc_code, String m_email, String sc_code) {
		log.info("offlinePayment() : " + ofc_code);		
		mv = cServ.getOffPay(ofc_code, m_email, sc_code);
		
		return mv;
	}
	
	@PostMapping("completion_pay")
	public ModelAndView completionPay(OrderDto order, String sc_code) {
		log.info("completion_pay()" + order.getOrd_price());
		
		mv = cServ.completionPay(order, sc_code);
		
		return mv;
	}



}
