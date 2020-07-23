package com.sinau.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.MemberDao;
import com.sinau.dto.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	private ModelAndView mv;
	
	
	
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
			rttr.addFlashAttribute("msg", "���̵� �ߺ�");
		}
		
		mv.setViewName(view);
		return mv;
	}








}
