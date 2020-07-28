package com.sinau.service;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.MemberDao;
import com.sinau.dto.MyCouponDto;
import com.sinau.dto.MemberDto;
import com.sinau.dao.ClassDao;
import com.sinau.dao.CommonDao;
import com.sinau.dao.MemberDao;
import com.sinau.dto.MemberDto;
import com.sinau.dto.MemberImg;
import com.sinau.controller.HomeController;
import com.sinau.dao.ClassDao;
import com.sinau.dao.StoreDao;
import com.sinau.dto.MyMemberInfoDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffLikeDto;
import com.sinau.dto.OffOrdersDto;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.OnlineLikeDto;
import com.sinau.dto.OnlineOrdersDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.ProdLikeDto;
import com.sinau.dto.ProdOrdersDto;
import com.sinau.dto.RefundDto;
import com.sinau.dto.VideoDto;
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
			if(cnt == 1) {
				result = "fail";
			}
			else {
				result = "success";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



	public ModelAndView memberInsert(MemberDto member,//MultipartHttpServletRequest multi, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		BCryptPasswordEncoder pwdEncode=new BCryptPasswordEncoder();
		
		String encPwd= pwdEncode.encode(member.getM_pwd());
				
		member.setM_pwd(encPwd);
		
		try {
			mDao.memberInsert(member);
			/* mDao.memberImgInsert(multi); */
			
			view="redirect:/";
			rttr.addFlashAttribute("msg", "가입 성공");
		} catch (Exception e) {
			view="redirect:joinFrm";
			rttr.addFlashAttribute("msg", "가입 실패");
		}
		
		mv.setViewName(view);
		return mv;
	}


	//로그인 회원의 그룹을 반환한다.
	public String getLoginMemberGroup() {
		String group=mDao.getGroup(loginMember.getM_email());

		System.out.println(group);
		
		return group;
	}

	//로그인 회원의 온라인 강좌 목록과 view를 ModelAndView로 반환 , m_group > 회원마다 다른 메인 마이페이지를 띄워야 하므로
	public ModelAndView getMyOnlineList(String m_group) {
		mv=new ModelAndView();

		//email에 해당하는 회원의 온라인 주문 내역을 가져온다.
		List<OrderDto> orderList=cDao.getOrderList(loginMember.getM_email(),"onc_");	

		//주문 객체에 저장된 강의 코드로 내 수강 강의정보 목록을 저장한다.
		List<MyOnlineInfoDto> onlineList=new ArrayList<MyOnlineInfoDto>();
		for(OrderDto order : orderList) {
			MyOnlineInfoDto online=cDao.getMyOnlineInfoOne(order.getOrd_code());
			onlineList.add(online);
		}

		mv.addObject("onlineList",onlineList);

		mv.setViewName("mypage/mypage_main");
		
		return mv;
	}

	//로그인 회원의 아이디로 수강 신청한 오프라인 강의의 목록을 가져온다.
	public ModelAndView getMyOfflineList() {
		mv=new ModelAndView();

		//email에 해당하는 회원의 오프라인 주문 내역을 가져온다.
		List<OrderDto> orderList=cDao.getOrderList(loginMember.getM_email(),"ofc_");	

		//주문 객체에 저장된 강의 코드로 내 수강 강의정보 목록을 저장한다.
		List<MyOffInfoDto> offlineList=new ArrayList<MyOffInfoDto>();
		for(OrderDto order : orderList) {
			MyOffInfoDto offline=cDao.getMyOffInfoOne(order.getOrd_code());
			offlineList.add(offline);
		}

		mv.setViewName("mypage/mypage_offline");
		mv.addObject("offlineList",offlineList);

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

	public ModelAndView updateMemberPwd(String newPwd) {
		mv=new ModelAndView();
		//변경할 비밀번호를 암호화한다.
		BCryptPasswordEncoder pwdEncode=new BCryptPasswordEncoder();
		
		String encodePwd=pwdEncode.encode(newPwd);
		
		int result=mDao.updateMemberPwd(loginMember.getM_email(),encodePwd);
		
		if(result>0) {
			mv.setViewName("redirect:/mypage");
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
				session.setAttribute("mb", member);
				loginMember=member;
				System.out.println(session);
				
				//리다이렉트로 화면을 전환.
				view = "redirect:/";
			}
			else {
				//패스워드 틀림.
				view = "redirect:loginFrm";
				msg = "패스워드 틀림.";
			}
		}
		else {
			//아이디 없음.
			view = "redirect:loginFrm";
			msg = "아이디 없음.";
		}
		
		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		return mv;
	}



	public String logout() {
		//세션 정보 지우기
		session.invalidate();
		
		return "home";
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
		mv=new ModelAndView();
		
		//회원의 쿠폰 목록을 가져온다.
		List<MyCouponDto> couponList=cmDao.getCouponList(loginMember.getM_email());
		
		mv.addObject("cpList",couponList);
		
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
		else if(sort.equals("online")) {
			//내 클래스 상태에서 환불중으로 변경
			cDao.mclUpdateState(order);
			
			mv.setViewName("redirect:./mypage");
		}
		
		
		return mv;
	}
//	크리에이터용 기능
	@Transactional
	public ModelAndView insertNewClass(MultipartHttpServletRequest multi) {
		mv=new ModelAndView();
		//파일 정보를 담을 리스트
		List<VideoFileDto> fileList=new ArrayList<VideoFileDto>();
		
		//온라인 강좌 정보를 저장한다.
		OnlineClassDto online=new OnlineClassDto();
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
			cDao.insertClassInfo(online);
			
			VideoDto vList=new VideoDto();
			vList.setV_onc_code(online.getOnc_code());
			
			//강의에 해당하는 동영상 목록 정보를 등록한다.
			cDao.insertVideoList(vList);
			log.info("v_code : " + vList.getV_code());
			
			//동영상 파일들을 반복해서 파일을 등록한다.
			for(int i=0;i<v_titles.length;i++) {
				VideoFileDto vFile=new VideoFileDto();
				String v_title=v_titles[i];
				vFile.setV_title(v_title);
				String v_content=v_contents[i];
				vFile.setV_content(v_content);
				vFile.setVf_v_code(vList.getV_code());
				
				videoUp(multi, vFile, "insert");;
			}
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("redirect:./cMypage");
		return mv;
	}


	public void videoUp(MultipartHttpServletRequest multi,VideoFileDto video,String sort) throws IllegalStateException, IOException {
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
		//실제 파일명과 저장 파일명을 저장하기 위한 hashmap
		Map<String , String> fmap=new HashMap<String, String>();
		//파일 정보 저장(db)에 필요한 정보
		//강의 번호,실제파일명,저장파일명
		

		//multi에서 파일 가져오기(여러개의 파일이 넘어 올 수도 있다.)
		List<MultipartFile> fList=multi.getFiles("video_files");

		for(int i=0;i<fList.size();i++) {
			MultipartFile mf=fList.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			//실제 파일명을 map에 저장
			fmap.put("vf_oriname",oriName);
			video.setVf_oriname(oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			//저장 파일명 map에 저장
			fmap.put("sysName",sysName);
			video.setVf_sysname(sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(path+sysName));

			if(sort.equals("insert")) {
				//db에 파일 저장
				cmDao.videoInsert(video);
			}
//				else if(sort.equals("update")) {
//				//db에 내용을 수정한다.
//				cmDao.updateFile(fmap);
//			}

		}

	}

}
