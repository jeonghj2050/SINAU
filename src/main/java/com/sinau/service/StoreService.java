package com.sinau.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.pInfoPaymentDao;
import com.sinau.dao.MemberDao;
import com.sinau.dao.ProductListDao;
import com.sinau.dao.StoreDao;
import com.sinau.dao.pInfoDao;
import com.sinau.dto.PInfoPaymentsDto;
import com.sinau.dto.PReviewDto;
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
	@Autowired
	pInfoPaymentDao piDao;
	@Autowired
	pInfoDao pInfoDao;
	

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
		
		PInfoPaymentsDto pInfoPay= piDao.getpInfoPay(p_code);
		mv.addObject("pInfoPay",pInfoPay);
		
		String pcont = plDao.getPcont(p_code);
		mv.addObject("pcont",pcont);
		
		//게시글 번호에 해당하는 댓글 목록/내용(DB)
		List<PReviewDto> reviewList = pInfoDao.getReviewList(p_code);
		mv.addObject("rList", reviewList);
		
		mv.addObject("p_code",p_code);
		
		mv.setViewName("store/store_info");

		return mv;
		
	}

	public Map<String, List<PReviewDto>> rInsert(PReviewDto review) {
		Map<String, List<PReviewDto>>rMap=null;
		
		try {
			//1.넘어온 댓글-> DB에 insert 처리
			pInfoDao.reviewInsert(review);
			//2.새로 추가된 댓글 포함 전체 댓글 목록 가져오기
			List<PReviewDto> rList = pInfoDao.getReviewList(review.getPrv_p_code());
			//3. 전체 댓글 목록을 rMap에 추가하여 반환
			rMap=new HashMap<String, List<PReviewDto>>();
			rMap.put("rList", rList);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			rMap=null;
		}
		
		return rMap;
	}


}



