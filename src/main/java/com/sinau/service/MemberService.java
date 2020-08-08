package com.sinau.service;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.ClassDao;
import com.sinau.dao.CommonDao;
import com.sinau.dao.MemberDao;
import com.sinau.dao.StoreDao;
import com.sinau.dto.OnStuInfoDto;
import com.sinau.dto.CreatorOffInfoDto;
import com.sinau.dto.CreatorOnInfoDto;
import com.sinau.dto.DealerProductInfoDto;
import com.sinau.dto.FilesDto;
import com.sinau.dto.MemberDto;
import com.sinau.dto.MemberImg;
import com.sinau.dto.MyCouponDto;
import com.sinau.dto.MyMemberInfoDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffLikeDto;
import com.sinau.dto.OffOrdersDto;
import com.sinau.dto.OffStuInfoDto;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.OnlineLikeDto;
import com.sinau.dto.OnlineOrdersDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.ProdLikeDto;
import com.sinau.dto.ProdOrdersDto;
import com.sinau.dto.ProductDto;
import com.sinau.dto.RefundDto;
import com.sinau.dto.ScheduleDto;
import com.sinau.dto.ScheduleListDto;
import com.sinau.dto.VideoDto;
import com.sinau.dto.VideoFeedDto;
import com.sinau.dto.VideoFileDto;

import lombok.extern.java.Log;

@Service
@Log
public class MemberService {
	ModelAndView mv;
	@Autowired
	HttpSession session;

	@Autowired
	CommonService cmServ;

	@Autowired
	MemberDao mDao;
	@Autowired
	ClassDao cDao;
	@Autowired
	StoreDao sDao;
	@Autowired
	CommonDao cmDao;

	MemberDto loginMember;

	public String idCheck(String memail) {
		String result = null;

		try {

			//1=아이디 있음 0=아이디 없음
			int cnt = mDao.idCheck(memail);
			if (cnt == 1) {
				result = "fail";
			} else {
				result = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ModelAndView memberInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		MemberDto member = new MemberDto();
		mv = new ModelAndView();
		String view = null;

		BCryptPasswordEncoder pwdEncode = new BCryptPasswordEncoder();

		String encPwd = pwdEncode.encode(multi.getParameter("m_pwd"));

		member.setM_email(multi.getParameter("m_email"));
		member.setM_name(multi.getParameter("m_name"));
		member.setM_pwd(encPwd);
		member.setM_phone(Integer.parseInt(multi.getParameter("m_phone")));
		member.setM_birth(multi.getParameter("m_birth"));
		if (!(multi.getParameter("m_license") == null)) {
			member.setM_license(Integer.parseInt(multi.getParameter("m_license")));
		}

		member.setM_group(multi.getParameter("m_group"));
		member.setM_state(Integer.parseInt(multi.getParameter("m_state")));
		int fcheck = Integer.parseInt(multi.getParameter("fileCheck"));

		try {

			mDao.memberInsert(member);

			view = "redirect:/";
			if (fcheck == 1) {
				// 업로드할 파일이 있음.
				fileUp(multi, member.getM_email());
			}

		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:joinFrm";
			rttr.addFlashAttribute("check", 1);
		}

		rttr.addFlashAttribute("check", 2);
		mv.setViewName(view);
		return mv;
	}

	private void fileUp(MultipartHttpServletRequest multi, String m_email) throws IllegalStateException, IOException {

		String filePath = multi.getSession().getServletContext().getRealPath("/") + "resources/upload/";

		log.info("dddddddddddddddddddddd"+filePath);
		
		File folder = new File(filePath);
		if (folder.isDirectory() == false) {
			// 경로를 설정한 폴더가 없다면
			folder.mkdir();// upload 폴더 생성
		}

		Map<String, String> fmap = new HashMap<String, String>();

		fmap.put("m_email", m_email);

		List<MultipartFile> fList = multi.getFiles("files");

		for (int i = 0; i < fList.size(); i++) {
			MultipartFile mf = fList.get(i);
			// 파일의 실제 이름 가져오기
			String oriName = mf.getOriginalFilename();
			// 실제 파일명을 맵에 저장
			fmap.put("oriFileName", oriName);
			// 저장 파일명 작성(밀리초 값을 사용)
			String sysName = System.currentTimeMillis() + "." + oriName.substring(oriName.lastIndexOf(".") + 1);
			fmap.put("sysFileName", sysName);
			// 로그에 찍어서 확인
			log.info(sysName);
			// 저장 위치로 파일 전송
			// 새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(filePath + sysName));
			// DB에 파일 정보 저장(dDao)
			mDao.fileInsert(fmap);
		}
	}
	public ModelAndView loginProc(MemberDto member, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.

		String view = null;//이동할 jsp 이름 저장 변수.
		String msg = null;//화면에 출력할 메시지

		BCryptPasswordEncoder pwdEncode=new BCryptPasswordEncoder();
		//DB에서 해당 id의 password 가져오기.
		String get_pw = mDao.getPwd(member.getM_email());

		//로그인 처리
		if(get_pw != null) {
			//아이디 있음.
			if(pwdEncode.matches(member.getM_pwd(), get_pw)) {
				//패스워드 맞음. 로그인 성공.
				//세션에 로그인 성공한 회원 정보 저장
				//로그인 한 회원의 정보를 가져오기.
				member = mDao.getMemInfo(member.getM_email());
				MemberImg memimg=mDao.getMemImg(member.getM_email());
				session.setAttribute("memImg", memimg);
				session.setAttribute("mb", member);
				loginMember=member;
				System.out.println(session);
				
				if(member.getM_group().equals("ad")){
					//회원 구분이 admin일 경우 관리자 페이지로 전환
					view = "redirect:adMApproval";
				}
				else {
					//리다이렉트로 화면을 전환.
					view = "redirect:/";
				}
				
			}
			else {
				//패스워드 틀림.
				view = "redirect:loginFrm";
				msg = "패스워드 틀림.";
			}
		} else {
			// 아이디 없음.
			view = "redirect:loginFrm";
			msg = "아이디 없음.";
		}

		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		return mv;
	}

	public String logout() {
		// 세션 정보 지우기
		session.invalidate();

		return "home";
	}


	// 로그인 회원의 그룹을 반환한다.
	public String getLoginMemberGroup() {
		String group = mDao.getGroup(loginMember.getM_email());

		return group;
	}

	//로그인 회원의 온라인 강좌 목록과 view를 ModelAndView로 반환 , m_group > 회원마다 다른 메인 마이페이지를 띄워야 하므로
	public ModelAndView getMyOnlineList(String m_group) {
		mv=new ModelAndView();

		//email에 해당하는 회원의 온라인 주문 내역을 가져온다.
		List<OrderDto> orderList=cDao.getOrderList(loginMember.getM_email(),"onc_");	

		// 주문 객체에 저장된 강의 코드로 내 수강 강의정보 목록을 저장한다.
		List<MyOnlineInfoDto> onlineList = new ArrayList<MyOnlineInfoDto>();
		for (OrderDto order : orderList) {
			MyOnlineInfoDto online = cDao.getMyOnlineInfoOne(order.getOrd_code());
			onlineList.add(online);
		}

		mv.addObject("onlineList", onlineList);

		mv.setViewName("mypage/mypage_main");

		return mv;
	}

	//로그인 회원의 아이디로 수강 신청한 오프라인 강의의 목록을 가져온다.
	public ModelAndView getMyOfflineList() {
		mv=new ModelAndView();

		//email에 해당하는 회원의 오프라인 주문 내역을 가져온다.
		List<OrderDto> orderList=cDao.getOrderList(loginMember.getM_email(),"ofc_");	

		// 주문 객체에 저장된 강의 코드로 내 수강 강의정보 목록을 저장한다.
		List<MyOffInfoDto> offlineList = new ArrayList<MyOffInfoDto>();
		for (OrderDto order : orderList) {
			MyOffInfoDto offline = cDao.getMyOffInfoOne(order.getOrd_code());
			offlineList.add(offline);
		}

		mv.setViewName("mypage/mypage_offline");
		mv.addObject("offlineList", offlineList);

		return mv;
	}

	//회원의 정보(회원+이미지)를 가져온다.
	public ModelAndView getMemberInfo() {
		mv=new ModelAndView();

		//마이페이지에 보여질 회원 정보를 가져온다.
		MyMemberInfoDto myInfo=mDao.getMemberInfo(loginMember.getM_email());
		mv.addObject("myInfo",myInfo);

		mv.setViewName("mypage/mypage_update");
		return mv;
	}

	public ModelAndView updateMemberInfo(MultipartHttpServletRequest multi) {
		mv=new ModelAndView();
		String path=multi.getSession().getServletContext().getRealPath("/")+"resources/upload/";

		String mimg_code=multi.getParameter("mimg_code");

		//multi에서 동영상 파일 가져오기(여러개의 파일이 넘어 올 수도 있다.)
		List<MultipartFile> fList=multi.getFiles("files");

		for(int i=0;i<fList.size();i++) {
			MemberImg memImg=new MemberImg();
			memImg.setMimg_code(mimg_code);
			
			MultipartFile mf=fList.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			memImg.setMimg_oriname(oriName);
			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			memImg.setMimg_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			try {
				mf.transferTo(new File(path+sysName));
				
				//실제 업로드 폴더에서 해당 파일을 삭제한다.
				String saveFileName=multi.getParameter("mimig_sysname");
				File deleteFile=new File(path+saveFileName);

				if(deleteFile.exists()) {
					deleteFile.delete();
					log.info("삭제 완료!");
				}else {
					log.info("해당 파일이 존재하지 않습니다.");
				}
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//회원의 이미지를 변경한다.
			cmDao.updateMemImg(memImg);
			MemberImg memimg=mDao.getMemImg(loginMember.getM_email());
			session.setAttribute("memImg", memimg);
			
			mv.setViewName("redirect:/mypage");
		}
	
		if(multi.getParameter("newPwd")==null||multi.getParameter("newPwd").equals("")) {
			
		}else {
			log.info("1111111111111");
			//변경할 비밀번호를 암호화한다.
			BCryptPasswordEncoder pwdEncode=new BCryptPasswordEncoder();

			String encodePwd=pwdEncode.encode(multi.getParameter("newPwd"));

			int result=mDao.updateMemberPwd(loginMember.getM_email(),encodePwd);

			if(result>0) {
				mv.setViewName("redirect:/mypage");
			}else {
				mv.setViewName("redirect:/mypageUpdate");
			}
		}

		return mv;
	}

	//회원의 이메일로 각 (상품,온라인, 오프라인) 주문 내역을 가져온다.
	public ModelAndView getAllOrders() {
		mv=new ModelAndView();

		//상품 주문내역 목록을 가져온다.
		List<ProdOrdersDto> prodOrdList=sDao.getProdOrderList(loginMember.getM_email());
		//온라인 주문내역 목록을 가져온다.
		List<OnlineOrdersDto> onOrdList=cDao.getOnlineOrderList(loginMember.getM_email());
		//오프라인 주문내역 목록을 가져온다.
		List<OffOrdersDto> offOrdList=cDao.getOffOrderList(loginMember.getM_email());

		mv.addObject("prodOrder",prodOrdList);
		mv.addObject("onlineOrder",onOrdList);
		mv.addObject("offOrder",offOrdList);

		mv.setViewName("mypage/mypage_order");

		return mv;
	}
	
	// 상품,온라인, 오프라인 좋아요 내역을 검색한다.
	public ModelAndView getAllLikes(String email) {
		mv = new ModelAndView();

		// 온라인 강의의 좋아요 목록을 가져온다.
		List<OnlineLikeDto> onLike = cDao.getOnLikeList(email);
		// 오프라인 강의의 좋아요 목록을 가져온다.
		List<OffLikeDto> offLike = cDao.getOffLikeList(email);
		// 상품의 좋아요 목록을 가져온다.
		List<ProdLikeDto> prodLike = sDao.getProdLikeList(email);

		mv.addObject("onLikeList", onLike);
		mv.addObject("offLikeList", offLike);
		mv.addObject("prodLikeList", prodLike);
		
		return mv;
	}

	//상품,온라인, 오프라인 좋아요 내역을 검색한다.
	public ModelAndView getAllLikes() {
		mv=new ModelAndView();

		//온라인 강의의 좋아요 목록을 가져온다.
		List<OnlineLikeDto> onLike=cDao.getOnLikeList(loginMember.getM_email());
		//오프라인 강의의 좋아요 목록을 가져온다.
		List<OffLikeDto> offLike=cDao.getOffLikeList(loginMember.getM_email());
		//상품의 좋아요 목록을 가져온다.
		List<ProdLikeDto> prodLike=sDao.getProdLikeList(loginMember.getM_email());

		mv.addObject("onLikeList",onLike);
		mv.addObject("offLikeList",offLike);
		mv.addObject("prodLikeList",prodLike);

		mv.setViewName("mypage/mypage_like");

		return mv;
	}

	public ModelAndView getCouponList() {
		mv = new ModelAndView();

		// 회원의 쿠폰 목록을 가져온다.
		List<MyCouponDto> couponList = cmDao.getCouponList(loginMember.getM_email());

		mv.addObject("cpList", couponList);

		mv.setViewName("mypage/mypage_coupon");

		return mv;
	}


	public Map<String, List<MyCouponDto>> inputCoupon(String cp_code) {
		Map<String, List<MyCouponDto>> cMap=new HashMap<String, List<MyCouponDto>>();

		try {
			//입력한 쿠폰 번호가 존재하는지 검사
			int result=cmDao.selectCoupon(cp_code);

			//쿠폰이 존재한다면
			if(result==1) {
				//쿠폰 목록에 쿠폰을 추가한다.
				cmDao.inputMyCoupon(loginMember.getM_email(),cp_code);

				//추가 된 쿠폰을 포함한 쿠폰 목록을 가져온다.
				List<MyCouponDto> cList=cmDao.getCouponList(loginMember.getM_email());
				cMap.put("cpList",cList);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cMap;
	}

	//ord_code에 해당하는 주문 내역의 상태를 변경하는 메소드
	public ModelAndView cancleOrder(String ord_code) {
		mv=new ModelAndView();
		OrderDto order=new OrderDto();

		order.setOrd_code(ord_code);
		order.setOrd_state(2);

		System.out.println("ord_code"+order.getOrd_code());
		System.out.println("ord_sate"+order.getOrd_state());

		sDao.updateOrderState(order);



		mv.setViewName("redirect:/mypageOrder");

		return mv;
	}

	//주문 상태를 환불 중으로 변경하고 환불 내역을 등록하는 메소드
	public ModelAndView refundOrder(String sort,RefundDto refund) {
		mv=new ModelAndView();
		OrderDto order=new OrderDto();
		refund.setRef_ord_code(refund.getRef_ord_code().trim());
		//주문 상태를 환불중으로 변경
		System.out.println("refund - refund"+refund.toString());

		order.setOrd_code(refund.getRef_ord_code());
		order.setOrd_state(3);
		sDao.updateOrderState(order);

		//상품인지 온라인, 오프라인인지 비교한다.
		if(sort.equals("prod")) {
			//환불 목록에 ord_code를 추가한다.
			cmDao.refundOrder(refund);

			mv.setViewName("redirect:./mypageOrder");
		}
		else if(sort.equals("online")||sort.equals("offline")) {
			//내 클래스 상태에서 환불중으로 변경
			cDao.mclUpdateState(order);
			//환불 목록에 ord_code를 추가한다.
			cmDao.refundOrder(refund);
			mv.setViewName("redirect:./mypage");
		}


		return mv;
	}

	///////////////////////////////////////////////////////////////////	크리에이터용 기능
	//크리에이터 메인 페이지에 보여질 내용을 반환
	public ModelAndView getCreatorClassList() {
		mv=new ModelAndView();

		//회원(크리에이터)이 등록한 온라인 강의의 정보를 가져온다.
		List<CreatorOnInfoDto> ccInfoList=cDao.getCreatorOnList(loginMember.getM_email());
		//회원(크리에이터)이 등록한 오프라인 강의의 정보를 가져온다.
		List<CreatorOffInfoDto> cofInfoList=cDao.getCreatorOffList(loginMember.getM_email());

		//온라인 강좌 수강 회원 정보
		List<OnStuInfoDto> contuInfoList=mDao.getOnlineStuList(loginMember.getM_email());
		//오프라인 강좌 수강 회원 정보
		List<OffStuInfoDto> cofftuInfoList=mDao.getOffStuList(loginMember.getM_email());

		mv.addObject("ccInfoList",ccInfoList);
		mv.addObject("cofInfoList",cofInfoList);
		mv.addObject("contuInfoList",contuInfoList);
		mv.addObject("cofftuInfoList",cofftuInfoList);
		mv.setViewName("mypage/cmypage_main");

		return mv;
	}

	public ModelAndView getCreatorClassInfo(String up_p_code) {
		mv=new ModelAndView();

		if(up_p_code.contains("onc_")) {
			//onc_code에 해당하는 강의 정보를 가져온다.
			CreatorOnInfoDto onInfo=cDao.getCreatorOnlineInfo(up_p_code);
			//onc_code에 해당하는 강의 목록 코드를 가져온다.
			String v_code=cmDao.getVCode(up_p_code);
			//v_code에 있는 영상을 List로 가져온다.
			List<VideoFileDto> videoList=cDao.getVideoList(v_code);

			mv.addObject("classInfo",onInfo);
			mv.addObject("videoList",videoList);
			mv.addObject("sort","onc");
		}else {
			//up_p_code에 해당하는 오프라인 강의 정보를 가져온다.
			CreatorOffInfoDto offInfo=cDao.getCreatorOffInfo(up_p_code);
			//ofc_code에 해당하는 일정 목록 코드를 가져온다.
			String scl_code=cmDao.getSclCode(up_p_code);
			//scl_code에 있는 일정들을 List로 가져온다.
			List<ScheduleDto> scList=cmDao.getScheduleList(scl_code);
			
			mv.addObject("classInfo",offInfo);
			mv.addObject("scList",scList);
			mv.addObject("sort","ofc");
		}

		mv.setViewName("mypage/cmypage_classup");
		return mv;
	}

	@SuppressWarnings("deprecation")
	@Transactional
	public ModelAndView insertNewClass(MultipartHttpServletRequest multi) {
		OnlineClassDto online;
		OffClassDto offine;
		mv=new ModelAndView();

		String sort=multi.getParameter("class_sort");
		//sort가 onc이면 온라인 강좌 정보를 저장한다.
		if(sort.equals("onc")) {
			online=new OnlineClassDto();
			online.setOnc_title(multi.getParameter("onc_title"));
			online.setOnc_content(multi.getParameter("onc_content"));
			online.setOnc_cts_code(multi.getParameter("onc_cts_code"));
			online.setOnc_teacher(((MemberDto)session.getAttribute("mb")).getM_name());
			online.setOnc_m_email(((MemberDto)session.getAttribute("mb")).getM_email());
			online.setOnc_level(multi.getParameter("onc_level"));
			online.setOnc_stnum(Integer.parseInt(multi.getParameter("onc_stnum")));
			online.setOnc_sale(Integer.parseInt(multi.getParameter("onc_sale")));
			online.setOnc_sdate(multi.getParameter("onc_sdate"));
			online.setOnc_edate(multi.getParameter("onc_edate"));

			String[] v_titles=multi.getParameterValues("v_title");
			String[] v_contents=multi.getParameterValues("v_content");

			try {
				//강좌 정보를 db에 저장
				cDao.insertOnClassInfo(online);

				//강좌에 비디오 저장
				VideoDto vList=new VideoDto();
				vList.setV_onc_code(online.getOnc_code());

				//강좌에 이미지 저장
				FilesDto file=new FilesDto();
				file.setF_pcode(online.getOnc_code());
				file.setF_cts_code(sort);

				//강의에 해당하는 동영상 목록 정보를 등록한다.
				cDao.insertVideoList(vList);
				log.info("v_code : " + vList.getV_code());

				VideoFileDto vFile=new VideoFileDto();
				vFile.setVf_v_code(vList.getV_code());
				videoUp(multi, vFile,file);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mv.setViewName("redirect:./cMypage");

		}else if(sort.equals("ofc")) { 

			offine=new OffClassDto();
			offine.setOfc_title(multi.getParameter("ofc_title"));
			offine.setOfc_content(multi.getParameter("ofc_content"));
			offine.setOfc_cts_code(multi.getParameter("ofc_cts_code"));
			offine.setOfc_teacher(((MemberDto)session.getAttribute("mb")).getM_name());
			offine.setOfc_m_email(((MemberDto)session.getAttribute("mb")).getM_email());
			offine.setOfc_level(multi.getParameter("ofc_level"));
			offine.setOfc_stnum(Integer.parseInt(multi.getParameter("ofc_stnum")));
			offine.setOfc_sale(Integer.parseInt(multi.getParameter("ofc_sale")));

			String[] sc_times=multi.getParameterValues("sc_time"); 
			for(int i = 0; i < sc_times.length; i++) {
				sc_times[i] = sc_times[i].replace("T", " ");
			}
			log.info(sc_times[0]);
			String[] sc_places=multi.getParameterValues("sc_place");

			try { 
				//강좌 정보를 db에 저장 
				cDao.insertOffClassInfo(offine);

				//강좌 일정 목록 을 db에 저장
				ScheduleListDto scList=new ScheduleListDto();
				scList.setScl_ofc_code(offine.getOfc_code());
				cmDao.insertScl(scList);

				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

				log.info(scList.getScl_code());
				for(int i=0;i<sc_times.length;i++) {
					ScheduleDto schedule=new ScheduleDto();
					schedule.setSc_scl_code(scList.getScl_code());
					schedule.setSc_time(sf.parse(sc_times[i]));
					schedule.setSc_place(sc_places[i]);

					cmDao.insertSchedule(schedule);
				}

				//강좌에 이미지 저장
				FilesDto file=new FilesDto();
				file.setF_pcode(offine.getOfc_code());
				file.setF_cts_code(sort);

				imageUp(multi, file);

			} catch (Exception e) { // TODO Auto-generated catch block
				e.printStackTrace(); } mv.setViewName("redirect:./cMypage");
		}

		return mv;
	}

	//강의의 정보를 수정하는 메소드
	public ModelAndView updateClassInfo(Object obj) {
		mv=new ModelAndView();
		log.info(obj.toString());
		if (obj instanceof OnlineClassDto) {
			OnlineClassDto online=(OnlineClassDto)obj;

			log.info(online.toString());

			cDao.updateOnClassInfo(online);   
			

		}if(obj instanceof OffClassDto) {
			OffClassDto offline=(OffClassDto)obj;
			
			log.info(offline.toString());
			
			cDao.updateOffClassInfo(offline);
			mv.addObject("ofp_code",offline.getOfc_code());
		}
		
		mv.setViewName("redirect:./cMypage");
		return mv;
	}

	//강의의 동영상 정보를 추가 하기위한 메소드
	public ModelAndView updateClassVideo(MultipartHttpServletRequest multi) {
		mv=new ModelAndView();
		String path=multi.getSession().getServletContext().getRealPath("/")+"resources/upload/";

		String v_titles[]=multi.getParameterValues("uv_title");
		String v_contents[]=multi.getParameterValues("uv_content");

		//강의에 해당하는 비디오 목록 코드
		String vf_v_code=multi.getParameter("vf_v_code");

		//multi에서 동영상 파일 가져오기(여러개의 파일이 넘어 올 수도 있다.)
		List<MultipartFile> fList=multi.getFiles("upvideo_files");
		for(int i=0;i<fList.size();i++) {
			VideoFileDto video=new VideoFileDto();
			video.setVf_v_code(vf_v_code);
			MultipartFile mf=fList.get(i);

			video.setV_title(v_titles[i]);
			video.setV_content(v_contents[i]);

			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			video.setVf_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			video.setVf_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			try {
				mf.transferTo(new File(path+sysName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			cmDao.videoInsert(video);
		}
		mv.setViewName("redirect:./cMypage");

		return mv;
	}

	public String deleteClassVideo(String vf_code) {
		String path=session.getServletContext().getRealPath("/")+"resources/upload/";
		//vf_code에 해당하는 파일의 정보를 가져온다.
		VideoFileDto file=cmDao.getVideoOne(vf_code);
		//실제 업로드 폴더에서 해당 파일을 삭제한다.
		String saveFileName=file.getVf_sysname();
		File deleteFile=new File(path+saveFileName);

		if(deleteFile.exists()) {
			deleteFile.delete();
			log.info("삭제 완료!");
		}else {
			log.info("해당 파일이 존재하지 않습니다.");
		}

		cmDao.deleteVideoOne(vf_code);
		return "success";
	}

	//특정 동영상의 정보를 수정하기 위한 메소드
	public VideoFileDto uploadClassVideo(MultipartFile[] updateFiles,VideoFileDto videoFile) {
		log.info("실행!"+updateFiles.length);
		String path=session.getServletContext().getRealPath("/")+"resources/upload/";
		for(MultipartFile file:updateFiles) {
			String oriName=file.getOriginalFilename();
			videoFile.setVf_oriname(oriName);
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			videoFile.setVf_sysname(sysName);
			try {
				file.transferTo(new File(path+sysName));
				cmDao.updateVideoOne(videoFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		return videoFile;
	}
	public ModelAndView updateClassSchedule(ScheduleDto schedule) {
		// TODO Auto-generated method stub
		return mv;
	}


	public ScheduleDto updateSchedule(ScheduleDto schedule) {
		//넘어온 schedule 정보로 일정을 수정한다.
		cmDao.updateSchedule(schedule);
		
		return schedule;
	}
	
	//onc_code에 해당하는 강의를 삭제하기위한 메소드
	public ModelAndView deleteClass(String p_code) {
		String path=session.getServletContext().getRealPath("/")+"resources/upload/";
		mv=new ModelAndView();
		
		if(p_code.contains("onc_")) {
			String v_code=cmDao.getVCode(p_code);

			//강의에 등록된 동영상들을 삭제한다.
			//v_code에 저장된 파일들을 모두 가져온다.
			List<VideoFileDto> fileList=cmDao.getVideoList(v_code);
			for(VideoFileDto file : fileList) {
				String vf_code=file.getVf_code();
				//실제 업로드 폴더에서 해당 파일을 삭제한다.
				String saveFileName=file.getVf_sysname();
				File deleteFile=new File(path+saveFileName);

				if(deleteFile.exists()) {
					deleteFile.delete();
					log.info("삭제 완료!");
				}else {
					log.info("해당 파일이 존재하지 않습니다.");
				}

				cmDao.deleteVideoOne(vf_code);
			}


			//강의에 등록된 동영상 목록을 삭제한다.
			cmDao.deleteVideo(v_code);

			//강의에 등록된 이미지를 삭제한다.
			cmDao.deleteClassImages(p_code);

			//강의를 삭제한다.
			cDao.deleteClass(p_code);
		}else if(p_code.contains("ofc_")) {
			String scl_code=cmDao.getSclCode(p_code);
			//scl_code에 저장된 일정을 삭제한다.
			cmDao.deleteSchedule(scl_code);
			
			//scl_code를 삭제한다.
			cmDao.deleteScList(scl_code);
			
			//p_code에 해당하는 강의를 삭제한다.
			cDao.deleteOffClass(p_code);
		}

		mv.setViewName("redirect:./cMypage");

		return mv;
	}	

	//강의마다 피드백 목록을 가져오는 메소드
	public ModelAndView getClassQuestionList() {
		mv=new ModelAndView();

		//회원(크리에이터가 등록 한 강의의 정보를 가져온다.
		List<CreatorOnInfoDto> ccInfoList=cDao.getCreatorOnList(loginMember.getM_email());

		//강의에 등록 된 피드백 목록을 모두 가져온다.
		List<VideoFeedDto> feedList=cDao.getFeedListAll(loginMember.getM_email());

		mv.addObject("ccInfoList",ccInfoList);
		mv.addObject("feedList", feedList);

		mv.setViewName("mypage/cmypage_qna_list");
		return mv;
	}

///////////////////////////////////////////////////////////////판매자
	public ModelAndView getProductList() {
		mv=new ModelAndView();
		
		//회원의 상품 목록을 가져온다.
		List<DealerProductInfoDto> myprodList=sDao.getMyProdList(loginMember.getM_email());
		
		mv.addObject("myprodList",myprodList);
		
		mv.setViewName("mypage/dmypage_main");
		return mv;
	}
	
	public ModelAndView insertNewProduct(MultipartHttpServletRequest multi) {
		mv=new ModelAndView();
		/*
		 * private int p_price; 

		 */
		ProductDto prod=new ProductDto();
		prod.setP_title(multi.getParameter("p_title"));
		prod.setP_amount(Integer.parseInt(multi.getParameter("p_amount")));
		prod.setP_dealer(loginMember.getM_name());
		prod.setP_m_email(loginMember.getM_email());
		prod.setP_cts_code(multi.getParameter("p_cts_code"));
		prod.setP_price(Integer.parseInt(multi.getParameter("p_price")));
		
		try {
			sDao.insertNewProd(prod);
			//강좌에 이미지 저장
			FilesDto file=new FilesDto();
			file.setF_pcode(prod.getP_code());
			file.setF_cts_code(prod.getP_cts_code());

			imageUp(multi, file);
			
			mv.setViewName("redirect:./dMypage");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			mv.setViewName("redirect:./dMyNewProd");
		}
		
		mv.setViewName("redirect:./dMypage");
		return mv;
	}
	
	public ModelAndView updateProduct(String p_code, String up_amount) {
		mv=new ModelAndView();
		ProductDto prod=new ProductDto();
		prod.setP_code(p_code);
		int p_amount=Integer.parseInt(up_amount);
		prod.setP_amount(p_amount);
		
		sDao.updateProd(prod);
		
		mv.setViewName("redirect:./dMypage");
		
		return mv;
	}

	public ModelAndView deleteProduct(String p_code) {
		mv=new ModelAndView();
			
		//p_code에 해당하는 상품의 state를 1(삭제 요청)로 변경
		sDao.delRequestProd(p_code);
		
		mv.setViewName("redirect:./dMypage");
		
		return mv;
	}

	//이미지 업로드
	public void imageUp(MultipartHttpServletRequest multi,FilesDto file) throws IllegalStateException, IOException {
		//파일을 실제 물리 경로에 저장
		//upload폴더에 저장
		//"/src/main/webapp/resources/upload
		String path=multi.getSession().getServletContext().getRealPath("/")+"resources/upload/";
		log.info(path);

		//upload 폴더 만들기
		File folder=new File(path);
		//folder가 디렉토리가 아니거나 존재하지 않는다면
		if(folder.isDirectory()==false) {
			folder.mkdir();
		}

		List<MultipartFile> thumbnail=null;
		if(file.getF_pcode().contains("p_")) {
			thumbnail=multi.getFiles("pthumbnail");
			file.setF_code("fpth_");
		}else if(file.getF_pcode().contains("ofc_")) {
			thumbnail=multi.getFiles("ofthumbnail");
			file.setF_code("fofth_");
		}
		
		for(int i=0;i<thumbnail.size();i++) {
			MultipartFile mf=thumbnail.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			file.setF_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			file.setF_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(path+sysName));


			cmDao.imageInsert(file);
		}

		List<MultipartFile> spec=null;
		if(file.getF_pcode().contains("p_")) {
			spec=multi.getFiles("pspec");
			file.setF_code("fpsp_");
		}else if(file.getF_pcode().contains("ofc_")) {
			spec=multi.getFiles("ofspec");
			file.setF_code("fofsp_");
		}

		for(int i=0;i<spec.size();i++) {
			MultipartFile mf=spec.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			file.setF_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			file.setF_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(path+sysName));


			cmDao.imageInsert(file);

		}

		List<MultipartFile> content=null;
		if(file.getF_pcode().contains("p_")) {
			content=multi.getFiles("pcontent");
			file.setF_code("fpco_");
		}else if(file.getF_pcode().contains("ofc_")) {
			content=multi.getFiles("ofcontent");
			file.setF_code("fofco_");
		}
		for(int i=0;i<content.size();i++) {  
			MultipartFile mf=content.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			file.setF_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			file.setF_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(path+sysName));


			cmDao.imageInsert(file);
		}
	}

	//크리에이터 강의의 동영상을 업로드하는 메소드
	public void videoUp(MultipartHttpServletRequest multi,VideoFileDto video,FilesDto file) throws IllegalStateException, IOException {
		//파일을 실제 물리 경로에 저장
		//upload폴더에 저장
		//"/src/main/webapp/resources/upload
		String path=multi.getSession().getServletContext().getRealPath("/")+"resources/upload/";
		log.info(path);

		//upload 폴더 만들기
		File folder=new File(path);
		//folder가 디렉토리가 아니거나 존재하지 않는다면
		if(folder.isDirectory()==false) {
			folder.mkdir();
		}
		String[] v_titles=multi.getParameterValues("v_title");
		String[] v_contents=multi.getParameterValues("v_content");
		//multi에서 동영상 파일 가져오기(여러개의 파일이 넘어 올 수도 있다.)
		List<MultipartFile> fList=multi.getFiles("video_files");
		for(int i=0;i<fList.size();i++) {
			MultipartFile mf=fList.get(i);

			video.setV_title(v_titles[i]);
			video.setV_content(v_contents[i]);

			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			video.setVf_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			video.setVf_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			mf.transferTo(new File(path+sysName));


			cmDao.videoInsert(video);
		}

		List<MultipartFile> thumbnail=multi.getFiles("thumbnail");
		for(int i=0;i<thumbnail.size();i++) {
			file.setF_code("foth_");
			MultipartFile mf=thumbnail.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			file.setF_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			file.setF_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(path+sysName));


			cmDao.imageInsert(file);
		}

		List<MultipartFile> spec=multi.getFiles("spec");
		for(int i=0;i<spec.size();i++) {
			file.setF_code("fosp_");
			MultipartFile mf=spec.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			file.setF_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			file.setF_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(path+sysName));


			cmDao.imageInsert(file);
		}

		List<MultipartFile> content=multi.getFiles("content");
		log.info(content.size()+"");
		for(int i=0;i<content.size();i++) {
			file.setF_code("foco_");
			MultipartFile mf=content.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			file.setF_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			file.setF_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(path+sysName));


			cmDao.imageInsert(file);
		}
	}
	public ModelAndView newpwd(String email, String pwd) {
		mv = new ModelAndView();
		
		//변경할 비밀번호를 암호화한다.
		 
		BCryptPasswordEncoder pwdEncode = new BCryptPasswordEncoder();
		 
	  	String encodePwd = pwdEncode.encode(pwd);

		int result = mDao.newPwd(email, encodePwd);
		if (result > 0) {
			mv.setViewName("redirect:loginFrm");
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;

	}

}
