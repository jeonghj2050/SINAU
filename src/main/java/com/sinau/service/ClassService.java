package com.sinau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.ClassDao;
import com.sinau.dto.OffClassDto;
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
	
		List<OffListDto> offList = cDao.getOffList();
		
		
		mv.addObject("offList", offList);
		mv.setViewName("offline/offline_main");
		
		
		return mv;
	}

	
	public ModelAndView getClass(String offcode) {
		mv = new ModelAndView();
		
		OffClassDto offClass = cDao.getClass(offcode);
		mv.addObject("offClass", offClass);
		
		mv.setViewName("offClass");
		
		return mv;
	}

}
