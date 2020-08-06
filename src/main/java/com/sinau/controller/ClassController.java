package com.sinau.controller;

import java.util.List;
import java.util.Map;
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

import com.sinau.dto.OrderDto;
import com.sinau.dto.PayCouponDto;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dto.LikesDto;
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
		
	@GetMapping("onlineInfo")
	public ModelAndView onlineInfo(String onc_code) {
		log.info("1111111111111"+onc_code);
		mv = cServ.getOnlineInfo(onc_code);
		
		return mv;
	}
	
	
	//강좌 상세 화면에서 회원 m_email를 포함한채 강좌 ofc_code에 해당하는 scList 출력하는 메소드 
	@GetMapping("apply")
	public ModelAndView offApply(String ofc_code) {
		log.info("offlineApply()" + ofc_code);
		mv = cServ.getOffApply(ofc_code);
		
		
		
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
	
	//쿠폰 사용 메소드
//	@PostMapping(value = "couponInsert",
//			produces = "application/json; charset=utf-8;")
//	@ResponseBody
//	public Map<String, List<PayCouponDto>> couponInsert(PayCouponDto payCoupon){
//		log.info("couponInsert - cpl_cp_code : " + payCoupon.getCpl_cp_code());
//		
//		Map<String, List<PayCouponDto>> pcMap = cServ.payCouponInsert(payCoupon);
//		
//		return pcMap;
//	}



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
	public ModelAndView classroom() {
		
		mv = cServ.classroom(null, null);
		
		return mv;
	}
}












