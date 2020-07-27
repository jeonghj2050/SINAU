package com.sinau.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.ClassDao;
import com.sinau.dao.MemberDao;
import com.sinau.dto.MyClassInfoDto;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.OrderDto;

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
	
	//로그인 회원의 그룹을 반환한다.
	public String getLoginMemberGroup(String email) {
		log.info("email : "+email);
		String group=mDao.getGroup(email);
		
		return group;
	}

	//로그인 회원의 온라인 강좌 목록과 view를 ModelAndView로 반환
	public ModelAndView getMyOnlineList(String email, String m_group) {
		mv=new ModelAndView();
		
		//email에 해당하는 회원의 온라인 주문 내역을 가져온다.
		List<OrderDto> orderList=cDao.getOrderList(email);	
		
		//주문 객체에 저장된 강의 코드로 내 수강 강의정보 목록을 저장한다.
		List<MyClassInfoDto> onlineList=new ArrayList<MyClassInfoDto>();
		for(OrderDto order : orderList) {
			MyClassInfoDto online=cDao.getMyClassInfoOne(order.getOrd_code());
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

}
