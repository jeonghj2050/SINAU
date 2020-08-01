package com.sinau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.ClassDao;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffCtsDto;
import com.sinau.dto.OffImgDto;
import com.sinau.dto.OffInfoDto;
import com.sinau.dto.OffListDto;

import lombok.extern.java.Log;

@Service
@Log
public class ClassService {
	@Autowired
	private ClassDao cDao;
	ModelAndView mv;
	

	//오프라인 카테고리에 해당하는 강의 목록을 가져온다.
	public ModelAndView getOffList() {
		
		mv = new ModelAndView();
	
		//강좌 목록 가져오는 메소드
		List<OffListDto> offList = cDao.getOffList();
		mv.addObject("offList", offList);

		//서브 카테고리 가져오는 메소드
		List<OffCtsDto> offCate = cDao.getOffCate();
		mv.addObject("offCate", offCate);
		
		mv.setViewName("offline/offline_main");
		
		
		return mv;
	}
//
//	public ModelAndView getOffCateList(String ofc_cts_code) {
//		mv = new ModelAndView();
//		
//		List<OffListDto> offCateList =cDao.getOffCateList(ofc_cts_code);
//		
//		mv.addObject("offCateList", offCateList);
//		mv.setViewName("offline/offline_main");
//		
//		
//		return mv;
//	}
	
//	public ModelAndView getClass(String offcode) {
//		mv = new ModelAndView();
//		
//		OffClassDto offClass = cDao.getClass(offcode);
//		mv.addObject("offClass", offClass);
//		
//		mv.setViewName("offClass");
//		
//		return mv;
//	}


//	public ModelAndView getOffCateList(String cts_code) {
//		mv = new ModelAndView();
//		
//		List<OffListDto> offCateList = cDao.getOffCateList(cts_code);
//		
//		mv.addObject("offCateList", offCateList);
//		mv.setViewName("offline/offline_cate/" + cts_code);
//		return mv;
//	}
	
	public ModelAndView getOffInfo(String ofc_code) {
		mv = new ModelAndView();

		// 조회수 증가. DB
		//cDao.viewUpdate(ofc_code);

		//cont 사진 목록 받아오기
		log.info("getOffInfo() - ofc _ code" + ofc_code);
		String spec1 = cDao.getInfoSpec1(ofc_code);
		mv.addObject("spec1", spec1);
		String spec2 = cDao.getInfoSpec2(ofc_code);
		mv.addObject("spec2", spec2);
		String spec3 = cDao.getInfoSpec3(ofc_code);
		mv.addObject("spec3", spec3);
	
		// 게시글 번호로 DB 검색 결과 받아오기.(DB)
		List<OffInfoDto> offInfo = cDao.getOffInfo(ofc_code);		
		mv.addObject("offInfo", offInfo);
		
		mv.setViewName("/offline/offline_info/info");

		return mv;
	}

	public ModelAndView getOffCateList(String cts_code) {
		mv = new ModelAndView();
		
		String ctsName = cDao.getCateName(cts_code);
		mv.addObject("offCateName", ctsName);
		
		List<OffCtsDto> offCate = cDao.getOffCate();
		mv.addObject("offCate", offCate);
		
		List<OffListDto> offCateList = cDao.getOffCateList(cts_code);
		mv.addObject("offCateList", offCateList);
		
		mv.setViewName("/offline/offline_cate/cate");
		return mv;
	}




}
