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
import com.sinau.dto.Member;


import com.sinau.dao.ClassDao;
import com.sinau.dao.MemberDao;
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
import com.sun.prism.paint.Stop;

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
	
	BCryptPasswordEncoder pwdEncode=new BCryptPasswordEncoder();

	public String idCheck(String memail) {
		String result = null;

		try {
			
			//cnt : �ߺ� id�� ���� ��� 1, ���� ��� 0
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



	public ModelAndView memberInsert(Member member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;
		
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		
		String encPwd= pwdEncoder.encode(member.getM_pwd());
		
		member.setM_pwd(encPwd);
		
		try {
			mDao.memberInsert(member);
			
			view="redirect:/";
			rttr.addFlashAttribute("msg", "���� ����");
		} catch (Exception e) {
			view="redirect:joinFrm";
			rttr.addFlashAttribute("msg", "���� ����");
		}
		
		mv.setViewName(view);
		return mv;
	}


	//로그인 회원의 그룹을 반환한다.
	public String getLoginMemberGroup(String email) {
		log.info("email : "+email);
		String group=mDao.getGroup(email);

		return group;
	}

	//로그인 회원의 온라인 강좌 목록과 view를 ModelAndView로 반환 , m_group > 회원마다 다른 메인 마이페이지를 띄워야 하므로
	public ModelAndView getMyOnlineList(String email, String m_group) {
		mv=new ModelAndView();

		//email에 해당하는 회원의 온라인 주문 내역을 가져온다.
		List<OrderDto> orderList=cDao.getOrderList(email,"onc_");	

		//주문 객체에 저장된 강의 코드로 내 수강 강의정보 목록을 저장한다.
		List<MyOnlineInfoDto> onlineList=new ArrayList<MyOnlineInfoDto>();
		for(OrderDto order : orderList) {
			MyOnlineInfoDto online=cDao.getMyOnlineInfoOne(order.getOrd_code());
			onlineList.add(online);
		}

		mv.addObject("onlineList",onlineList);

		if(m_group.equals("nm")) {
			mv.setViewName("mypage/mypage_main");
		}else if(m_group.equals("cm")) {
			mv.setViewName("mypage/cmypage_main");
		}else if(m_group.equals("dm")) {
			mv.setViewName("mypage/dmypage_main");
		}
		return mv;
	}

	//로그인 회원의 아이디로 수강 신청한 오프라인 강의의 목록을 가져온다.
	public ModelAndView getMyOfflineList(String email) {
		mv=new ModelAndView();

		//email에 해당하는 회원의 오프라인 주문 내역을 가져온다.
		List<OrderDto> orderList=cDao.getOrderList(email,"ofc_");	

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
	public ModelAndView getMemberInfo(String email) {
		mv=new ModelAndView();
		
		//마이페이지에 보여질 회원 정보를 가져온다.
		MyMemberInfoDto myInfo=mDao.getMemberInfo(email);
		mv.addObject("myInfo",myInfo);
		
		mv.setViewName("mypage/mypage_update");
		return mv;
	}

	public ModelAndView updateMemberPwd(String email,String newPwd) {
		mv=new ModelAndView();
		//변경할 비밀번호를 암호화한다.
		String encodePwd=pwdEncode.encode(newPwd);
		
		int result=mDao.updateMemberPwd(email,encodePwd);
		
		if(result>0) {
			mv.setViewName("redirect:/mypage");
		}
		
		
		return mv;
	}

	//회원의 이메일로 각 (상품,온라인, 오프라인) 주문 내역을 가져온다.
	public ModelAndView getAllOrders(String email) {
		mv=new ModelAndView();
		
		//상품 주문내역 목록을 가져온다.
		List<ProdOrdersDto> prodOrdList=sDao.getProdOrderList(email);
		//온라인 주문내역 목록을 가져온다.
		List<OnlineOrdersDto> onOrdList=cDao.getOnlineOrderList(email);
		//오프라인 주문내역 목록을 가져온다.
		List<OffOrdersDto> offOrdList=cDao.getOffOrderList(email);
		
		mv.addObject("prodOrder",prodOrdList);
		mv.addObject("onlineOrder",onOrdList);
		mv.addObject("offOrder",offOrdList);
		
		mv.setViewName("mypage/mypage_order");
		
		return mv;
	}

	//상품,온라인, 오프라인 좋아요 내역을 검색한다.
	public ModelAndView getAllLikes(String email) {
		mv=new ModelAndView();
		
		//온라인 강의의 좋아요 목록을 가져온다.
		List<OnlineLikeDto> onLike=cDao.getOnLikeList(email);
		//오프라인 강의의 좋아요 목록을 가져온다.
		List<OffLikeDto> offLike=cDao.getOffLikeList(email);
		//상품의 좋아요 목록을 가져온다.
		List<ProdLikeDto> prodLike=sDao.getProdLikeList(email);
		
		mv.addObject("onLikeList",onLike);
		mv.addObject("offLikeList",offLike);
		mv.addObject("prodLikeList",prodLike);
		
		mv.setViewName("mypage/mypage_like");
		
		return mv;
	}

}
