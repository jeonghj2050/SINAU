package com.sinau.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.sinau.dto.AdPCtsDto;
import com.sinau.dto.AdPReviewDto;
import com.sinau.dto.AdPStoreDto;
import com.sinau.dto.AdQFileDto;
import com.sinau.dto.AdQnaInfoDto;
import com.sinau.dto.AdSQnaDto;
import com.sinau.dto.AdSWDto;
import com.sinau.dto.AdYouClassDto;
import com.sinau.dto.AdminDto;

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
	private int listCount = 14; //게시글 수
	private int pageCount = 5;  //페이지 수

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
	//게시글 강의
	public ModelAndView adPLecture() {

		List<AdOnlineClassDto> ponList=cDao.getOnline();
		List<AdOfflineClassDto> pofList=cDao.getOffline();
		List<AdYouClassDto> pyList=cDao.getYoutube();

		List<AdPCtsDto> ctsList=cDao.getcate();

		System.out.println(ctsList.size());

		List<AdOnlineClassDto> onc = new ArrayList<AdOnlineClassDto>();
		List<AdOfflineClassDto> ofc = new ArrayList<AdOfflineClassDto>();
		List<AdYouClassDto> pc = new ArrayList<AdYouClassDto>();

		List<AdPCtsDto> pcts = new ArrayList<AdPCtsDto>();

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
		for(AdPCtsDto cts:ctsList) {
			pcts.add(cts);
			mv.addObject("pcts",pcts);
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
	//회원 승인
	public ModelAndView adMemApproval(String email) {
		aDao.getstate(email);

		mv.setViewName("redirect:adMApproval");
		return mv;
	}
	//신고처리 승인
	public ModelAndView warYes(String code) {
		log.info(code);
		aDao.getWState(code);

		mv.setViewName("redirect:adSWarning");
		return mv;
	}
	//신고비승인 
	public ModelAndView warNo(String code) {
		log.info(code);
		aDao.getWState(code);

		mv.setViewName("redirect:adSWarning");
		return mv;
	}
	//카테고리분류(안씀)
	public ModelAndView ctscode(String cts) {
		log.info(cts);
		List<AdOnlineClassDto> list= cDao.getCts(cts);

		mv.addObject("onc", list);

		/* mv.setViewName("redirect:adPLecture"); 
		 *  addOBject 후에 redirect는 파일이 날아갈 수 있음
		 * */ 
		return mv;
	}
	//qna 상세페이지 받아옴
	public ModelAndView qCode(String code) {
		AdQFileDto qFile=null;
		log.info("code>>>>>"+code);
		AdSQnaDto qInfo=cDao.getQnaInfo(code);
		
		qFile=cDao.getQnaFile(code);
		System.out.println("qList>>>>>>"+qInfo+"//qFile>>"+qFile);
		
		if(qFile != null) {
			mv.addObject("file", qFile);
		}else {
			mv.addObject("file", null);
		}
		
		mv.addObject("question", qInfo);
		mv.setViewName("admin/ad_serv_qnaInfo");
		return mv;
		
	}
	//qna 답변 입력
	public ModelAndView qInsert(String content,String code) {
		log.info("내용 : "+content+"코드 : "+code);
		aDao.getQnaInsert(content,code);
		mv.setViewName("redirect:adSQna");
		return mv;
	}
	
	public void fileDown(String sysFileName, HttpServletRequest req, HttpServletResponse resp) {
	      //파일 경로 찾기
	            String filePath = req.getSession()
	                  .getServletContext()
	                  .getRealPath("/") + "resources/upload/";

	            //DB에서 sysFileName으로 oriFileName 검색
	            String oriName = cDao.getOriName(sysFileName);

	            //실제 파일 저장 폴더 경로와 파일 지정
	            filePath += sysFileName;

	            //서버의 디스크(폴더)에 저장된 파일을 읽어오는 객체
	            InputStream is = null;
	            //사용자의 컴퓨터에 파일을 보내는 객체
	            OutputStream os = null;

	            try {
	               //파일명의 한글 깨짐 방지(encoding)
	               String dFileName = URLEncoder.encode
	                     (oriName, "UTF-8");

	               //파일 객체 생성
	               File file = new File(filePath);
	               //저장된 파일과 메모리 상의 파일 객체의 연결
	               is = new FileInputStream(filePath);

	               //응답(response) 객체의 헤더 설정.
	               resp.setContentType("application/octet-stream");
	               resp.setHeader("content-Disposition",
	                     "attachment; filename=\"" 
	                           + dFileName + "\"");
	               //attachment; filename="p2.jpg"

	               //사용자 컴퓨터로 통로 연결
	               os = resp.getOutputStream();

	               //파일 전송
	               byte[] buffer = new byte[1024];
	               int length;
	               while((length = is.read(buffer)) != -1) {
	                  os.write(buffer, 0, length);
	               }
	            }catch (Exception e) {
	               e.printStackTrace();
	            }finally {
	               try {
	                  os.flush();//남아있는 출력 스트림의 데이터를
	                  //모두 전송해라~~~
	                  //출력 스트림(os)를 close하기 전에 flush 할것.
	                  os.close();
	                  is.close();
	               }catch (Exception e) {
	                  e.printStackTrace();
	               }
	            }
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






















