package com.sinau.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.ClassDao;
import com.sinau.dao.MemberDao;
import com.sinau.dao.PaymentDao;
import com.sinau.dao.pInfoPaymentDao;
import com.sinau.dto.CouponListDto;
import com.sinau.dto.MemberDto;
import com.sinau.dto.MyClassDto;
import com.sinau.dto.OffInfoDto;
import com.sinau.dto.OffListDto;
import com.sinau.dto.OffPayInfoComDto;
import com.sinau.dto.OffPayInfoDto;
import com.sinau.dto.OffScheduleDto;
import com.sinau.dto.OnListDto;
import com.sinau.dto.OnPayInfoComDto;
import com.sinau.dto.OnPayInfoDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.PInfoPaymentsDto;
import com.sinau.dto.PPayInfoComDto;
import com.sinau.dto.PPayInfoDto;
import com.sinau.dto.PayCouponDto;
import com.sinau.dto.ProdOrdersDto;

import lombok.extern.java.Log;

@Controller
@Log
public class PaymentService {
	@Autowired
	private ClassDao cDao;
	@Autowired
	private PaymentDao pDao;
	@Autowired
	pInfoPaymentDao piDao;
	ModelAndView mv;

	@Autowired
	HttpSession session;

	MemberDto loginMember;

	// 결제하기 위해 상품코드(오프라인), 회원 정보 가져오는 메소드
	public ModelAndView getPayment(String pay_pcode, String sc_code) {
		mv = new ModelAndView();

		loginMember = (MemberDto) session.getAttribute("mb");

		mv.addObject("sort", "ofc");
		
		log.info("pay_pcode : " + pay_pcode);
		log.info("m_email : " + loginMember.getM_email());
		log.info("sc_code : " + sc_code);

		// ofc_code에 해당하는 강좌 불러오는 메소드
		OffListDto offList = cDao.getOffApplyInfo(pay_pcode);
		mv.addObject("offList", offList);

		// 선택한 멤버 정보 불러오는 메소드
		MemberDto getMemPayInfo = pDao.getMemPayInfo(loginMember.getM_email());
		mv.addObject("memPayInfo", getMemPayInfo);

		// 멤버 m_email에 해당하는 dto list 불러오는 메소드
		List<PayCouponDto> payCoupon = pDao.getPayCouponList(loginMember.getM_email());
		mv.addObject("payCoupon", payCoupon);

		mv.addObject("m_email", loginMember.getM_email());
		mv.addObject("sc_code", sc_code);
		mv.addObject("ord_kind", 3);

		mv.setViewName("payment/payment");

		return mv;
	}


	// 결제완료시 주문내역, 마이클래스 Insert 메소드
	@Transactional
	public ModelAndView completionPay(OrderDto order, String sc_code, String cplcode) {
		log.info(sc_code + cplcode);

		mv = new ModelAndView();

		MemberDto member = ((MemberDto) session.getAttribute("mb"));

		order.setOrd_name(member.getM_name());
		order.setOrd_phone(member.getM_phone());
		order.setOrd_m_email(member.getM_email());

		try {
			
			if(cplcode != null) {
				pDao.cpUseDelCheck(cplcode);
			}
			pDao.orderInsert(order);


			OrderDto orderCheck = pDao.orderCheck(order.getOrd_code());
			mv.addObject("orderCheck", orderCheck);
			
			if (order.getOrd_pcode().contains("p")) {
				log.info(order.getOrd_pcode());
				PPayInfoComDto ordPCheck = pDao.ordPCheck(order.getOrd_code());
				mv.addObject("ordPCheck", ordPCheck);
				
				mv.addObject("sort", "prod");

				mv.setViewName("payment/payment_completion");
			} else {
				MyClassDto myClass = new MyClassDto();
				myClass.setMcl_classcode(order.getOrd_pcode());
				myClass.setMcl_m_email(order.getOrd_m_email());
				myClass.setMcl_ord_code(order.getOrd_code());

				

				if (order.getOrd_pcode().contains("ofc")) {
					myClass.setMcl_sc_code(sc_code);
					pDao.mclInsert(myClass);
					OffPayInfoComDto mclOffCheck = pDao.mclOffCheck(order.getOrd_code());
					mv.addObject("mclOffCheck", mclOffCheck);
					mv.addObject("sort", "ofc");

					mv.setViewName("payment/payment_completion");
				} 
				else if (order.getOrd_pcode().contains("onc")) {
					myClass.setMcl_sc_code(null);
					pDao.mclInsert(myClass);
					OnPayInfoComDto mclOnCheck = pDao.mclOnCheck(order.getOrd_code());
					mv.addObject("mclOnCheck", mclOnCheck);
					mv.addObject("sort", "onc");

				}

				mv.setViewName("payment/payment_completion");
			}
			
			
		} catch (Exception e) {
			log.info("payInsertERROR : " + e);
			mv.setViewName("payment/payment?ofc_code=" + order.getOrd_pcode() + "&m_email=" + order.getOrd_m_email()
					+ "&sc_code=" + sc_code);
		}

		return mv;
	}

	// 쿠폰 Dto 정보 가져오는 메소드
	public int getPayCoupon(String cplcode) {
		log.info("cplcode : " + cplcode);

		
		PayCouponDto payCoupList = pDao.getPayCoupon(cplcode);

		log.info(payCoupList.getCp_discount() +  "");


		return payCoupList.getCp_discount();
	}
}
