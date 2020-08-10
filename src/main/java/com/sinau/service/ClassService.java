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
import com.sinau.dto.CategoryDto;
import com.sinau.dto.FilterCtsDto;
import com.sinau.dto.MemberDto;
import com.sinau.dto.MyClassDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffCtsDto;
import com.sinau.dto.OffImgDto;
import com.sinau.dto.OffInfoDto;
import com.sinau.dto.OffInfoSpecDto;
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

		loginMember = (MemberDto) session.getAttribute("mb");

		// 조회수 증가
		cDao.viewUpdate(ofc_code);

		// cont 사진 목록 받아오기
		log.info("getOffInfo() - ofc _ code : " + ofc_code);
		OffInfoSpecDto offInfoSpec = cDao.getOffInfoSpec(ofc_code);
		mv.addObject("offInfoSpec", offInfoSpec);
		
/*		String spec1 = cDao.getInfoSpec1(ofc_code);
		mv.addObject("spec1", spec1);
		String spec2 = cDao.getInfoSpec2(ofc_code);
		mv.addObject("spec2", spec2);
		String spec3 = cDao.getInfoSpec3(ofc_code);
		mv.addObject("spec3", spec3);*/

		// 게시글 번호로 DB 검색 결과 받아오기.(DB)
		OffInfoDto offInfo = cDao.getOffInfo(ofc_code);
		mv.addObject("offInfo", offInfo);

		mv.addObject("m_email", loginMember.getM_email());

		mv.setViewName("/offline/offline_info");

		return mv;
	} 

	// 서브 카테고리에 해당하는 서브 카테고리 이름,
	public ModelAndView getOffCateList(String cts_code) {
		

		loginMember = (MemberDto) session.getAttribute("mb");
		mv = new ModelAndView();

		CategoryDto ctsInfo = cDao.getCateInfo(cts_code);
		mv.addObject("ctsInfo", ctsInfo);

		List<OffCtsDto> offCate = cDao.getOffCate();
		mv.addObject("offCate", offCate);

		List<OffListDto> offCateList = cDao.getOffCateList(cts_code);
		mv.addObject("offCateList", offCateList);
		
		List<FilterCtsDto> filter1CtsList = cDao.getFilter1List();
		mv.addObject("filter1", filter1CtsList);
		List<FilterCtsDto> filter2CtsList = cDao.getFilter2List();
		mv.addObject("filter2", filter2CtsList);
		List<FilterCtsDto> filter3CtsList = cDao.getFilter3List();
		mv.addObject("filter3", filter3CtsList);
		

		mv.setViewName("/offline/offline_cate");
		return mv;
	}

	public ModelAndView getOffApply(String ofc_code) {
		loginMember = (MemberDto) session.getAttribute("mb");
		mv = new ModelAndView();

		log.info("aaaaaaaaaaaaaaaaaaaaa get ofc_code : " + ofc_code);
		log.info("m_email : " + ((MemberDto) session.getAttribute("mb")).getM_email());

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

	public ModelAndView getOffFilter(String cts_code, String filter1, String filter2, String filter3) {
		mv = new ModelAndView();
		
		CategoryDto ctsInfo = cDao.getCateInfo(cts_code);
		mv.addObject("ctsInfo", ctsInfo);

		List<OffCtsDto> offCate = cDao.getOffCate();
		mv.addObject("offCate", offCate);

		
		// 필터 1 불러오기
		// List<OffListDto> offCateFilterList = cDao.getOffCateFilterList(cts_code, filter1, filter2, filter3);
		// mv.addObject("offCateFilterList", offCateFilterList);

		return mv;
	}

	public ModelAndView getFilter1(String cts_code) {
		mv = new ModelAndView();
		
		List<OffListDto> offCateFilterList = cDao.getOffCateFilterList(cts_code);
		mv.addObject("offCateFilterList", offCateFilterList);
		
		return mv;
	}



}
