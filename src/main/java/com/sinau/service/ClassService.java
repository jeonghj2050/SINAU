package com.sinau.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.CategoryDao;
import com.sinau.dao.ClassDao;
import com.sinau.dao.ClassInfoDao;
import com.sinau.dao.MemberDao;
import com.sinau.dao.PaymentDao;
import com.sinau.dao.StoreDao;
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
import com.sinau.dto.PPayInfoDto;
import com.sinau.dto.PayCouponDto;
import com.sinau.dto.QuestionDto;
import com.sinau.dto.ScheduleDto;
import com.sinau.dto.LikesDto;
import com.sinau.dto.OnInfoDto;
import com.sinau.dto.OnListDto;
import com.sinau.dto.OnPayInfoDto;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.SpecListDto;
import com.sinau.dto.TotalInfo;
import com.sinau.dto.VideoListDto;
import com.sinau.dto.YoutubeDto;

import lombok.extern.java.Log;

@Service
@Log
public class ClassService {
	//DAO 객체 선언
	@Autowired
	private MemberDao mDao;
	@Autowired
	private StoreDao sDao;
	@Autowired
	private CategoryDao cateDao;
	@Autowired
	private ClassDao cDao;
	@Autowired
	private ClassInfoDao cInfoDao;
	@Autowired
	private PaymentDao pDao;

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

		loginMember = (MemberDto) session.getAttribute("mb");

		// 조회수 증가
		cDao.viewUpdate(ofc_code);

		// cont 사진 목록 받아오기
		log.info("getOffInfo() - ofc _ code : " + ofc_code);
		OffInfoSpecDto offInfoSpec = cDao.getOffInfoSpec(ofc_code);
		mv.addObject("offInfoSpec", offInfoSpec);

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

	public ModelAndView getOffApply(String pay_pcode) {
		loginMember = (MemberDto) session.getAttribute("mb");
		mv = new ModelAndView();

		if (pay_pcode.contains("ofc")) {

			log.info("aaaaaaaaaaaaaaaaaaaaa get ofc_code : " + pay_pcode);
			log.info("m_email : " + ((MemberDto) session.getAttribute("mb")).getM_email());

			OffListDto offList = cDao.getOffApplyInfo(pay_pcode);
			mv.addObject("offList", offList);

			List<OffScheduleDto> offSchedule = cDao.getOffScehdule(pay_pcode);
			mv.addObject("offSchedule", offSchedule);

			mv.addObject("m_email", loginMember.getM_email());

			mv.setViewName("offline/offline_apply");
		} else {

			List<PayCouponDto> payCoupon = pDao.getPayCouponList(loginMember.getM_email());
			mv.addObject("payCoupon", payCoupon);

			if (pay_pcode.contains("onc")) {
				OnPayInfoDto onPayInfo = cDao.getOnApplyInfo(pay_pcode);
				mv.addObject("onList", onPayInfo);

				mv.addObject("ord_kind", 2);
				mv.addObject("sort", "onc");
			} else {
				PPayInfoDto pPayInfo = sDao.getProdApplyInfo(pay_pcode);
				mv.addObject("prodList", pPayInfo);

				mv.addObject("ord_kind", 1);
				mv.addObject("sort", "prod");
			}
			mv.setViewName("payment/payment");
		}

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
		// List<OffListDto> offCateFilterList = cDao.getOffCateFilterList(cts_code,
		// filter1, filter2, filter3);
		// mv.addObject("offCateFilterList", offCateFilterList);

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
		OnlineClassDto c_m_check = cDao.checkOnClass(onc_code, email);
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

		if (ObjectUtils.isEmpty(c_m_check)) {
			mv.setViewName("/");
			log.info("내가 강의 아님 홈으로 돌아가기");
			return mv;
		}
		
	public ModelAndView gettotalList() {
		mv = new ModelAndView();
	
		
		List<TotalInfo> allList = cDao.getoffontotalList();
		//System.out.println(lmap);
		//System.out.println(qList.get(0).getQ_code()); 
		
		mv.addObject("allList", allList);
		
		// view name을 지정!
		mv.setViewName("home");
		

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

	/* 은경 파트 */
	public VideoListDto videoChange(String vf_code, String onc_code) {
		log.info("videoChange()" + vf_code + onc_code);

		String email = ((MemberDto) session.getAttribute("mb")).getM_email();

		VideoListDto videoChange = cDao.getvideoChange(vf_code, onc_code, email);

		return videoChange;
	}


	public ModelAndView onlineList() {
		mv = new ModelAndView();
//
//		List<TotalInfo> totalList = cDao.gettotalList();
//
//		mv.addObject("totalList", totalList);

		mv.setViewName("home");

		return mv;
	}


	
}
