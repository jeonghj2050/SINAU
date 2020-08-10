package com.sinau.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.CategoryDao;
import com.sinau.dao.ClassDao;
import com.sinau.dao.ClassInfoDao;
import com.sinau.dto.CategoryDto;
import com.sinau.dto.LikesDto;
import com.sinau.dto.MemberDto;
import com.sinau.dto.OffCtsDto;
import com.sinau.dto.OffInfoDto;
import com.sinau.dto.OffListDto;
import com.sinau.dto.OffScheduleDto;
import com.sinau.dto.OnInfoDto;
import com.sinau.dto.OnListDto;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.SpecListDto;

import lombok.extern.java.Log;

@Service
@Log
public class ClassService {
	//DAO 객체 선언
		@Autowired
		private CategoryDao cateDao;
		@Autowired
		private ClassDao cDao;
		@Autowired
		private ClassInfoDao cInfoDao;
		@Autowired
		MemberDao mDao;
		
		@Autowired
		HttpSession session;
		
		ModelAndView mv;
		
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
		String email=((MemberDto)session.getAttribute("mb")).getM_email();
		
		//spec 이미지 3개 저장
		List<SpecListDto> onSpecList = cInfoDao.SpecList(onc_code);
		mv.addObject("onSpecList", onSpecList);
		log.info("onSpecList()");		
		
		//content 이미지 및 내용 저장
	    log.info("hashMap()");
	    
	    if(email.equals("") || email == null) {
	    	log.info("비회원!!!");
	    	List<OnInfoDto> onInfol = cInfoDao.onInfo(onc_code);
	    	
	    	OnInfoDto onInfo = onInfol.get(0);
	    	onInfo.setL_state(0);
			mv.addObject("onInfo", onInfo);
			log.info("onInfo()");
	    }
	    else {
	    	log.info("로그인!!!");
	    	List<OnInfoDto> onLInfoList  = cInfoDao.onInfo(onc_code);
	    	boolean flag=false;
	    	for(OnInfoDto onLInfo:onLInfoList) {
	    		log.info("여기까지 실행!!!!"+onLInfo.getL_m_email());
	    		
	    		if(onLInfo.getL_m_email().equals(email)) {
	    			mv.addObject("onInfo", onLInfo);
	    			flag=true;
	    		}
	    	}
	    	if(flag==false) {
	    		OnInfoDto onInfo = onLInfoList.get(0);
		    	onInfo.setL_state(0);
				mv.addObject("onInfo", onInfo);
				log.info("onLInfo()");
	    	}
	    	
	    }
		
//		request.setAttribute("onInforeq", onInfo);
		
		mv.setViewName("online/online_info");
		
		return mv;
	}

	public LikesDto updateLikes(String onc_code,String l_cts_code) {
		String email=((MemberDto)session.getAttribute("mb")).getM_email();
		log.info("updateLikes()"+onc_code);
		LikesDto likes=new LikesDto();
		
		
	    //like 정보 있는지 확인하기
	    String checkLike = cInfoDao.searchLike(onc_code,email);
	    
	    if (checkLike == null) {
	    	log.info("updateLikes()11111111111"+onc_code);
	    	likes.setL_cts_code("onc");
	    	likes.setL_m_email(email);
	    	likes.setL_pcode(onc_code);
	    	
			cInfoDao.like_input(likes);
			cInfoDao.like_up(onc_code);
		}
	    else {
	    	log.info("updateLikes()22222222222"+onc_code);
		    cInfoDao.like_check(onc_code,email);
		    log.info("updateLikes()3333333333333"+onc_code);
		    cInfoDao.like_up(onc_code);
	    }
	    log.info("updateLikes()44444444444444444"+onc_code);
		LikesDto ldto = cInfoDao.getLikes(onc_code,email);
		log.info("updateLikes()555555555555555555"+onc_code);
	    return ldto;
	}

	public LikesDto updatedisLikes(String onc_code,  String l_cts_code) {
		log.info("updatedisLikes()"+onc_code+l_cts_code);
		
		String email=((MemberDto)session.getAttribute("mb")).getM_email();

	    
	    log.info("hash()2");
	    
	    cInfoDao.dislike_check(onc_code,email);
	    cInfoDao.dislike_down(onc_code);
	    
		LikesDto ldto = cInfoDao.getLikes(onc_code,email);
	    
	    return ldto;
	}

	public ModelAndView classroom(String onc_code, String email) {
		log.info("classroom()");
		
		HashMap <String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("onc_code", onc_code);
	    hashMap.put("email", email);
		
	    ClassroomDto classroom = cDao.getCR(hashMap);
	    
		return mv;
	}
	

		loginMember = (MemberDto) session.getAttribute("mb");

		// 로그인 시 삭제해야하는 email 임시 값

		// 조회수 증가. DB 왜 안돼;;
		cDao.viewUpdate(ofc_code);

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
		log.info(offInfo.toString());
		mv.addObject("offInfo", offInfo);

		mv.addObject("m_email", loginMember.getM_email());

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


	/*은경 파트*/
	//온라인 메인화면 전체 및 카테고리별 섬네일 출력 메소드
		public ModelAndView getOnList() {
			log.info("getOnList()");
			
			mv = new ModelAndView();
			
			//카테고리 리스트 저장
			List<CategoryDto> cateList = cateDao.getCategories();
			mv.addObject("cateList", cateList);
			log.info("cateList()");
			
			//탑10 강좌 리스트 저장
			List<OnListDto> top10list = cDao.getTopOnList();
			mv.addObject("top10list", top10list);
			log.info("top10list()");
			
			//전체 강좌 리스트 저장
			List<OnListDto> onList = cDao.getOnList();
			mv.addObject("onList", onList);
			log.info("onList()");
			
			//미술 카테고리 전체 강좌 저장
			String cate = "ca";
			List<OnListDto> onListCa = cDao.getOnListCa(cate);
			mv.addObject("onListCa", onListCa);
			log.info("onListCa()");

			//공예 카테고리 전체 강좌 저장
			cate = "cb";
			onListCa = cDao.getOnListCa(cate);
			mv.addObject("onListCb", onListCa);
			log.info("onListCb()");

			//디지털 드로잉 카테고리 전체 강좌 저장
			cate = "cc";
			onListCa = cDao.getOnListCa(cate);
			mv.addObject("onListCc", onListCa);
			log.info("onListCc()");

			//운동 카테고리 전체 강좌 저장
			cate = "cd";
			onListCa = cDao.getOnListCa(cate);
			mv.addObject("onListCd", onListCa);
			log.info("onListCd()");

			//요리 카테고리 전체 강좌 저장
			cate = "ce";
			onListCa = cDao.getOnListCa(cate);
			mv.addObject("onListCe", onListCa);
			log.info("onListCe()");

			//프로그래밍 카테고리 전체 강좌 저장
			cate = "cf";
			onListCa = cDao.getOnListCa(cate);
			mv.addObject("onListCf", onListCa);
			log.info("onListCf()");		
			
			//view name 지정
			mv.setViewName("online/online_main");
			
			return mv;
		}

		//강좌 선택시 상세 페이지 출력 메소드
		public ModelAndView getOnlineInfo(String onc_code) {
			log.info("getOnlineInfo()------------"+onc_code);
			
			mv = new ModelAndView();
			
			String email=null;
			try {
				email = ((MemberDto)session.getAttribute("mb")).getM_email();
			} catch (Exception e) {
				email=null;
			}
			
			//spec 이미지 3개 저장
			List<SpecListDto> onSpecList = cInfoDao.SpecList(onc_code);
			mv.addObject("onSpecList", onSpecList);
			
			//조회수 증가
			cInfoDao.viewUpdate(onc_code);
			
			//content 이미지 및 내용 저장
		    if(email == null||email.equals("")) {
		    	log.info("비회원!!!");
		    	List<OnInfoDto> onInfol = cInfoDao.onInfo(onc_code);
		    	
		    	OnInfoDto onInfo = onInfol.get(0);
		    	onInfo.setL_state(0);
				mv.addObject("onInfo", onInfo);
				log.info("onInfo()");
		    }
		    else {
		    	log.info("로그인!!!");
		    	List<OnInfoDto> onLInfoList  = cInfoDao.onInfo(onc_code);
		    	boolean flag=false;
		    	for(OnInfoDto onLInfo:onLInfoList) {
		    		log.info("여기까지 실행!!!!"+onLInfo.getL_m_email());
		    		
		    		if(onLInfo.getL_m_email().equals(email)) {
		    			mv.addObject("onInfo", onLInfo);
		    			flag=true;
		    		}
		    	}
		    	if(flag==false) {
		    		OnInfoDto onInfo = onLInfoList.get(0);
			    	onInfo.setL_state(0);
					mv.addObject("onInfo", onInfo);
					log.info("onLInfo()");
		    	}
		    	
		    }
			
			mv.setViewName("online/online_info");
			
			return mv;
		}

		public LikesDto updateLikes(String onc_code,String l_cts_code) {
			String email=((MemberDto)session.getAttribute("mb")).getM_email();
			log.info("updateLikes()"+onc_code);
			LikesDto likes=new LikesDto();
			
			
		    //like 정보 있는지 확인하기
		    String checkLike = cInfoDao.searchLike(onc_code,email);
		    
		    if (checkLike == null) {
		    	likes.setL_cts_code("onc");
		    	likes.setL_m_email(email);
		    	likes.setL_pcode(onc_code);
		    	
				cInfoDao.like_input(likes);
				cInfoDao.like_up(onc_code);
			}
		    else {
			    cInfoDao.like_check(onc_code,email);
			    cInfoDao.like_up(onc_code);
		    }
			LikesDto ldto = cInfoDao.getLikes(onc_code,email);
		    return ldto;
		}

		public LikesDto updatedisLikes(String onc_code,  String l_cts_code) {
			log.info("updatedisLikes()"+onc_code+l_cts_code);
			
			String email=((MemberDto)session.getAttribute("mb")).getM_email();
		    
		    cInfoDao.dislike_check(onc_code,email);
		    cInfoDao.dislike_down(onc_code);
		    
			LikesDto ldto = cInfoDao.getLikes(onc_code,email);
		    
		    return ldto;
		}

		public ModelAndView classroom(String onc_code) {
			log.info("classroom()" + onc_code);
			
			String email = ((MemberDto)session.getAttribute("mb")).getM_email();
			log.info("email()"+email);
			
			//크리에이터 이메일로 내 강의 검색해서 클래스룸 접속 권한 추가
			OnlineClassDto c_m_check = null;
			c_m_check = cDao.checkOnClass(onc_code, email);
			log.info("c_m_check()"+c_m_check.getOnc_m_email());
			
//			//주문 내역에서 내 이메일과 온라인 강의 코드에 해당하는 정보 있는지 확인
//			OrderDto orderCheck = null;
//			orderCheck = cDao.checkOrderList(loginMember.getM_email(), onc_code);
//			log.info("orderCheck()");
//			
//			//주문 내역 없는데 url타고 들어가는거 방지 -> 홈화면으로 이동
//			if (c_m_check == null && orderCheck == null ) {
//				mv.setViewName("/");
//				log.info("비회원 홈으로 돌아가기");
//				return mv;
//			}
			
			if (c_m_check == null) {
				mv.setViewName("/");
				log.info("내가 강의 아님 홈으로 돌아가기");
				return mv;
			}
			
//			//myonlineinfo에서 onc_code검색해서 내 강의 목록에 있으면 강의 비디오 정보 가져오기
//			List<ClassroomDto> classroom = cDao.getCR(onc_code);
//			System.out.println("classroom>>>"+classroom);
//			
//			ClassroomDto classroomSample = classroom.get(0);
//			mv.addObject("classroomSample",classroomSample);
//			System.out.println("classroomSample>>>"+classroomSample);
	//	
//			mv.addObject("classroom", classroom);
//			mv.addObject("videoList", classroom);
			
			//비디오 리스트 가져오기
			System.out.println("onc_code>>>>>>"+onc_code+email);
			List<VideoListDto> videoLists = cDao.getVideoLists(onc_code, email);
			mv.addObject("videoLists", videoLists);
			System.out.println("videoLists>>>>>>"+videoLists);
			
			//선택된 강좌 배열에서 검색 후 저장
			VideoListDto  selVideoLists = videoLists.get(0);
			mv.addObject("selVideoLists", selVideoLists);
			
		  	mv.setViewName("online/online_classroom");
		  		
		  	return mv;
		}

		public VideoListDto videoChange(String vf_code, String onc_code) {
			log.info("videoChange()"+vf_code+onc_code);
			
			String email=((MemberDto)session.getAttribute("mb")).getM_email();
			
			VideoListDto videoChange = cDao.getvideoChange(vf_code, onc_code, email);
			
			return videoChange;
		}
		
		
	/*은경 파트*/
}
