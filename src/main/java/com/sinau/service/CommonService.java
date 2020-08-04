package com.sinau.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.ClassDao;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.OrderDto;

@Service
public class CommonService {
	
	ModelAndView mv;
	
	@Autowired
	ClassDao cDao;

	/*
	 * public ModelAndView getClassList() { mv = new ModelAndView();
	 * 
	 * Map<String, String> lmap = new HashMap<String, String>();
	 * 
	 * List<OnlineClassDto> bList = cDao.getList(lmap);
	 * 
	 * 
	 * mv.addObject("bList", bList);
	 * 
	 * 
	 * mv.setViewName("home");
	 * 
	 * return mv; }
	 */
}
