package com.sinau.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class SessionInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle - 인터셉트");
		
		//만약에 세션에 loginMember가 없다면 "/"로 강제 이동
		if(session.getAttribute("loginMember")==null) {
			response.sendRedirect("/");
			
			return false;
		}
		return true;
	}
	
	//세션이 없는 상태에서 뒤로가기를 막기 위해 브라우저의 캐시를 삭제
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(request.getProtocol().equals("HTTP/1.1")) {
			response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		}else {
			response.setHeader("Pragma", "no-cache");
		}
		response.setDateHeader("Expires", 0);
	}
}
