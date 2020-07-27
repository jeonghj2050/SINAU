package com.sinau.service;

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

import lombok.extern.java.Log;

@Service
@Log
public class MemberService {
	ModelAndView mv;
	@Autowired
	HttpSession session;
	@Autowired
	MemberDao mDao;
	@Autowired
	ClassDao cDao;
	@Autowired
	StoreDao sDao;
	@Autowired
	CommonDao cmDao;

	public String idCheck(String memail) {
		String result = null;

		try {

			// 1=아이디 있음 0=아이디 없음
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

	public ModelAndView memberInsert(MemberDto member, //MultipartHttpServletRequest multi, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		BCryptPasswordEncoder pwdEncode = new BCryptPasswordEncoder();

		String encPwd = pwdEncode.encode(member.getM_pwd());

		member.setM_pwd(encPwd);

		try {
			mDao.memberInsert(member);

			view = "redirect:/";
			rttr.addFlashAttribute("msg", "가입 성공");
		} catch (Exception e) {
			view = "redirect:joinFrm";
			rttr.addFlashAttribute("msg", "가입 실패");
		}

		mv.setViewName(view);
		return mv;
	}

	/*
	 * @Transactional public String boardInsert(MultipartHttpServletRequest multi,
	 * RedirectAttributes rttr) { String view = null;
	 * 
	 * //Multipart request에서 데이터 추출 String title = multi.getParameter("btitle");
	 * String contents = multi.getParameter("bcontents"); int fcheck =
	 * Integer.parseInt (multi.getParameter("fileCheck")); String id =
	 * multi.getParameter("bid"); //다음과 같이 세션에서 id값을 꺼내올 수도 있음. MemberDto mem =
	 * (MemberDto)session.getAttribute("mb"); String id = mem.getM_id();
	 * 
	 * 
	 * //일반적으로 textarea에서 들어오는 데이터는 //본 내용 앞 뒤에 쓸데없는 공백이 포함됨. //공백 제거 처리. trim()
	 * contents = contents.trim();
	 * 
	 * BoardDto board = new BoardDto(); board.setBid(id); board.setBtitle(title);
	 * board.setBcontents(contents);
	 * 
	 * //insert, update, delete를 할 경우 //웬만하면....... try/catch로 처리해 주세요... try {
	 * bDao.boardInsert(board);
	 * 
	 * view = "redirect:list"; rttr.addFlashAttribute("check", 2);
	 * 
	 * if(fcheck == 1) { //업로드할 파일이 있음. fileUp(multi, board.getBnum()); } }catch
	 * (Exception e) { //DB 삽입 오류 시 글쓰기폼으로 돌아감. view = "redirect:writeFrm";
	 * rttr.addFlashAttribute("check", 1); }
	 * 
	 * return view; }
	 * 
	 * private void fileUp (MultipartHttpServletRequest multi, int bnum) throws
	 * IllegalStateException, IOException { //파일은 실제 물리 경로를 사용하여 저장해야 함. // upload
	 * 폴더에 저장하도록 지정. // 상대 경로 : resources/upload/ String filePath =
	 * multi.getSession() .getServletContext() .getRealPath("/") +
	 * "resources/upload/";
	 * 
	 * //upload 폴더 만들기 File folder = new File(filePath); if(folder.isDirectory() ==
	 * false) { //경로를 설정한 폴더가 없다면 folder.mkdir();//upload 폴더 생성 }
	 * 
	 * //실제 파일명과 저장 파일명을 함께 관리 Map<String, String> fmap = new HashMap<String,
	 * String>(); //파일 정보 저장(DB)에 필요한 정보 //1.게시글 번호, 2.실제파일명, 3.저장파일명
	 * fmap.put("bnum", String.valueOf(bnum));
	 * 
	 * //multipart에서 파일 꺼내오기 //멀티파트는 파일을 배열형태로 저장. List<MultipartFile> fList =
	 * multi.getFiles("files");
	 * 
	 * for(int i = 0; i < fList.size(); i++) { MultipartFile mf = fList.get(i);
	 * //파일의 실제 이름 가져오기 String oriName = mf.getOriginalFilename(); //실제 파일명을 맵에 저장
	 * fmap.put("oriFileName", oriName); //저장 파일명 작성(밀리초 값을 사용) String sysName =
	 * System.currentTimeMillis() + "." + oriName.substring
	 * (oriName.lastIndexOf(".") + 1); fmap.put("sysFileName", sysName); //로그에 찍어서
	 * 확인
	 * 
	 * //저장 위치로 파일 전송 //새로 만든 파일이름으로 지정된 경로에 전송 mf.transferTo(new
	 * File(filePath+sysName)); //DB에 파일 정보 저장(dDao) bDao.fileInsert(fmap); } }
	 */

	// 로그인 회원의 그룹을 반환한다.
	public String getLoginMemberGroup(String email) {
		String group = mDao.getGroup(email);

		return group;
	}

	// 로그인 회원의 온라인 강좌 목록과 view를 ModelAndView로 반환 , m_group > 회원마다 다른 메인 마이페이지를 띄워야
	// 하므로
	public ModelAndView getMyOnlineList(String email, String m_group) {
		mv = new ModelAndView();

		// email에 해당하는 회원의 온라인 주문 내역을 가져온다.
		List<OrderDto> orderList = cDao.getOrderList(email, "onc_");

		// 주문 객체에 저장된 강의 코드로 내 수강 강의정보 목록을 저장한다.
		List<MyOnlineInfoDto> onlineList = new ArrayList<MyOnlineInfoDto>();
		for (OrderDto order : orderList) {
			MyOnlineInfoDto online = cDao.getMyOnlineInfoOne(order.getOrd_code());
			onlineList.add(online);
		}

		mv.addObject("onlineList", onlineList);

		if (m_group.equals("nm")) {
			mv.setViewName("mypage/mypage_main");
		} else if (m_group.equals("cm")) {
			mv.setViewName("mypage/cmypage_main");
		} else if (m_group.equals("dm")) {
			mv.setViewName("mypage/dmypage_main");
		}
		return mv;
	}

	// 로그인 회원의 아이디로 수강 신청한 오프라인 강의의 목록을 가져온다.
	public ModelAndView getMyOfflineList(String email) {
		mv = new ModelAndView();

		// email에 해당하는 회원의 오프라인 주문 내역을 가져온다.
		List<OrderDto> orderList = cDao.getOrderList(email, "ofc_");

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

	// 회원의 정보(회원+이미지)를 가져온다.
	public ModelAndView getMemberInfo(String email) {
		mv = new ModelAndView();

		// 마이페이지에 보여질 회원 정보를 가져온다.
		MyMemberInfoDto myInfo = mDao.getMemberInfo(email);
		mv.addObject("myInfo", myInfo);

		mv.setViewName("mypage/mypage_update");
		return mv;
	}

	public ModelAndView updateMemberPwd(String email, String newPwd) {
		mv = new ModelAndView();
		// 변경할 비밀번호를 암호화한다.
		BCryptPasswordEncoder pwdEncode = new BCryptPasswordEncoder();

		String encodePwd = pwdEncode.encode(newPwd);

		int result = mDao.updateMemberPwd(email, encodePwd);

		if (result > 0) {
			mv.setViewName("redirect:/mypage");
		}

		return mv;
	}

	// 회원의 이메일로 각 (상품,온라인, 오프라인) 주문 내역을 가져온다.
	public ModelAndView getAllOrders(String email) {
		mv = new ModelAndView();

		// 상품 주문내역 목록을 가져온다.
		List<ProdOrdersDto> prodOrdList = sDao.getProdOrderList(email);
		// 온라인 주문내역 목록을 가져온다.
		List<OnlineOrdersDto> onOrdList = cDao.getOnlineOrderList(email);
		// 오프라인 주문내역 목록을 가져온다.
		List<OffOrdersDto> offOrdList = cDao.getOffOrderList(email);

		mv.addObject("prodOrder", prodOrdList);
		mv.addObject("onlineOrder", onOrdList);
		mv.addObject("offOrder", offOrdList);

		mv.setViewName("mypage/mypage_order");

		return mv;
	}

	public ModelAndView loginProc(MemberDto member, RedirectAttributes rttr) {
		mv = new ModelAndView();// 화면으로 데이터 전송.

		String view = null;// 이동할 jsp 이름 저장 변수.
		String msg = null;// 화면에 출력할 메시지

		BCryptPasswordEncoder pwdEncode = new BCryptPasswordEncoder();
		// DB에서 해당 id의 password 가져오기.
		String get_pw = mDao.getPwd(member.getM_email());

		// 로그인 처리
		if (get_pw != null) {
			// 아이디 있음.
			if (pwdEncode.matches(member.getM_pwd(), get_pw)) {
				// 패스워드 맞음. 로그인 성공.
				// 세션에 로그인 성공한 회원 정보 저장
				// 로그인 한 회원의 정보를 가져오기.
				member = mDao.getMemInfo(member.getM_email());
				session.setAttribute("mb", member);
				System.out.println(session);

				// 리다이렉트로 화면을 전환.
				view = "redirect:/";
			} else {
				// 패스워드 틀림.
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

		mv.setViewName("mypage/mypage_like");

		return mv;
	}

	public ModelAndView getCouponList(String email) {
		mv = new ModelAndView();

		// 회원의 쿠폰 목록을 가져온다.
		List<MyCouponDto> couponList = cmDao.getCouponList(email);

		mv.addObject("cpList", couponList);

		mv.setViewName("mypage/mypage_coupon");

		return mv;
	}

	public Map<String, List<MyCouponDto>> inputCoupon(String email, String cp_code) {
		Map<String, List<MyCouponDto>> cMap = new HashMap<String, List<MyCouponDto>>();

		try {
			// 입력한 쿠폰 번호가 존재하는지 검사
			int result = cmDao.selectCoupon(cp_code);

			// 쿠폰이 존재한다면
			if (result == 1) {
				// 쿠폰 목록에 쿠폰을 추가한다.
				cmDao.inputMyCoupon(email, cp_code, "cpl_");

				// 추가 된 쿠폰을 포함한 쿠폰 목록을 가져온다.
				List<MyCouponDto> cList = cmDao.getCouponList(email);
				cMap.put("cpList", cList);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cMap;
	}

}
