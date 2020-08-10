package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dto.OrderDto;
import com.sinau.dto.PInfoPaymentsDto;
import com.sinau.service.ClassService;
import com.sinau.service.PaymentService;

import lombok.extern.java.Log;

@Controller
@Log
public class PaymentController {
	@Autowired
	private ClassService cServ;
	@Autowired
	private PaymentService pServ;
	ModelAndView mv;

	//오프라인 -> 페이먼트 이동 메소드
	@GetMapping("offPayment")
	public ModelAndView payment(String pay_pcode, String sc_code) {
		log.info("offlinePayment() : " + pay_pcode + "Aaaaa" + sc_code);		
		mv =pServ.getPayment(pay_pcode, sc_code);
		
		return mv;
	}
	
//	//온라인 -> 페이먼트 이동 메소드
//	@GetMapping("storePayment")
//	public ModelAndView payment(PInfoPaymentsDto pInfoPay, String p_code, int ord_kind) {
//		log.info("offlinePayment() : " + p_code);		
//		
//		
//		
//		mv =pServ.getStorePay(pInfoPay, p_code, ord_kind);
//		
//		return mv;
//	}

	// 결제완료시 주문내역, 마이클래스 Insert 메소드d
	@PostMapping("completion_pay")
	public ModelAndView completionPay(OrderDto order, String sc_code) {
		log.info("completion_pay()" + order.getOrd_price());
		
		mv = pServ.completionPay(order, sc_code);
		
		return mv;
	}
	
	//쿠폰 사용 메소드
	@PostMapping(value = "getCoupon",
			produces = "application/json; charset=utf-8;")
	@ResponseBody
	public int getPayCoupon(String cpcode) {
		log.info("getPayCoupon - cpl_cp_code : " + cpcode);
		
		
		int msg = pServ.getPayCoupon(cpcode);
		
		return msg;
	}
	
	

}
