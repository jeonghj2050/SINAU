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
	
	@PostMapping("completion_pay")
	public ModelAndView completionPay(OrderDto order, String sc_code, String cplcode) {
		log.info("completion_pay()" + cplcode);
		
		mv = pServ.completionPay(order, sc_code, cplcode);
		
		return mv;
	}
	
	//쿠폰 사용 메소드
	@PostMapping(value = "getCoupon",
			produces = "application/json; charset=utf-8;")
	@ResponseBody
	public int getPayCoupon(String cplcode) {
		log.info("getPayCoupon - cpl_code : " + cplcode);
		
		
		int msg = pServ.getPayCoupon(cplcode);
		
		return msg;
	}
	
	

}
