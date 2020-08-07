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
import com.sinau.dto.MemberDto;
import com.sinau.dto.MyClassDto;
import com.sinau.dto.OffListDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.PayCouponDto;

import lombok.extern.java.Log;

@Controller
@Log
public class PaymentService {
	@Autowired
	private ClassDao cDao;
	@Autowired
	private PaymentDao pDao;
	ModelAndView mv;

	@Autowired
	HttpSession session;

	MemberDto loginMember;

	// 결제하기 위해 상품코드(온라인, 오프라인, 스토어), 회원 정보 가져오는 메소드
	public ModelAndView getOffPay(String ofc_code, String m_email, String sc_code) {
		mv = new ModelAndView();

		log.info("ofc_code : " + ofc_code);
		log.info("m_email : " + m_email);
		log.info("sc_code : " + sc_code);

		// ofc_code에 해당하는 강좌 불러오는 메소드
		OffListDto offList = cDao.getOffApplyInfo(ofc_code);
		mv.addObject("offList", offList);

		// 선택한 멤버 정보 불러오는 메소드
		MemberDto getMemPayInfo = pDao.getMemPayInfo(m_email);
		mv.addObject("memPayInfo", getMemPayInfo);

		// 멤버 m_email에 해당하는 dto list 불러오는 메소드
		List<PayCouponDto> payCoupon = pDao.getPayCouponList(m_email);
		mv.addObject("payCoupon", payCoupon);

		mv.addObject("m_email", m_email);
		mv.addObject("sc_code", sc_code);

		mv.setViewName("payment/payment");

		return mv;
	}

	// 결제완료시 주문내역, 마이클래스 Insert 메소드
	@Transactional
	public ModelAndView completionPay(OrderDto order, String sc_code) {
		log.info(order.getOrd_price() + "");

		mv = new ModelAndView();

		order.setOrd_name(loginMember.getM_name());
		order.setOrd_phone(loginMember.getM_phone());

		String view = null;

		try {
			pDao.orderInsert(order);

			MyClassDto myClass = new MyClassDto();
			myClass.setMcl_classcode(order.getOrd_pcode());
			myClass.setMcl_m_email(order.getOrd_m_email());
			myClass.setMcl_ord_code(order.getOrd_code());
			myClass.setMcl_sc_code(sc_code);

			pDao.mclInsert(myClass);
			mv.setViewName("payment/payment_completion");
		} catch (Exception e) {
			log.info("payInsertERROR : " + e);
			mv.setViewName("payment/payment?ofc_code=" + order.getOrd_pcode() + "&m_email=" + order.getOrd_m_email()
					+ "&sc_code=" + sc_code);

		}

		return mv;
	}

	//쿠폰 Dto 정보 가져오는 메소드
	public int getPayCoupon(String cpcode) {
		String view = null;
		log.info("cpcode : " + cpcode);
		
		PayCouponDto payCoupList = pDao.getPayCoupon(cpcode);
		mv.addObject("payCoupList", payCoupList);
		
		return payCoupList.getCp_discount();
	}
}
