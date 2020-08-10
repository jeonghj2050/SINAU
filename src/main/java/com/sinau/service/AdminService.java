package com.sinau.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;


import com.sinau.dao.AdClassDao;
import com.sinau.dao.AdminDao;
import com.sinau.dao.MemberDao;
import com.sinau.dto.AdOfflineClassDto;
import com.sinau.dto.AdOnlineClassDto;
import com.sinau.dto.AdPReviewDto;
import com.sinau.dto.AdPStoreDto;
import com.sinau.dto.AdSQnaDto;
import com.sinau.dto.AdSWDto;
import com.sinau.dto.AdYouClassDto;
import com.sinau.dto.AdminDto;
import com.sinau.util.Paging;
import com.sinau.dto.FilesDto;
import com.sinau.dto.QuestionInfoDto;

import lombok.extern.java.Log;

@Service
@Log
public class AdminService {
	ModelAndView mv = new ModelAndView();
	@Autowired
	HttpSession session;
	@Autowired
	MemberDao mDao;
	@Autowired
	AdminDao aDao;
	@Autowired
	AdClassDao cDao;

	//페이지당 글 개수 조정 변수
	private int listCount = 5;
	private int pageCount = 2;
	
	public ModelAndView getAdminList(Integer pageNum) {
		// TODO Auto-generated method stub
		log.info("getAdminList() - pageNum : " + pageNum);

		mv = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;

		//맵을 만들어서 페이지번호와 글목록 개수를 저장
		Map<String, String> lmap = 
				new HashMap<String, String>();
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));

		List<AdminDto> bList = aDao.getList(lmap);

		mv.addObject("bList", bList);

		String paging = getPaging(num);
		mv.addObject("paging", paging);

		//세션에 페이지 번호 저장.
		session.setAttribute("pageNum", num);

		//view name을 지정!
		mv.setViewName("ad_mem_approval");

		return mv;
		
	}	
	
	private String getPaging(int num) {
		//전체 글 개수 구하기
		int maxNum = aDao.getListCount();
		String listName = "adMApproval";//게시판 uri

		Paging paging = new Paging(maxNum, num, 
				listCount, pageCount, listName);

		String pagingHtml = paging.makePaging();

		log.info(pagingHtml);
		
		return pagingHtml;
	}





	//가입승인 목록 리스트 (승인구분에 따라 리스트를 가져온다)
	public ModelAndView adMemList(String tabId) {

		

		//email에 해당하는 회원정보 가져오기
		List<AdminDto> dList=aDao.getMemStateDm(1);
		List<AdminDto> cList=aDao.getMemStateCm(1);
		System.out.println(dList.size());
		System.out.println(cList.size());

		List<AdminDto> cList1=new ArrayList<AdminDto>();
		List<AdminDto> dList1=new ArrayList<AdminDto>();

		for (AdminDto m:cList) {
			if(m.getM_group().equals("cm")) {
				cList1.add(m);
			}else if(m.getM_group().equals("dm")) {
				dList1.add(m);
			}
			mv.addObject("cList1",cList1);
			mv.addObject("dList1",dList1);
		}
		
		for (AdminDto d:dList) {
			if(d.getM_group().equals("cm")) {
				cList1.add(d);
			}else if(d.getM_group().equals("dm")) {
				dList1.add(d);
			}
			mv.addObject("cList1",cList1);
			mv.addObject("dList1",dList1);
		}
		if(tabId == null) {
			tabId = "tab-1";
		}
		mv.addObject("tabId", tabId);
		mv.setViewName("admin/ad_mem_approval");
		return mv;

	}
	public ModelAndView adMList(String tabId) {

		List<AdminDto> nmList=aDao.getMemStateNm(2);
		List<AdminDto> dmList=aDao.getMemStateDm(2);
		List<AdminDto> cmList=aDao.getMemStateCm(2);

		System.out.println(dmList.size());

		List<AdminDto> cList2=new ArrayList<AdminDto>();
		List<AdminDto> dList2=new ArrayList<AdminDto>();
		List<AdminDto> nList2=new ArrayList<AdminDto>();
		
		for (AdminDto m:nmList) {
			nList2.add(m);
			mv.addObject("nList2",nList2);
		}
		for (AdminDto c:cmList) {
			cList2.add(c);
			mv.addObject("cList2",cList2);
		}
		for (AdminDto d:dmList) {
			dList2.add(d);
			mv.addObject("dList2",dList2);
		}
//
//			if(m.getM_group().equals("cm")) {
//				cList2.add(m);
//			}else if(m.getM_group().equals("dm")) {
//				dList2.add(m);
//			}else if(m.getM_group().equals("nm")) {
				
//			}
//
//			mv.addObject("cList2",cList2);
//			mv.addObject("dList2",dList2);
		if(tabId == null) {
			tabId = "tab-1";
		}
		
		mv.addObject("tabId", tabId);
			
		mv.setViewName("admin/ad_mem_list");
			
		return mv;

	}
	public ModelAndView adPLecture() {
		
		List<AdOnlineClassDto> ponList=cDao.getOnline();
		List<AdOfflineClassDto> pofList=cDao.getOffline();
		List<AdYouClassDto> pyList=cDao.getYoutube();
		
		System.out.println(ponList.size());
		
		List<AdOnlineClassDto> onc = new ArrayList<AdOnlineClassDto>();
		List<AdOfflineClassDto> ofc = new ArrayList<AdOfflineClassDto>();
		List<AdYouClassDto> pc = new ArrayList<AdYouClassDto>();
		
		for(AdOnlineClassDto p:ponList) {
			onc.add(p);
			mv.addObject("onc",onc);
		}
		for(AdOfflineClassDto f:pofList) {
			ofc.add(f);
			mv.addObject("ofc",ofc);
		}
		for(AdYouClassDto y:pyList) {
			pc.add(y);
			mv.addObject("pc",pc);
		}

		mv.setViewName("admin/ad_post_lecture");
		return mv;
	}
	public ModelAndView adPStore() {
		List<AdPStoreDto> psList=cDao.getStore();
		System.out.println(psList.size());
		
		List<AdPStoreDto> store = new ArrayList<AdPStoreDto>();
		
		for(AdPStoreDto s:psList) {
			store.add(s);
			mv.addObject("store",store);
		}
		mv.setViewName("admin/ad_post_sale");
		return mv;
	}
	public ModelAndView adPReview() {
		List<AdPReviewDto> prList=cDao.getReview();
		System.out.println(prList.size());
		
		List<AdPReviewDto> review = new ArrayList<AdPReviewDto>();
		
		for(AdPReviewDto r:prList) {
			review.add(r);
			mv.addObject("review",review);
		}

		mv.setViewName("admin/ad_post_review");
		return mv;
	}
	public ModelAndView adSQna() {
		List<AdSQnaDto> qList=cDao.getQna();
		System.out.println(qList.size());
		
		List<AdSQnaDto> qna = new ArrayList<AdSQnaDto>();
		
		for(AdSQnaDto q:qList) {
			qna.add(q);
			mv.addObject("qna", qna);
		}
		mv.setViewName("admin/ad_serv_qna");
		return mv;
	}
	public ModelAndView adSWarning() {
		List<AdSWDto> wList=cDao.getWarning();
		
		List<AdSWDto> warning = new ArrayList<AdSWDto>();
		
		for(AdSWDto w:wList) {
			warning.add(w);
			mv.addObject("warning", warning);
		}
		mv.setViewName("admin/ad_serv_warning");
		return mv;
	}
	//비승인 회원 삭제
	public ModelAndView appDelete(String email, String tabId) {
		aDao.getMemDel(email);
		
		mv.setViewName("redirect:adMApproval?tabId="+tabId);
		return mv;
	}
	//회원삭제
	public ModelAndView memberDelete(String email, String tabId) {
		String view = null;
		aDao.getMemDel(email);

		System.out.println(email+'1');
		mv.setViewName("redirect:adMList?tabId="+tabId);
	
		return mv;
	}
	//강의삭제
	public ModelAndView lecDelete(String code) {
		
		log.info(code);
		String subcode = code.substring(0, 2);
		if(subcode.equals("on")) {
			aDao.getLecDel(code);
		}
		else if(subcode.equals("of")) {
			aDao.getOfDel(code);
		}
		else {
			aDao.getYDel(code);
		}
		
		mv.setViewName("redirect:adPLecture");
		return mv;
	}
	//판매 삭제
	public ModelAndView saleDelete(String code) {
		
		aDao.getSaleDel(code);
		
		mv.setViewName("redirect:adPStore");
		return mv;
	}
	//리뷰삭제
	public ModelAndView reviewDelete(String code) {
		
		aDao.getReDel(code);
		
		mv.setViewName("redirect:adPReview");
		return mv;
	}
	
	
//	   public  Map<String, List<AdminDto>>  memberCheck(String m_email) { // TODO Auto-generated method stub
//		      Map<String, List<AdminDto>> rMap= new HashMap<String, List<AdminDto>>();
//		      AdminDto memDel = new AdminDto();
//
//
//		      AdminDto member = ((AdminDto)session.getAttribute("mb"));
//		      String m_email =  AdminDao.memberCheck(m_email);
//
//		      if(member.getM_email().equals(m_email)) {
//
//
//		         aDao.memberDelete(m_email);
//
//		         List<AdminDto> rList=AdminDto.memberCheck(m_email);
//
//		         rMap.put("rList", rList);
//
//
//		      }
//
//		      return rMap; 
//
//		   }
//	public Map<String, List<AdminDto>> deleteMember(String m_email) {
//		
//		return null;
//	}
	
}






















