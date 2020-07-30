package com.sinau.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.MemberDao;
import com.sinau.dao.ProductListDao;
import com.sinau.dao.StoreDao;
import com.sinau.dto.MemberDto;
import com.sinau.dto.ProductListDto;

import lombok.extern.java.Log;

@Service
@Log
public class StoreService {
	ModelAndView mv;
	@Autowired
	HttpSession session;
	@Autowired
	MemberDao mDao;
	@Autowired
	StoreDao sDao;
	@Autowired
	ProductListDao plDao;

	//상품 탑10
	public ModelAndView getProductList(String cts_code) {
		String view=null;
		String msg=null;
		// TODO Auto-generated method stub
		mv=new ModelAndView();
		if(cts_code==null) {
			List<ProductListDto> productList=plDao.getProductList(10);
			mv.addObject("productList",productList);

			List<ProductListDto> pArtList=plDao.getpArtList("sa");
			mv.addObject("pArtList",pArtList);			

			List<ProductListDto> pEleList=plDao.getpEleList("sb");
			mv.addObject("pEleList",pEleList);

			List<ProductListDto> pHList=plDao.getpHList("sc");
			mv.addObject("pHList",pHList);

			List<ProductListDto> pMusicList=plDao.getpMusicList("sd");
			mv.addObject("pMusicList",pMusicList);

			List<ProductListDto> pFoodList=plDao.getpFoodList("se");
			mv.addObject("pFoodList",pFoodList);

			mv.setViewName("store/store");		
		}

		return mv;
	}

	public ModelAndView getPList(String cts_code) {
		// TODO Auto-generated method stub

		mv= new ModelAndView();

		List<ProductListDto> pArtList=plDao.getpArtList("sa");
		mv.addObject("pArtList",pArtList);

		mv.setViewName("store/store_cts");	


		return mv;
	}

	public ModelAndView getpInfo(String p_code) {
		// TODO Auto-generated method stub
			mv=new ModelAndView();
		
		String pspec = plDao.getPspec(p_code);
		mv.addObject("pspec",pspec);
		
		mv.setViewName("store/store_info");

		return mv;
	}


}



