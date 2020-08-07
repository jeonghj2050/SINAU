package com.sinau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dto.OrderDto;
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

	@GetMapping("payment")
	public ModelAndView payment(String ofc_code, String m_email, String sc_code) {
		log.info("offlinePayment() : " + ofc_code);		
		mv =pServ.getOffPay(ofc_code, m_email, sc_code);
		
		return mv;
	}
	
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
