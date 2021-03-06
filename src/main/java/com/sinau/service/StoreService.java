package com.sinau.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.pInfoPaymentDao;
import com.sinau.dao.MemberDao;
import com.sinau.dao.ProductListDao;
import com.sinau.dao.StoreDao;
import com.sinau.dao.WarningDao;
import com.sinau.dao.pInfoDao;
import com.sinau.dto.PInfoPaymentsDto;
import com.sinau.dto.PReviewDto;
import com.sinau.dto.LikesDto;
import com.sinau.dto.MemberDto;
import com.sinau.dto.OnInfoDto;
import com.sinau.dto.ProductListDto;
import com.sinau.dto.WarningDto;

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

	@Autowired
	WarningDao wDao;


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

	public Map<String, PReviewDto> rInsert(PReviewDto review) {
		Map<String, PReviewDto>rMap=null;

		try {
			//1.넘어온 댓글-> DB에 insert 처리
			pInfoDao.reviewInsert(review);

			//2.새로 추가된 댓글 포함 전체 댓글 목록 가져오기
			review = pInfoDao.getReview(review.getPrv_code());

			//3. 전체 댓글 목록을 rMap에 추가하여 반환
			rMap=new HashMap<String, PReviewDto>();
			rMap.put("review", review);

		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			rMap=null;
		}

		return rMap;
	}

	public  Map<String, List<PReviewDto>>  rvidCheck(String prv_code) { // TODO Auto-generated method stub
		Map<String, List<PReviewDto>> rMap= new HashMap<String, List<PReviewDto>>();
		PReviewDto review = new PReviewDto();


		MemberDto member = ((MemberDto)session.getAttribute("mb"));
		String m_email =  pInfoDao.replyUserIdCheck(prv_code);

		if(member.getM_email().equals(m_email)) {


			pInfoDao.deleteReply(prv_code);

			List<PReviewDto> rList=pInfoDao.getReviewList(prv_code);

			rMap.put("rList", rList);


		}

		return rMap; 

	}


	public Map<String, String> wInsert(WarningDto wDto) {
		Map<String, String> rMap = new HashMap<String, String>();
		String view = null;

		String content= null;
		if(wDto.getW_contentNum().equals("1")) {
			content = "비방 및 욕설" ;
		}else if(wDto.getW_contentNum().equals("2")) {
			content ="부적절한 홍보";
		}else {
			content="음란성 또는 청소년에게 부적합한 내용";
		}
		
		wDto.setW_content(content);
			
		try {
			wDao.warningInsert(wDto);

			rMap.put("result", "SUCE");
		}
		catch(Exception e) {
			//DB 삽입 오류 시 글쓰기폼으로 돌아감.
			rMap.put("result", "FAIL");
		}		

		return rMap;
	}
	
}

