package com.sinau.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.ClassDao;
import com.sinau.dao.MemberDao;
import com.sinau.dto.MemberDto;
import com.sinau.dto.MyClassDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffCtsDto;
import com.sinau.dto.OffImgDto;
import com.sinau.dto.OffInfoDto;
import com.sinau.dto.OffListDto;
import com.sinau.dto.OffOrdScDto;
import com.sinau.dto.OffScheduleDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.PayCouponDto;
import com.sinau.dto.ScheduleDto;

import lombok.extern.java.Log;

@Service
@Log
public class ClassService {
	@Autowired
	private ClassDao cDao;
	@Autowired
	private MemberDao mDao;
	ModelAndView mv;
	
	@Autowired
	HttpSession session;

	MemberDto loginMember;
	// 오프라인 카테고리에 해당하는 강의 목록을 가져온다.
	public ModelAndView getOffList() {

		mv = new ModelAndView();

		// 강좌 목록 가져오는 메소드
		List<OffListDto> offList = cDao.getOffList();
		mv.addObject("offList", offList);

		// 서브 카테고리 가져오는 메소드
		List<OffCtsDto> offCate = cDao.getOffCate();
		mv.addObject("offCate", offCate);

		mv.setViewName("offline/offline_main");

		return mv;
	}

	public ModelAndView getOffInfo(String ofc_code) {
		mv = new ModelAndView();
		

		loginMember=(MemberDto) session.getAttribute("mb");

		// 로그인 시 삭제해야하는 email 임시 값

		// 조회수 증가. DB 왜 안돼;;
		// cDao.viewUpdate(ofc_code);

		// cont 사진 목록 받아오기
		log.info("getOffInfo() - ofc _ code : " + ofc_code);
		String spec1 = cDao.getInfoSpec1(ofc_code);
		mv.addObject("spec1", spec1);
		String spec2 = cDao.getInfoSpec2(ofc_code);
		mv.addObject("spec2", spec2);
		String spec3 = cDao.getInfoSpec3(ofc_code);
		mv.addObject("spec3", spec3);

		// 게시글 번호로 DB 검색 결과 받아오기.(DB)
		OffInfoDto offInfo = cDao.getOffInfo(ofc_code);
		mv.addObject("offInfo", offInfo);


		mv.addObject("m_email",loginMember.getM_email());

		mv.setViewName("/offline/offline_info");

		return mv;
	}

	// 서브 카테고리에 해당하는 서브 카테고리 이름, 
	public ModelAndView getOffCateList(String cts_code) {
		mv = new ModelAndView();

		String ctsName = cDao.getCateName(cts_code);
		mv.addObject("offCateName", ctsName);

		List<OffCtsDto> offCate = cDao.getOffCate();
		mv.addObject("offCate", offCate);

		List<OffListDto> offCateList = cDao.getOffCateList(cts_code);
		mv.addObject("offCateList", offCateList);

		mv.setViewName("/offline/offline_cate");
		return mv;
	}

	public ModelAndView getOffApply(String ofc_code) {
		mv = new ModelAndView();

		log.info("aaaaaaaaaaaaaaaaaaaaa get ofc_code : " + ofc_code);
		log.info("m_email : " + ((MemberDto)session.getAttribute("mb")).getM_email());

		
		OffListDto offList = cDao.getOffApplyInfo(ofc_code);
		mv.addObject("offList", offList);

		List<OffScheduleDto> offSchedule = cDao.getOffScehdule(ofc_code);
		mv.addObject("offSchedule", offSchedule);



		mv.addObject("m_email", loginMember.getM_email());

		mv.setViewName("offline/offline_apply");

		return mv;
	}

	public ModelAndView getOffLoc(String ofc_code) {
		mv = new ModelAndView();

		String ofcLoc = cDao.getOffLoc(ofc_code);
		mv.addObject("ofcLoc", ofcLoc);
		return mv;
	}

	public ModelAndView getOffPay(String ofc_code, String m_email, String sc_code) {
		mv = new ModelAndView();

		log.info("ofc_code : " + ofc_code);
		log.info("m_email : " + m_email);
		log.info("sc_code : " + sc_code);
		
		
		// ofc_code에 해당하는 강좌 불러오는 메소드
		OffListDto offList = cDao.getOffApplyInfo(ofc_code);
		mv.addObject("offList", offList);

		// 선택한 멤버 정보 불러오는 메소드
		MemberDto getMemPayInfo = cDao.getMemPayInfo(m_email);
		mv.addObject("memPayInfo", getMemPayInfo);

		// 멤버 m_email에 해당하는 dto list 불러오는 메소드
		List<PayCouponDto> payCoupon = cDao.getPayCoupon(m_email);
		mv.addObject("payCoupon", payCoupon);

		mv.addObject("m_email", m_email);
		mv.addObject("sc_code", sc_code);

		
		
		mv.setViewName("payment/payment");


		return mv;
	}

	@Transactional
	public ModelAndView completionPay(OrderDto order, String sc_code) {
		log.info(order.getOrd_price()+"");
		
		mv = new ModelAndView();
		
		order.setOrd_name(loginMember.getM_name());
		order.setOrd_phone(loginMember.getM_phone());

		
		String view = null;


		try {
			cDao.orderInsert(order);

			MyClassDto myClass = new MyClassDto();
			myClass.setMcl_classcode(order.getOrd_pcode());
			myClass.setMcl_m_email(order.getOrd_m_email());
			myClass.setMcl_ord_code(order.getOrd_code());
			myClass.setMcl_sc_code(sc_code);
	
			cDao.mclInsert(myClass);
			mv.setViewName("payment/payment_completion");
		} catch (Exception e) {
			log.info("payInsertERROR : " + e);
			mv.setViewName("payment/payment?ofc_code="+order.getOrd_pcode()+"&m_email="+order.getOrd_m_email()+"&sc_code="+sc_code);
			
		}

		return mv;
	}

	public ModelAndView getPayResult(String ord_code) {
		// TODO Auto-generated method stub
		return null;
	}

	
//	public Map<String, List<PayCouponDto>> payCouponInsert(PayCouponDto payCoupon) {
//		Map<String, List<PayCouponDto>> cpMap = null;
//		
//		try {
//			//1. 선택한 쿠폰 DB에서 insert 처리
//			
//		}
//		return null;
//	}

}
